# Shoes Hub — Flutter Mobile App

> A production-grade mobile application for **Shoes Traders** — built for businesses that sell shoes and need a fast, scalable, and maintainable client app backed by a real REST API.

---

## What Is This?

Shoes Hub is the Flutter mobile client for the **Shoes Hub platform** — a full-stack shoes trading system.
The app connects to a Spring Boot REST API backed by MySQL, and allows customers to browse shoes, manage their cart, place orders, and track deliveries.

This app is built to be handed off to a new developer, extended weekly with new features, or reused as a template for other business clients — because it follows real clean architecture.

---

## The Full System

The Shoes Hub platform consists of two projects:

| Project | Tech | Role |
|---------|------|------|
| `shoes_hub_spring_boot_api` | Spring Boot 3 · MySQL · JWT | REST API backend |
| `shoes_hub_mobile_app` | Flutter · Dart · GoRouter | Mobile client (this project) |

---

## Backend Overview (Spring Boot API)

The backend is a Spring Boot 3.4 REST API with JWT authentication, role-based access control, Cloudinary image uploads, email/OTP verification, and full order management.

### Tech Stack

| Layer | Technology |
|-------|-----------|
| Framework | Spring Boot 3.4.11 |
| Language | Java 17 |
| Database | MySQL (via JPA/Hibernate) |
| Auth | JWT (jjwt 0.12.6) — access + refresh tokens |
| Security | Spring Security 6 + method-level `@PreAuthorize` |
| Image Storage | Cloudinary |
| Email | Spring Mail (SMTP) |
| API Docs | SpringDoc OpenAPI (Swagger UI) |
| Logging | AOP-based request/response logging |
| Build | Maven |
| Container | Docker (eclipse-temurin:21-jre-alpine) |

### Backend Package Structure

```
com.inventory.inventory_system/
├── config/           # SecurityConfig, JWTFilter, CORS, OpenAPI, PublicEndpoints
├── common/           # BaseEntity, StandardApiResponse, PaginatedResponse, AOP logging
├── enums/            # OrderStatus, PaymentStatus, CartStatus, UserStatus, DeliveryStatus
├── exception/        # GlobalExceptionHandler, ResourceNotFoundException
│
├── user/             # Registration, login, OTP, password reset, role management
├── brand/            # Brand CRUD
├── category/         # Shoe category CRUD
├── gender/           # Gender CRUD (Men, Women, Unisex)
├── material/         # Material CRUD (Leather, Canvas, Synthetic)
├── sizesystem/       # Size system CRUD
├── product/          # Product CRUD with filters, projections, slug lookup
├── productVariant/   # SKU-level variants (size, color, price, stock)
├── productImage/     # Product image management (Cloudinary)
├── cart/             # Cart lifecycle (ACTIVE → CHECKED_OUT → ABANDONED)
├── cartItem/         # Cart item management
├── order/            # Order placement and status management
├── orderStatusHistory/ # Full audit trail of order status changes
├── delivery/         # Delivery agent assignment and real-time tracking
├── payments/         # Payment recording and status
├── favorites/        # User wishlist
├── reviews/          # Product reviews and ratings
├── coupon/           # Discount coupon management
├── notification/     # Notification + recipient targeting (user or role)
├── userAddress/      # Delivery addresses with GPS coordinates
├── promoBanner/      # Promotional banners
├── auditLogs/        # Full audit log of entity changes
└── seed/             # Database seeders (brands, categories, products, variants)
```

### Authentication Flow

```
POST /api/users/register     → creates account, sends OTP email
POST /api/users/verify-email → verifies OTP, activates account
POST /api/users/login        → returns { accessToken, refreshToken }
POST /api/users/refresh      → exchanges refresh token for new access token
POST /api/users/forgot-password → sends reset OTP
POST /api/users/reset-password  → resets password with OTP
```

JWT tokens carry: `userId`, `role`, `fullName`, `email`, `permissions`
- Access token: 1 hour
- Refresh token: 7 days

### Security Rules

| Endpoint pattern | Access |
|-----------------|--------|
| `GET /api/products/**` | Public |
| `GET /api/genders/**` | Public |
| `GET /api/materials/**` | Public |
| `GET /api/shoe-categories/**` | Public |
| `GET /api/product-variants/public/**` | Public |
| `POST/PUT /api/products/**` | Authenticated |
| `DELETE /api/products/**` | Authenticated |
| `/api/admin/**` | `ROLE_ADMIN` only |
| `/api/users/**` | Authenticated |
| Everything else | Authenticated |

### Environment Variables (`.env`)

```env
DB_HOST=localhost
DB_PORT=3306
DB_NAME=shoes_hub
DB_USERNAME=root
DB_PASSWORD=yourpassword
PORT=9000

CLOUDINARY_CLOUD_NAME=your_cloud_name
CLOUDINARY_API_KEY=your_api_key
CLOUDINARY_API_SECRET=your_api_secret

SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USERNAME=your@email.com
SMTP_PASSWORD=your_app_password
```

### Running the API

```bash
# With Maven
./mvnw spring-boot:run

# With Docker
docker build -t shoes-hub-api .
docker run -p 9000:9000 --env-file .env shoes-hub-api
```

API docs available at: `http://localhost:9000/api-documentation`

---

## Database Schema (ERD)

### Enums

| Enum | Values |
|------|--------|
| `order_status` | `PENDING`, `PROCESSING`, `SHIPPED`, `DELIVERED`, `CANCELLED` |
| `payment_status` | `UNPAID`, `PAID`, `FAILED`, `REFUNDED` |
| `cart_status` | `ACTIVE`, `CHECKED_OUT`, `ABANDONED` |
| `user_status` | `ACTIVE`, `SUSPENDED`, `BANNED` |

### Core Tables

**users** — registered customers and admins
- `id`, `full_name`, `email`, `password`, `phone_number`, `image_url`
- `role_id` → roles
- `status` (ACTIVE / SUSPENDED / BANNED)
- `is_email_verified`, `is_phone_verified`
- `otp_code`, `otp_expiry` — for OTP login/verification
- `email_verification_token`, `email_verification_expiry`

**roles** + **permissions** + **role_permissions** — RBAC
- Roles: ADMIN, CUSTOMER, DELIVERY_AGENT, etc.
- Permissions are granular actions assigned to roles

**user_addresses** — delivery addresses per user
- `street`, `building`, `city`, `state`, `postal_code`, `country`
- `latitude`, `longitude` — for map/delivery routing
- `is_default` — marks the primary address

---

**categories** — shoe categories (Sneakers, Running, Boots, etc.)

**brands** — shoe brands (Nike, Adidas, Puma, etc.)

**genders** — Men, Women, Unisex

**materials** — Leather, Canvas, Synthetic, etc.

**products** — the main product record
- Links to `category`, `brand`, `gender`, `material`
- `slug` — URL-friendly unique identifier
- `is_active`, `is_published`, `is_featured` flags
- SEO fields: `meta_title`, `meta_description`

**product_variants** — SKU-level records per product
- `sku`, `size`, `color`
- `cost_price`, `base_price`, `discount_price`
- `stock_quantity`
- One product → many variants (e.g., Nike Air Max in size 42, Brown)

**product_images** — multiple images per product
- `image_url`, `alt_text`, `is_primary`

---

**carts** — one active cart per user
- `status`: ACTIVE → CHECKED_OUT (on order) or ABANDONED
- `total_amount`, optional `coupon_id`

**cart_items** — items inside a cart
- Links to `product_variant`
- `quantity`, `unit_price`, `total`

---

**orders** — placed orders
- Links to `user`, `cart`, `address`
- `total_amount`
- `status` (order_status enum)
- `payment_status` (payment_status enum)

**order_items** — snapshot of items at order time
- `price` and `total` captured at order time (price-lock)

**order_status_history** — full audit trail
- Every status change recorded with `changed_by_id` and optional `note`

---

**deliveries** — delivery tracking per order
- `delivery_agent_id` → user (agent)
- `status`: PENDING → ACCEPTED → IN_TRANSIT → DELIVERED
- `current_latitude`, `current_longitude` — real-time GPS
- `confirmed_at`, `picked_up_at`, `delivered_at` timestamps

**payments** — payment records per order
- `method`, `status`, `transaction_id`, `provider_response` (JSON)

---

**favorites** — user wishlist
- Can favorite a product or a specific variant

**reviews** — product reviews
- `rating`, `title`, `comment`
- `is_verified` — verified buyer flag

**recently_viewed_products** — browsing history per user

**coupons** — discount codes
- `discount_percentage`, `max_discount_amount`, `min_cart_amount`
- `usage_limit`, `used_count`, `valid_from`, `valid_until`
- `is_single_use`, `is_active`

**notifications** + **notification_recipients**
- Notifications can target a specific user or all users with a role
- `is_read`, `read_at` per recipient

**audit_logs** — system-wide change log
- `entity_name`, `entity_id`, `action` (CREATE/UPDATE/DELETE)
- `old_data`, `new_data` (JSON snapshots)

---

## Mobile App Architecture

The Flutter app follows **Clean Architecture** with a **feature-first** folder structure.
Every feature is fully self-contained — it owns its own data, domain, and presentation layers.

### Folder Structure

```
lib/
├── core/                        # App-wide logic only — no UI
│   ├── constants/               # API endpoints, app constants, route names, asset paths
│   ├── dependency_injection/    # app_providers.dart — wires all providers
│   ├── enums/                   # OrderStatus, ViewState
│   ├── error/                   # Exceptions, Failures
│   ├── services/                # ApiService (Dio), StorageService, NotificationService
│   └── utils/                   # Formatters, Validators, Helpers
│
├── config/                      # App-level configuration
│   ├── routes/                  # GoRouter — app_router.dart
│   ├── themes/                  # ThemeData, AppColors, AppTextStyles
│   └── env/                     # Environment config
│
├── shared/                      # Reusable UI widgets (used by 2+ features)
│   └── widgets/
│       ├── common/              # AppAppBar, AppLoader, PrimaryButton
│       └── shared/              # ProductCard, StepperWidget, PlayfulTitleBlock
│
├── features/
│   ├── auth/
│   ├── product/
│   ├── home/
│   ├── cart/
│   ├── order/
│   ├── checkout/
│   ├── profile/
│   └── admin/
│
├── app.dart
└── main.dart
```

### Per-Feature Structure

Every feature follows the same 3-layer pattern:

```
features/<feature>/
├── data/
│   ├── models/          # JSON-serializable models (fromJson / toMap)
│   ├── datasources/
│   │   ├── local/       # Static data, SharedPreferences, SQLite
│   │   └── remote/      # API calls via ApiService
│   └── repositories/    # Implements domain contracts
│
├── domain/
│   ├── entities/        # Pure Dart — no Flutter, no JSON
│   ├── repositories/    # Abstract interfaces
│   └── usecases/        # One class = one business action
│
└── presentation/
    ├── screens/         # Full-page Scaffold widgets
    ├── widgets/         # Feature-specific UI components
    └── state/           # Providers / state notifiers
```

### Data Flow

```
Screen → Provider (state/) → UseCase (domain/) → Repository interface
                                                        ↓
                                              Repository impl (data/)
                                                        ↓
                                              DataSource → API / Local
```

### Features

| Feature | Screens | Responsibility |
|---------|---------|---------------|
| `auth` | Login, Signup, OTP | Registration, login, OTP verification |
| `product` | ProductList, ProductDetail, Genders, Materials | Browse and search products |
| `home` | Home, Categories, CategoryDetail | Home feed, promo banners, category carousel |
| `cart` | Cart | Add/remove items, update quantities |
| `order` | OrderHistory | View past orders |
| `checkout` | Checkout | Address selection, payment, order placement |
| `profile` | Profile | View and edit user profile |
| `admin` | AdminDashboard | Admin stats and management |

### Mobile Tech Stack

| Concern | Package |
|---------|---------|
| Navigation | `go_router` |
| State Management | Provider / ChangeNotifier |
| HTTP Client | `dio` (via ApiService) |
| Local Storage | `shared_preferences` |
| Image Loading | `cached_network_image` |

---

## Getting Started

### Prerequisites

- Flutter SDK 3.x
- Dart 3.x
- Android Studio / VS Code
- Running instance of the Spring Boot API

### Setup

```bash
# Clone the repo
git clone <repo-url>
cd shoes_hub_mobile_app

# Install dependencies
flutter pub get

# Run on device/emulator
flutter run
```

### Connecting to the API

Update the base URL in `lib/core/constants/api_endpoints.dart`:

```dart
static const String baseUrl = 'http://<your-api-host>:9000';
```

For Android emulator pointing to local machine: `http://10.0.2.2:9000`
For physical device on same network: `http://<your-local-ip>:9000`

---

## Adding a New Feature

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

Then register the provider in `core/dependency_injection/app_providers.dart` and add the route in `config/routes/app_router.dart`.

---

## Architecture Rules

1. Features never import from another feature's `data/` or `domain/`
2. `domain/` is pure Dart — zero Flutter imports
3. Screens never call the API directly — always through Provider → UseCase → Repository
4. Models handle JSON; entities handle business logic — they are separate classes
5. Providers live in `presentation/state/` — not at the feature root
6. Shared UI lives in `shared/widgets/` — not in `core/`
7. Routing and themes live in `config/` — not in `core/`

---

## Project Status

| Module | API | Mobile |
|--------|-----|--------|
| Auth (login, signup, OTP) | ✅ | 🔧 In progress |
| Products & Variants | ✅ | 🔧 In progress |
| Categories / Brands / Genders | ✅ | ✅ |
| Promo Banners | ✅ | ✅ |
| Cart | ✅ | 🔧 In progress |
| Orders | ✅ | 🔧 In progress |
| Delivery Tracking | ✅ | 🔜 Planned |
| Payments | ✅ | 🔜 Planned |
| Reviews | ✅ | 🔜 Planned |
| Favorites | ✅ | 🔜 Planned |
| Notifications | ✅ | 🔜 Planned |
| Admin Dashboard | ✅ | 🔧 In progress |
