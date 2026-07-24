class ChatMessage {
  final String id;
  final String text;
  final bool isUser;
  final DateTime timestamp;

  const ChatMessage({
    required this.id,
    required this.text,
    required this.isUser,
    required this.timestamp,
  });

  static List<ChatMessage> initialMessages = [
    ChatMessage(
      id: '1',
      text: 'Bonjour ! Je suis l\'assistant AgriBen. Comment puis-je vous aider aujourd\'hui ?',
      isUser: false,
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
  ];

  static List<Map<String, String>> autoReplies = [
    {
      'trigger': 'feuille',
      'response': 'Le jaunissement des feuilles peut avoir plusieurs causes :\n\n'
          '1. Manque d\'eau - Vérifiez l\'arrosage\n'
          '2. Carence en azote - Envisagez un engrais organique\n'
          '3. Maladie - Observez s\'il y a des taches\n\n'
          'Pouvez-vous me décrire plus en détail le problème ?'
    },
    {
      'trigger': 'arrosage',
      'response': 'Pour un arrosage optimal :\n\n'
          '• Arrosez tôt le matin ou en fin de journée\n'
          '• Le maïs nécessite 500-800mm d\'eau pendant sa croissance\n'
          '• La tomate a besoin d\'un arrosage régulier mais modéré\n'
          '• Évitez les excès d\'eau qui favorisent les maladies'
    },
    {
      'trigger': 'sol',
      'response': 'Le Bénin possède différents types de sols :\n\n'
          '• Sols latéritiques : convenables pour le maïs et le manioc\n'
          '• Sols alluviaux : idéaux pour le riz et les légumes\n'
          '• Sols sableux : adaptés à l\'anacarde et au niébé\n\n'
          'Faites analyser votre sol pour un conseil précis.'
    },
    {
      'trigger': 'vente',
      'response': 'Pour vendre vos produits :\n\n'
          '1. Consultez le marché pour les prix actuels\n'
          '2. Mettez en contact avec les acheteurs proches\n'
          '3. Les cooperative offrent souvent de meilleurs prix\n\n'
          'Voulez-vous voir les prix du jour ?'
    },
    {
      'trigger': 'engrais',
      'response': 'Voici mes recommandations d\'engrais :\n\n'
          '• NPK 15-15-15 pour la base\n'
          '• Urée pour l\'azote (200-300 kg/ha pour le maïs)\n'
          '• Compost organique pour améliorer la structure du sol\n'
          '• Application 2-3 semaines après la germination'
    },
  ];
}
