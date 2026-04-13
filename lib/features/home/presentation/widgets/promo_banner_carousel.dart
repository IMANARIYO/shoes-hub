import 'dart:async';

import 'package:flutter/material.dart';

import 'package:shoes_hub_mobile_app/features/home/data/datasources/local/promo_banner_local_data.dart';
import 'package:shoes_hub_mobile_app/features/home/data/models/promo_banner_model.dart';
import 'promo_banner_card.dart';

class PromoBannerCarousel extends StatefulWidget {
  final void Function(PromoBanner banner)? onBannerTap;

  const PromoBannerCarousel({this.onBannerTap, super.key});

  @override
  State<PromoBannerCarousel> createState() => _PromoBannerCarouselState();
}

class _PromoBannerCarouselState extends State<PromoBannerCarousel> {
  late final PageController _pageController;
  int _currentIndex = 0;
  bool _isForward = true;
  late final List<PromoBanner> banners;
  Timer? _autoSlideTimer;
  static const _autoSlideDuration = Duration(seconds: 4);

  @override
  void initState() {
    super.initState();

    final now = DateTime.now();
    banners =
        promoBanners
            .where(
              (b) =>
                  b.active &&
                  (b.startDate == null || !now.isBefore(b.startDate!)) &&
                  (b.endDate == null || !now.isAfter(b.endDate!)),
            )
            .toList()
          ..sort((a, b) => a.position.compareTo(b.position));

    _pageController = PageController(
      initialPage: _currentIndex,
      viewportFraction: 0.9,
    );

    _startAutoSlide();
  }

  void _startAutoSlide() {
    _autoSlideTimer?.cancel();

    _autoSlideTimer = Timer.periodic(_autoSlideDuration, (_) {
      if (!mounted || banners.isEmpty) return;

      int nextIndex;

      if (_isForward) {
        nextIndex = _currentIndex + 1;
        if (nextIndex >= banners.length - 1) {
          _isForward = false;
        }
      } else {
        nextIndex = _currentIndex - 1;
        if (nextIndex <= 0) {
          _isForward = true;
        }
      }

      _pageController.animateToPage(
        nextIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  void _stopAutoSlide() {
    _autoSlideTimer?.cancel();
    _autoSlideTimer = null;
  }

  @override
  void dispose() {
    _stopAutoSlide();
    _pageController.dispose();
    super.dispose();
  }

  void _handleTap(PromoBanner banner) {
    if (widget.onBannerTap != null) {
      widget.onBannerTap!(banner);
      return;
    }

    switch (banner.targetType) {
      case 'CATEGORY':
        debugPrint('Navigate to CATEGORY: ${banner.targetValue}');
        break;
      case 'COLLECTION':
        debugPrint('Navigate to COLLECTION: ${banner.targetValue}');
        break;
      case 'URL':
        debugPrint('Navigate to URL: ${banner.targetValue}');
        break;
      default:
        debugPrint('Tapped banner: ${banner.title}');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (banners.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        const SizedBox(height: 12),
        SizedBox(
          height: 200,
          child: MouseRegion(
            onEnter: (_) {
              _stopAutoSlide();
            },
            onExit: (_) {
              _startAutoSlide();
            },
            child: PageView.builder(
              controller: _pageController,
              itemCount: banners.length,
              onPageChanged: (int index) {
                setState(() {
                  _isForward = index >= _currentIndex;
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: PromoBannerCard(
                    banner: banners[index],
                    onTap: () => _handleTap(banners[index]),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 12),
        _buildIndicators(),
      ],
    );
  }

  Widget _buildIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(banners.length, (index) {
        final isActive = index == _currentIndex;
        return GestureDetector(
          onTap: () {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );

            _startAutoSlide();
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: isActive ? 24 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: isActive ? Colors.black : Colors.grey.shade400,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      }),
    );
  }
}
