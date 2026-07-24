import 'package:flutter/material.dart';

enum CropStatus { excellent, good, attention, critical }

class Crop {
  final String id;
  final String name;
  final String variety;
  final DateTime plantedDate;
  final DateTime expectedHarvest;
  final double area;
  final CropStatus status;
  final String healthDescription;
  final double estimatedYield;
  final Color iconColor;

  const Crop({
    required this.id,
    required this.name,
    required this.variety,
    required this.plantedDate,
    required this.expectedHarvest,
    required this.area,
    required this.status,
    required this.healthDescription,
    required this.estimatedYield,
    required this.iconColor,
  });

  String get statusLabel {
    switch (status) {
      case CropStatus.excellent:
        return 'Excellent';
      case CropStatus.good:
        return 'Bonne santé';
      case CropStatus.attention:
        return 'Attention';
      case CropStatus.critical:
        return 'Critique';
    }
  }

  Color get statusColor {
    switch (status) {
      case CropStatus.excellent:
        return const Color(0xFF2E7D32);
      case CropStatus.good:
        return const Color(0xFF4CAF50);
      case CropStatus.attention:
        return const Color(0xFFFF6D00);
      case CropStatus.critical:
        return const Color(0xFFC62828);
    }
  }

  static List<Crop> samples = [
    Crop(
      id: '1',
      name: 'Maïs',
      variety: 'Hybride 6253',
      plantedDate: DateTime.now().subtract(const Duration(days: 45)),
      expectedHarvest: DateTime.now().add(const Duration(days: 90)),
      area: 2.5,
      status: CropStatus.good,
      healthDescription: 'Bonne pousse, feuilles vertes',
      estimatedYield: 3500,
      iconColor: const Color(0xFFF9A825),
    ),
    Crop(
      id: '2',
      name: 'Tomate',
      variety: 'Roma VF',
      plantedDate: DateTime.now().subtract(const Duration(days: 30)),
      expectedHarvest: DateTime.now().add(const Duration(days: 60)),
      area: 1.0,
      status: CropStatus.attention,
      healthDescription: 'Légère infection sur les feuilles',
      estimatedYield: 800,
      iconColor: const Color(0xFFE53935),
    ),
    Crop(
      id: '3',
      name: 'Soja',
      variety: 'TGx 1835',
      plantedDate: DateTime.now().subtract(const Duration(days: 20)),
      expectedHarvest: DateTime.now().add(const Duration(days: 75)),
      area: 1.5,
      status: CropStatus.excellent,
      healthDescription: 'Croissance optimale',
      estimatedYield: 1200,
      iconColor: const Color(0xFF66BB6A),
    ),
    Crop(
      id: '4',
      name: 'Ananas',
      variety: 'Smooth Cayenne',
      plantedDate: DateTime.now().subtract(const Duration(days: 120)),
      expectedHarvest: DateTime.now().add(const Duration(days: 30)),
      area: 0.8,
      status: CropStatus.good,
      healthDescription: 'Développement normal',
      estimatedYield: 2400,
      iconColor: const Color(0xFFFFB300),
    ),
    Crop(
      id: '5',
      name: 'Manioc',
      variety: 'Brou 1',
      plantedDate: DateTime.now().subtract(const Duration(days: 90)),
      expectedHarvest: DateTime.now().add(const Duration(days: 180)),
      area: 3.0,
      status: CropStatus.excellent,
      healthDescription: 'Excellent état sanitaire',
      estimatedYield: 8000,
      iconColor: const Color(0xFF8D6E63),
    ),
  ];
}
