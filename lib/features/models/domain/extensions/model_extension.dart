import 'package:chatbot/features/models/data/models/i_chatbot.dart';

extension ModelExtension on IChatbot {
  /// Modelin resim yolunu döndürür
  String toPath() => "assets/images/$id.png";

  /// Modelin adını daha okunaklı hale çevirir.
  String toName() {
    var texts = id.split("_");
    // Her kelimenin baş harfini büyük yap ve birleştir
    return texts.map((word) => word[0].toUpperCase() + word.substring(1)).join(" ");
  }
}
