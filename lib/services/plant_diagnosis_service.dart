import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/diagnosis_result.dart';

class PlantDiagnosisService {
  static const String _apiKeyPref = 'plantnet_api_key';
  static const String _baseUrl = 'https://my-api.plantnet.org/v2/identify';

  static Future<String?> getApiKey() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_apiKeyPref);
  }

  static Future<void> setApiKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_apiKeyPref, key);
  }

  static Future<DiagnosisResult> diagnose(File imageFile) async {
    final apiKey = await getApiKey();

    if (apiKey != null && apiKey.isNotEmpty) {
      try {
        return await _diagnoseWithPlantNet(imageFile, apiKey);
      } catch (e) {
        return _diagnoseWithMock(imageFile);
      }
    }

    return _diagnoseWithMock(imageFile);
  }

  static Future<DiagnosisResult> _diagnoseWithPlantNet(
      File imageFile, String apiKey) async {
    final uri = Uri.parse('$_baseUrl?api-key=$apiKey');
    final request = http.MultipartRequest('POST', uri);

    request.files.add(
      await http.MultipartFile.fromPath('images', imageFile.path),
    );

    request.fields['organs'] = 'auto';

    final streamedResponse = await request.send().timeout(
      const Duration(seconds: 15),
    );

    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode != 200) {
      throw Exception('API error: ${response.statusCode}');
    }

    final data = json.decode(response.body);

    if (data['results'] == null || (data['results'] as List).isEmpty) {
      throw Exception('No results');
    }

    final bestResult = data['results'][0];
    final species = bestResult['species'];
    final commonNames = species['commonNames'] ?? [];
    final scientificName = species['scientificName'] ?? '';

    return DiagnosisResult(
      plantName: commonNames.isNotEmpty ? commonNames[0] : scientificName,
      plantNameLatin: scientificName,
      confidence: (bestResult['score'] ?? 0).toDouble(),
      healthStatus: 'Identifié par PlantNet',
      diseaseName: '',
      description:
          'Plante identifiée avec ${(bestResult['score'] * 100).toStringAsFixed(0)}% de confiance.',
      severity: 'Info',
      isFromApi: true,
    );
  }

  static DiagnosisResult _diagnoseWithMock(File imageFile) {
    final random = Random();
    final diseases = _getMockDiseases();
    final selected = diseases[random.nextInt(diseases.length)];

    return DiagnosisResult(
      plantName: selected['plant']!,
      plantNameLatin: selected['latin']!,
      confidence: 0.70 + random.nextDouble() * 0.25,
      healthStatus: selected['status']!,
      diseaseName: selected['disease']!,
      description: selected['description']!,
      symptoms: List<String>.from(selected['symptoms']!),
      treatments: List<String>.from(selected['treatments']!),
      preventionTips: List<String>.from(selected['prevention']!),
      severity: selected['severity']!,
      isFromApi: false,
    );
  }

  static List<Map<String, dynamic>> _getMockDiseases() {
    return [
      {
        'plant': 'Tomate',
        'latin': 'Solanum lycopersicum',
        'status': 'Maladie détectée',
        'disease': 'Mildiou de la tomate',
        'description':
            'Le mildiou (Phytophthora infestans) est une maladie fongique qui affecte gravement les tomates au Bénin, surtout pendant la saison des pluies.',
        'symptoms': [
          'Taches brunes ou verdâtres sur les feuilles',
          'Moucherettes blanches sous les feuilles',
          'Pourriture des fruits',
          'Flétrissement rapide des tiges',
        ],
        'treatments': [
          'Bouillie bordelaise (sulfate de cuivre 20g/L d\'eau)',
          'Poudre de concombre amer en pulvérisation',
          'Extraction des parties atteintes immédiatement',
          'Traitement chimique à base de mancozèbe en cas de persistance',
        ],
        'prevention': [
          'Espacer les plants de 50cm minimum',
          'Arroser au pied, jamais par aspersion',
          'Pailler le sol pour réduire l\'humidité',
          'Rotation des cultures tous les 2 ans',
        ],
        'severity': 'Élevé',
      },
      {
        'plant': 'Maïs',
        'latin': 'Zea mays',
        'status': 'Maladie détectée',
        'disease': 'Rouille du maïs',
        'description':
            'La rouille (Puccinia sorghi) est courante au Bénin. Elle réduit le rendement de 10 à 30% si non traitée.',
        'symptoms': [
          'Pustules orange-rouille sur les feuilles',
          'Jaunissement progressif des feuilles',
          'Réduction de la taille des épis',
          'Séchage prématuré des feuilles',
        ],
        'treatments': [
          'Pulvérisation de soufre mouillable',
          'Traitement à base de propiconazole',
          'Suppression des feuilles très touchées',
          'Fumure potassique pour renforcer la plante',
        ],
        'prevention': [
          'Choisir des variétés résistantes (hybrides tolérants)',
          'Semis à la période recommandée',
          'Éviter les parcelles à forte humidité',
          'Détruire les résidus de culture après récolte',
        ],
        'severity': 'Moyen',
      },
      {
        'plant': 'Manioc',
        'latin': 'Manihot esculenta',
        'status': 'Maladie détectée',
        'disease': 'Mosaïque du manioc (CMD)',
        'description':
            'Le virus de la mosaïque du manioc est transmis par la mouche blanche. Il est endémique au Bénin et peut réduire le rendement de 40%.',
        'symptoms': [
          'Motif mosaïque jaune-vert sur les feuilles',
          'Feuilles réduites et déformées',
          'Raccourcissement des entre-nœuds',
          'Diminution de la production de tubercules',
        ],
        'treatments': [
          'Pas de traitement chimique direct contre le virus',
          'Arrachage et destruction des plants infectés',
          'Utilisation de boutures saines provenant de variétés résistantes',
          'Lutte contre la mouche blanche (pièges jaunes englués)',
        ],
        'prevention': [
          'Planter des variétés résistantes (NDC, TME 419)',
          'Utiliser uniquement des boutures saines',
          'Espacer les plants de 1m x 1m',
          ' surveillance régulière des parcelles',
        ],
        'severity': 'Élevé',
      },
      {
        'plant': 'Soja',
        'latin': 'Glycine max',
        'status': 'Maladie détectée',
        'disease': 'Cercospora du soja',
        'description':
            'Le Cercospora kikuchii provoque des taches foliaires qui réduisent la photosynthèse et le rendement.',
        'symptoms': [
          'Taches circulaires brunes avec bordure violette',
          'Jaunissement autour des taches',
          'Chute prématurée des feuilles',
          'Taches pourpres sur les gousses',
        ],
        'treatments': [
          'Pulvérisation de chlorothalonil',
          'Traitement à base de mancozèbe',
          'Récolte précoce en cas d\'infestation sévère',
          'Engrais potassique pour renforcer la plante',
        ],
        'prevention': [
          'Rotation avec des céréales (maïs, mil)',
          'Utiliser des semences certifiées',
          'Éviter les semis trop denses',
          'Détruire les résidus de récolte',
        ],
        'severity': 'Moyen',
      },
      {
        'plant': 'Ananas',
        'latin': 'Ananas comosus',
        'status': 'Maladie détectée',
        'disease': 'Pourriture noire de l\'ananas',
        'description':
            'Caused by Thielaviopsis paradoxa, cette maladie est favorisée par les blessures et l\'humidité excessive.',
        'symptoms': [
          'Taches brunes foncées sur les feuilles',
          'Pourriture molle au cœur de la plante',
          'Odeur de fermentation',
          'Effondrement de la plante',
        ],
        'treatments': [
          'Retirer et détruire les parties atteintes',
          'Pulvérisation de benomyl ou thiabendazole',
          'Traitement des blessures avec de la poudre de fongicide',
          'Réduire l\'arrosage en période humide',
        ],
        'prevention': [
          'Planter sur buttes bien drainées',
          'Éviter les blessures lors de la taille',
          'Espacer les plants de 60cm x 60cm',
          'Utiliser du paillage pour réduire l\'éclaboussure',
        ],
        'severity': 'Élevé',
      },
      {
        'plant': 'Légume',
        'latin': 'Solanaceae',
        'status': 'En bonne santé',
        'disease': 'Aucune maladie détectée',
        'description':
            'Cette plante semble en bonne santé. Continuez les bonnes pratiques agricoles pour maintenir sa vitalité.',
        'symptoms': [],
        'treatments': [],
        'prevention': [
          'Arroser régulièrement au pied',
          'Maintenir un paillage organique',
          'Surveiller l\'apparition de pests',
          'Fertiliser avec du compost mûr',
        ],
        'severity': 'Faible',
      },
    ];
  }
}
