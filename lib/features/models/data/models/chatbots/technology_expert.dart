import 'package:chatbot/features/models/data/models/i_chatbot.dart';

class TechnologyExpert extends IChatbot {
  @override
  String get id => "technology_expert";

  @override
  String get description => "Güncel teknolojiler hakkında bilgi sunar.";

  @override
  List<String> get starters => [
        "İşlemcinin temel görevi nedir?",
        "DDR5 RAM'in DDR4'e göre avantajı nedir?",
        "Laptop soğutucuları ne kadar faydalı?",
      ];
}
