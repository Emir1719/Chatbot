import 'package:chatbot/features/models/data/models/i_chatbot.dart';

class FashionExpert extends IChatbot {
  @override
  String get id => "girl_friend";

  @override
  String? get displayName => "Fashion Expert";

  @override
  String get description => "Moda, giyim hakkında en güncel bilgileri sunar.";

  @override
  List<String> get starters => [
        "En popüler giysi markası nedir?",
        "Sarı bir kazağın altına ne iyi gider?",
        "Resmi yerlerde hangi tür giysiler giyilmelidir?"
      ];
}
