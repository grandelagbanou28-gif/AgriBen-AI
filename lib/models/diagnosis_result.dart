class DiagnosisResult {
  final String plantName;
  final String plantNameLatin;
  final double confidence;
  final String healthStatus;
  final String diseaseName;
  final String description;
  final List<String> symptoms;
  final List<String> treatments;
  final List<String> preventionTips;
  final String severity;
  final bool isFromApi;

  const DiagnosisResult({
    required this.plantName,
    this.plantNameLatin = '',
    required this.confidence,
    required this.healthStatus,
    this.diseaseName = '',
    required this.description,
    this.symptoms = const [],
    this.treatments = const [],
    this.preventionTips = const [],
    this.severity = 'Moyen',
    this.isFromApi = false,
  });

  factory DiagnosisResult.fromJson(Map<String, dynamic> json) {
    return DiagnosisResult(
      plantName: json['plantName'] ?? '',
      plantNameLatin: json['plantNameLatin'] ?? '',
      confidence: (json['confidence'] ?? 0).toDouble(),
      healthStatus: json['healthStatus'] ?? '',
      diseaseName: json['diseaseName'] ?? '',
      description: json['description'] ?? '',
      symptoms: List<String>.from(json['symptoms'] ?? []),
      treatments: List<String>.from(json['treatments'] ?? []),
      preventionTips: List<String>.from(json['preventionTips'] ?? []),
      severity: json['severity'] ?? 'Moyen',
      isFromApi: json['isFromApi'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'plantName': plantName,
      'plantNameLatin': plantNameLatin,
      'confidence': confidence,
      'healthStatus': healthStatus,
      'diseaseName': diseaseName,
      'description': description,
      'symptoms': symptoms,
      'treatments': treatments,
      'preventionTips': preventionTips,
      'severity': severity,
      'isFromApi': isFromApi,
    };
  }
}
