import 'package:flutter/material.dart';
import 'package:shoes_hub_mobile_app/features/home/presentation/widgets/category_carousel.dart';
import 'package:shoes_hub_mobile_app/features/home/presentation/widgets/promo_banner_carousel.dart';
import 'package:shoes_hub_mobile_app/features/home/presentation/widgets/section_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: const Color.fromARGB(255, 253, 251, 251),
        elevation: 6,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
        ),
        leading: IconButton(
          splashRadius: 10,
          icon: const Icon(Icons.menu),
          color: Colors.black87,
          onPressed: () {},
        ),
        title: Align(
          alignment:
              Alignment.centerLeft, // align the column to start horizontally
          child: Column(
            mainAxisSize: MainAxisSize.min, // take minimal vertical space
            crossAxisAlignment:
                CrossAxisAlignment.start, // align texts to start
            children: const [
              Text(
                "Shoes Hub app",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                "Fresh kicks daily",
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
            ],
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black12, width: 1),
            ),
            child: const Badge(
              label: Text("4"),
              child: Icon(Icons.notifications),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PromoBannerCarousel(
              onBannerTap: (banner) {
                debugPrint(
                  'Tapped banner: ${banner.targetType} → ${banner.targetValue}',
                );
              },
            ),
            const SizedBox(height: 16),
            _buildSearchBar(),
            const SizedBox(height: 16),
            SectionTitle(
              title: "Categories",
              leadingIcon: Icons.category,
              goToRoute: '/categories', // your GoRouter path
            ),
            SizedBox(
              height: 120,
              width: double.infinity,
              child: CategoryCarousel(),
            ),
            const SizedBox(height: 24),
            SectionTitle(
              title: "Featured",
              leadingIcon: Icons.star_border,
              goToRoute: '/featured',
            ),
            _buildProductList(),
            const SizedBox(height: 24),
            SectionTitle(
              title: "New Arrivals",
              leadingIcon: Icons.fiber_new,
              goToRoute: '/new-arrivals',
            ),
            _buildProductList(),
            const SizedBox(height: 24),
            SectionTitle(
              title: "Popular",
              leadingIcon: Icons.trending_up,
              goToRoute: '/popular',
            ),
            _buildProductList(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search shoes...",
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.grey.shade100,
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildProductList() {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 160,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Nike Air Max",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text("\$120", style: TextStyle(color: Colors.deepPurple)),
              ],
            ),
          );
        },
        separatorBuilder: (_, _) => const SizedBox(width: 16),
        itemCount: 6,
      ),
    );
  }
}
