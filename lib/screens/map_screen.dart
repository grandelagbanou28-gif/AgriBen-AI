import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  String _selectedFilter = 'Tous';
  final List<String> _filters = ['Tous', 'Marchés', 'Producteurs', 'Coopératives', 'Fournisseurs'];

  final List<_MapMarker> _markers = const [
    _MapMarker(
      name: 'Marché de Dantokpa',
      type: 'Marché',
      address: 'Dantokpa, Cotonou',
      rating: 4.5,
      emoji: '🏪',
      color: Color(0xFFE65100),
      lat: 6.3654,
      lng: 2.4183,
    ),
    _MapMarker(
      name: 'Coopérative Zè',
      type: 'Coopérative',
      address: 'Zè, Atlantique',
      rating: 4.8,
      emoji: '🤝',
      color: Color(0xFF1565C0),
      lat: 6.5100,
      lng: 2.3500,
    ),
    _MapMarker(
      name: 'Ferme Akpédjè',
      type: 'Producteur',
      address: 'Allada, Atlantique',
      rating: 4.6,
      emoji: '👨‍🌾',
      color: AppColors.natureGreen,
      lat: 6.4000,
      lng: 2.1500,
    ),
    _MapMarker(
      name: 'Agro-Distribution Bénin',
      type: 'Fournisseur',
      address: 'Sèmè-Kpodji, Ouémé',
      rating: 4.3,
      emoji: '🚛',
      color: AppColors.forestGreen,
      lat: 6.2833,
      lng: 2.5833,
    ),
    _MapMarker(
      name: 'Marché de Bohicon',
      type: 'Marché',
      address: 'Bohicon, Zou',
      rating: 4.4,
      emoji: '🏪',
      color: Color(0xFFE65100),
      lat: 7.1667,
      lng: 2.0667,
    ),
    _MapMarker(
      name: 'Producteur Koffi',
      type: 'Producteur',
      address: 'Parakou, Borgou',
      rating: 4.9,
      emoji: '👨‍🌾',
      color: AppColors.natureGreen,
      lat: 9.3373,
      lng: 2.6303,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Carte agricole'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.my_location, size: 22),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: AppColors.paleGreen.withValues(alpha: 0.3),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(20),
                    height: 400,
                    decoration: BoxDecoration(
                      color: AppColors.paleGreen.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.natureGreen.withValues(alpha: 0.3)),
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.map_outlined,
                                size: 80,
                                color: AppColors.forestGreen.withValues(alpha: 0.3),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Bénin',
                                style: AppTextStyles.h2.copyWith(
                                  color: AppColors.forestGreen.withValues(alpha: 0.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 80,
                          left: 100,
                          child: _MapPin(
                            emoji: '🏪',
                            color: const Color(0xFFE65100),
                          ),
                        ),
                        Positioned(
                          top: 120,
                          right: 60,
                          child: _MapPin(
                            emoji: '🤝',
                            color: const Color(0xFF1565C0),
                          ),
                        ),
                        Positioned(
                          bottom: 100,
                          left: 120,
                          child: _MapPin(
                            emoji: '👨‍🌾',
                            color: AppColors.natureGreen,
                          ),
                        ),
                        Positioned(
                          top: 60,
                          right: 120,
                          child: _MapPin(
                            emoji: '🚛',
                            color: AppColors.forestGreen,
                          ),
                        ),
                        Positioned(
                          bottom: 60,
                          right: 80,
                          child: _MapPin(
                            emoji: '🏪',
                            color: const Color(0xFFE65100),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _filters.length,
                itemBuilder: (context, index) {
                  final isSelected = _selectedFilter == _filters[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedFilter = _filters[index]),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.forestGreen : AppColors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: Text(
                          _filters[index],
                          style: AppTextStyles.bodySmall.copyWith(
                            color: isSelected ? Colors.white : AppColors.darkText,
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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 20,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${_getFilteredMarkers().length} lieux trouvés',
                    style: AppTextStyles.h3,
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _getFilteredMarkers().length,
                      itemBuilder: (context, index) {
                        return _buildMarkerCard(_getFilteredMarkers()[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<_MapMarker> _getFilteredMarkers() {
    if (_selectedFilter == 'Tous') return _markers;
    return _markers.where((m) => m.type == _selectedFilter).toList();
  }

  Widget _buildMarkerCard(_MapMarker marker) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: marker.color.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(marker.emoji, style: const TextStyle(fontSize: 22)),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      marker.name,
                      style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(marker.type, style: AppTextStyles.caption),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.star, color: Color(0xFFF9A825), size: 12),
                  const SizedBox(width: 2),
                  Text(
                    marker.rating.toString(),
                    style: AppTextStyles.bodySmall.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.directions_outlined,
                color: marker.color,
                size: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MapPin extends StatelessWidget {
  final String emoji;
  final Color color;

  const _MapPin({required this.emoji, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.4),
                blurRadius: 8,
              ),
            ],
          ),
          child: Center(
            child: Text(emoji, style: const TextStyle(fontSize: 16)),
          ),
        ),
        Container(
          width: 4,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(2)),
          ),
        ),
      ],
    );
  }
}

class _MapMarker {
  final String name;
  final String type;
  final String address;
  final double rating;
  final String emoji;
  final Color color;
  final double lat;
  final double lng;

  const _MapMarker({
    required this.name,
    required this.type,
    required this.address,
    required this.rating,
    required this.emoji,
    required this.color,
    required this.lat,
    required this.lng,
  });
}
