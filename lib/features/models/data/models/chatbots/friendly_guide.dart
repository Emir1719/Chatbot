import 'package:chatbot/features/models/data/models/i_chatbot.dart';

class FriendlyGuide extends IChatbot {
  @override
  String get id => "friendly_guide";

  @override
  String get description => "Gerçek bir arkadaş gibi sizinle etkileşim kurar.";

  @override
  List<String> get starters => [
        "Arkadaşım! Bugün futbol hakkında konuşalım mı?",
        "Sana bir sır versem tutar mısın?",
        "Lisedeki anılarımdan bahsetmek istiyorum."
      ];
}
