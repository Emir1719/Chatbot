import 'package:chatbot/features/models/data/models/i_chatbot.dart';

class CreativeWriter extends IChatbot {
  @override
  String get id => "creative_writer";

  @override
  String get description => "Yazılarınızı daha etkili ve akıcı hale getirir.";

  @override
  List<String> get starters => [
        "Yazacağım metni daha akıcı hale getir.",
        "Polisiye konusunda bir hikaye yaz.",
      ];
}
