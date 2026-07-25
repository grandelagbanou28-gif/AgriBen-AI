import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import '../widgets/market_price_card.dart';

class MarketplaceScreen extends StatefulWidget {
  final VoidCallback? onNavigateToMessages;

  const MarketplaceScreen({super.key, this.onNavigateToMessages});

  @override
  State<MarketplaceScreen> createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {
  String _selectedCategory = 'Tous';
  final List<String> _categories = ['Tous', 'Céréales', 'Légumes', 'Fruits', 'Oléagineux'];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Text('Marché', style: AppTextStyles.h1),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Rechercher un produit...',
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.textMuted,
                    size: 22,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  filled: false,
                  hintStyle: AppTextStyles.body.copyWith(color: AppColors.textMuted),
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final isSelected = _selectedCategory == _categories[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedCategory = _categories[index]),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.forestGreen : AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected ? AppColors.forestGreen : AppColors.border,
                        ),
                      ),
                      child: Text(
                        _categories[index],
                        style: AppTextStyles.bodySmall.copyWith(
                          color: isSelected ? Colors.white : AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Prix du marché', style: AppTextStyles.h3),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 110,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: const [
                MarketPriceCard(
                  name: 'Maïs',
                  emoji: '🌽',
                  price: 250,
                  change: 5,
                ),
                SizedBox(width: 10),
                MarketPriceCard(
                  name: 'Tomate',
                  emoji: '🍅',
                  price: 400,
                  change: -3,
                ),
                SizedBox(width: 10),
                MarketPriceCard(
                  name: 'Soja',
                  emoji: '🫘',
                  price: 350,
                  change: 8,
                ),
                SizedBox(width: 10),
                MarketPriceCard(
                  name: 'Anacarde',
                  emoji: '🥜',
                  price: 1200,
                  change: 2,
                ),
                SizedBox(width: 10),
                MarketPriceCard(
                  name: 'Ananas',
                  emoji: '🍍',
                  price: 500,
                  change: -1,
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
            child: Text('Produits proches', style: AppTextStyles.h3),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
              childAspectRatio: 0.72,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ProductCard(
                  product: MarketProduct.samples[index],
                  onContact: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Message envoyé à ${MarketProduct.samples[index].producer}',
                        ),
                        backgroundColor: AppColors.forestGreen,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    );
                  },
                );
              },
              childCount: MarketProduct.samples.length,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
            child: Text('Meilleurs producteurs', style: AppTextStyles.h3),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              children: [
                _buildProducerAvatar('Koffi A.', '4.9', 'Soja, Maïs', AppColors.forestGreen),
                const SizedBox(width: 14),
                _buildProducerAvatar('Coop. Zè', '4.8', 'Céréales', AppColors.natureGreen),
                const SizedBox(width: 14),
                _buildProducerAvatar('Adjovi M.', '4.7', 'Légumes', AppColors.gold),
                const SizedBox(width: 14),
                _buildProducerAvatar('Ferme Akp.', '4.6', 'Fruits', AppColors.forestGreen),
                const SizedBox(width: 14),
                _buildProducerAvatar('Sèhè P.', '4.9', 'Anacarde', AppColors.natureGreen),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 100),
        ),
      ],
    );
  }

  Widget _buildProducerAvatar(String name, String rating, String products, Color color) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              shape: BoxShape.circle,
              border: Border.all(color: color.withValues(alpha: 0.3), width: 2),
            ),
            child: Center(
              child: Text(
                name[0],
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, color: AppColors.gold, size: 10),
              const SizedBox(width: 2),
              Text(
                rating,
                style: AppTextStyles.caption,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
