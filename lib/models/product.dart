class MarketProduct {
  final String id;
  final String name;
  final String producer;
  final double price;
  final String unit;
  final double quantity;
  final String location;
  final String imageUrl;
  final double distance;
  final double rating;
  final bool isAvailable;

  const MarketProduct({
    required this.id,
    required this.name,
    required this.producer,
    required this.price,
    required this.unit,
    required this.quantity,
    required this.location,
    required this.imageUrl,
    required this.distance,
    required this.rating,
    this.isAvailable = true,
  });

  String get formattedPrice => '${price.toStringAsFixed(0)} FCFA/$unit';
  String get formattedQuantity => '${quantity.toStringAsFixed(0)} $unit disponible';
  String get formattedDistance => '${distance.toStringAsFixed(1)} km';

  static List<MarketProduct> samples = [
    const MarketProduct(
      id: '1',
      name: 'Maïs',
      producer: 'Coopérative Zè',
      price: 250,
      unit: 'kg',
      quantity: 5000,
      location: 'Zè, Atlantique',
      imageUrl: 'assets/images/maize.png',
      distance: 3.2,
      rating: 4.8,
    ),
    const MarketProduct(
      id: '2',
      name: 'Ananas',
      producer: 'Ferme Akpédjè',
      price: 500,
      unit: 'kg',
      quantity: 2000,
      location: 'Allada, Atlantique',
      imageUrl: 'assets/images/pineapple.png',
      distance: 8.5,
      rating: 4.6,
    ),
    const MarketProduct(
      id: '3',
      name: 'Soja',
      producer: 'Producteur Koffi',
      price: 350,
      unit: 'kg',
      quantity: 1500,
      location: 'Parakou, Borgou',
      imageUrl: 'assets/images/soybean.png',
      distance: 45.0,
      rating: 4.9,
    ),
    const MarketProduct(
      id: '4',
      name: 'Tomate',
      producer: 'Jardin de Bohicon',
      price: 400,
      unit: 'kg',
      quantity: 800,
      location: 'Bohicon, Zou',
      imageUrl: 'assets/images/tomato.png',
      distance: 12.3,
      rating: 4.5,
    ),
    const MarketProduct(
      id: '5',
      name: 'Anacarde',
      producer: 'Producteur Sèhè',
      price: 1200,
      unit: 'kg',
      quantity: 3000,
      location: 'Kétou, Plateau',
      imageUrl: 'assets/images/cashew.png',
      distance: 28.7,
      rating: 4.7,
    ),
    const MarketProduct(
      id: '6',
      name: 'Manioc',
      producer: 'Coopérative Dangbo',
      price: 150,
      unit: 'kg',
      quantity: 10000,
      location: 'Dangbo, Ouémé',
      imageUrl: 'assets/images/cassava.png',
      distance: 6.1,
      rating: 4.4,
    ),
  ];
}
