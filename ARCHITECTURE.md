# Shoes Hub Mobile App — Architecture Documentation

## Overview

This project follows **Clean Architecture** with a **feature-first** folder structure.
Each feature is fully self-contained: it owns its own data, domain, and presentation layers.
No feature depends on another feature's internals.

---

## Folder Structure

```
lib/
├── core/                        # Pure app-wide logic (no UI, no feature logic)
│   ├── constants/               # API endpoints, app constants, route names, asset paths
│   ├── dependency_injection/    # Provider/DI wiring (app_providers.dart)
│   ├── enums/                   # Shared enums (OrderStatus, ViewState)
│   ├── error/                   # Exceptions and Failure classes
│   ├── services/                # App-wide services (ApiService, StorageService, NotificationService)
│   └── utils/                   # Formatters, helpers, validators
│
├── config/                      # App-level configuration
│   ├── routes/                  # GoRouter setup (app_router.dart)
│   ├── themes/                  # ThemeData, AppColors, AppTextStyles
│   └── env/                     # Environment variables (base URLs, keys)
│
├── shared/                      # Reusable UI widgets used across features
│   └── widgets/
│       ├── common/              # AppBar, AppLoader, PrimaryButton
│       └── shared/              # ProductCard, StepperWidget, PlayfulTitleBlock
│
├── features/                    # One folder per business feature
│   ├── auth/
│   ├── product/
│   ├── home/
│   ├── cart/
│   ├── order/
│   ├── checkout/
│   ├── profile/
│   └── admin/
│
├── app.dart                     # Root MaterialApp widget
└── main.dart                    # Entry point
```

---

## Feature Structure (per feature)

Every feature follows the same 3-layer structure:

```
features/<feature_name>/
├── data/
│   ├── models/          # JSON-serializable data models (fromJson/toMap)
│   ├── datasources/
│   │   ├── local/       # Static/local data, SharedPreferences, SQLite
│   │   └── remote/      # API calls via ApiService (Dio)
│   └── repositories/    # Implements domain repository contracts
│
├── domain/
│   ├── entities/        # Pure Dart classes — no Flutter, no JSON
│   ├── repositories/    # Abstract contracts (interfaces)
│   └── usecases/        # One class per business action
│
└── presentation/
    ├── screens/         # Full-page widgets (Scaffold)
    ├── widgets/         # Feature-specific reusable widgets
    └── state/           # Providers / state notifiers (ChangeNotifier, Riverpod, etc.)
```

---

## Layer Responsibilities

### `data/`
- Talks to the outside world (API, local storage, static data)
- Models have `fromJson` / `toMap` — they know about JSON
- Repository implementations fulfill the domain contracts

### `domain/`
- The heart of the feature — pure Dart, zero Flutter dependencies
- Entities are plain Dart classes (no `fromJson`)
- Repository interfaces define *what* can be done, not *how*
- UseCases are single-responsibility: one class = one action

### `presentation/`
- Screens and widgets only talk to UseCases via providers/state
- Providers hold UI state and call UseCases
- Screens never import from `data/` directly

---

## Data Flow

```
UI (Screen)
  └── reads/calls → Provider (state/)
        └── calls → UseCase (domain/usecases/)
              └── calls → Repository interface (domain/repositories/)
                    └── implemented by → Repository impl (data/repositories/)
                          └── calls → DataSource (data/datasources/)
                                └── calls → API / Local storage
```

This means:
- UI never touches the API
- Domain never touches Flutter
- Features are independent and deletable

---

## Feature Breakdown

### `auth`
Handles login, signup, and OTP verification.

```
auth/
├── data/
│   ├── models/              # UserModel
│   ├── datasources/remote/  # AuthRemoteDatasource (login/signup API calls)
│   └── repositories/        # AuthRepositoryImpl
├── domain/
│   ├── entities/            # UserEntity
│   ├── repositories/        # AuthRepository (abstract)
│   └── usecases/            # LoginUseCase, SignupUseCase
└── presentation/
    ├── screens/             # LoginScreen, SignupScreen, OtpScreen
    ├── widgets/             # LoginForm, OtpInput
    └── state/               # AuthProvider, OtpProvider
```

### `product`
Handles product listing, detail, categories, genders, materials, and search.

```
product/
├── data/
│   ├── models/              # Product, ProductVariant, Category, Brand, Gender, MaterialModel
│   ├── datasources/
│   │   ├── local/           # product_category_local_data, product_variant_local_data
│   │   └── remote/          # ProductRemoteDatasource
│   └── repositories/        # ProductRepositoryImpl
├── domain/
│   ├── entities/            # ProductEntity, CategoryEntity
│   ├── repositories/        # ProductRepository (abstract)
│   └── usecases/            # GetProductsUseCase, GetCategoriesUseCase
└── presentation/
    ├── screens/             # ProductListScreen, ProductDetailScreen, GendersScreen, MaterialsScreen
    ├── widgets/             # (feature-specific product widgets)
    └── state/               # ProductProvider, ProductDetailProvider, SearchProvider
```

### `home`
Handles the home feed: promo banners and category carousel.

```
home/
├── data/
│   ├── models/              # PromoBannerModel
│   └── datasources/local/   # promo_banner_local_data
├── domain/
│   ├── entities/            # PromoBannerEntity
│   ├── repositories/        # HomeRepository (abstract)
│   └── usecases/            # GetActivePromoBannersUseCase
└── presentation/
    ├── screens/             # HomeScreen, CategoriesScreen, CategoryDetailScreen
    ├── widgets/             # PromoBannerCarousel, PromoBannerCard, CategoryCarousel, CategoryCard, CategoryTile, SectionTitle
    └── state/               # HomeProvider
```

### `cart`
Handles add-to-cart, quantity updates, and cart display.

```
cart/
├── data/
│   ├── models/              # CartItemModel, CartModel
│   ├── datasources/local/   # CartLocalDatasource
│   └── repositories/        # CartRepositoryImpl
├── domain/
│   ├── entities/            # CartItemEntity
│   ├── repositories/        # CartRepository (abstract)
│   └── usecases/            # AddToCartUseCase
└── presentation/
    ├── screens/             # CartScreen
    ├── widgets/             # (cart item widgets)
    └── state/               # CartProvider
```

### `order`
Handles order history and order placement.

```
order/
├── data/
│   ├── models/              # OrderModel
│   ├── datasources/remote/  # OrderRemoteDatasource
│   └── repositories/        # OrderRepositoryImpl
├── domain/
│   ├── entities/            # OrderEntity
│   ├── repositories/        # OrderRepository (abstract)
│   └── usecases/            # GetOrderHistoryUseCase
└── presentation/
    ├── screens/             # OrderHistoryScreen
    ├── widgets/             # (order item widgets)
    └── state/               # OrderProvider
```

### `checkout`
Handles the checkout flow (address, payment, confirmation).

```
checkout/
├── data/repositories/       # CheckoutRepositoryImpl
├── domain/usecases/         # PlaceOrderUseCase
└── presentation/
    ├── screens/             # CheckoutScreen
    ├── widgets/             # (checkout step widgets)
    └── state/               # CheckoutProvider
```

### `profile`
Handles user profile view and edit.

```
profile/
├── data/
│   ├── models/              # (UserModel reused from auth or own model)
│   └── repositories/        # ProfileRepositoryImpl
├── domain/
│   ├── entities/            # (UserEntity reused from auth)
│   ├── repositories/        # ProfileRepository (abstract)
│   └── usecases/            # GetProfileUseCase, UpdateProfileUseCase
└── presentation/
    ├── screens/             # ProfileScreen
    ├── widgets/             # (profile widgets)
    └── state/               # ProfileProvider
```

### `admin`
Handles admin dashboard and stats.

```
admin/
├── domain/usecases/         # GetAdminStatsUseCase
└── presentation/
    ├── screens/             # AdminDashboardScreen
    └── state/               # AdminStatsProvider
```

---

## `core/` — What Belongs Here

Only things that are **truly app-wide** and have **no feature ownership**:

| Folder | Contents |
|--------|----------|
| `constants/` | `ApiEndpoints`, `AppConstants`, `RouteNames`, `AssetPaths` |
| `enums/` | `OrderStatus`, `ViewState` |
| `error/` | `AppException`, `Failure` base classes |
| `services/` | `ApiService` (Dio client), `StorageService`, `NotificationService` |
| `utils/` | `Formatters`, `Validators`, `Helpers` |
| `dependency_injection/` | `AppProviders` — wires all providers together |

---

## `config/` — App Configuration

| Folder | Contents |
|--------|----------|
| `routes/` | `AppRouter` (GoRouter definition with all routes) |
| `themes/` | `ThemeManager`, `AppColors`, `AppTextStyles` |
| `env/` | Base URLs, API keys, environment flags |

---

## `shared/widgets/` — Cross-Feature UI

Widgets that are used by **more than one feature** live here, not in `core/`.

| Folder | Contents |
|--------|----------|
| `common/` | `AppAppBar`, `AppLoader`, `PrimaryButton` |
| `shared/` | `ProductCard`, `StepperWidget`, `PlayfulTitleBlock` |

---

## Key Rules

1. **Features are independent** — feature A never imports from feature B's `data/` or `domain/`
2. **Domain is pure Dart** — no Flutter imports in `domain/`
3. **UI never calls API directly** — always goes through Provider → UseCase → Repository
4. **Models ≠ Entities** — models handle JSON, entities handle business logic
5. **Providers live in `presentation/state/`** — not at the feature root
6. **Shared UI lives in `shared/widgets/`** — not in `core/`
7. **Routing and themes live in `config/`** — not in `core/`

---

## Adding a New Feature (Template)

```
features/new_feature/
├── data/
│   ├── models/new_feature_model.dart
│   ├── datasources/remote/new_feature_remote_datasource.dart
│   └── repositories/new_feature_repository_impl.dart
├── domain/
│   ├── entities/new_feature_entity.dart
│   ├── repositories/new_feature_repository.dart   ← abstract
│   └── usecases/get_new_feature_usecase.dart
└── presentation/
    ├── screens/new_feature_screen.dart
    ├── widgets/
    └── state/new_feature_provider.dart
```

Then register the provider in `core/dependency_injection/app_providers.dart`.

---

## Why This Architecture?

| Problem (Before) | Solution (After) |
|------------------|-----------------|
| Global `data/` folder — all features coupled | Each feature owns its own `data/` |
| No `domain/` layer — UI talked to repositories | `domain/` with UseCases decouples UI from data |
| `core/` mixed UI + logic + config | UI → `shared/`, config → `config/`, logic stays in `core/` |
| Providers at feature root | Providers in `presentation/state/` |
| Hard to delete or reuse a feature | Features are now fully self-contained |
