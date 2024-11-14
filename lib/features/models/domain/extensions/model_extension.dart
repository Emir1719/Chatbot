import 'package:chatbot/features/models/data/models/chatbots.dart';

extension ModelExtension on Chatbots {
  /// Modelin resim yolunu döndürür
  String toPath() => "assets/images/$modelName.png";

  /// Modelin adını daha okunaklı hale çevirir.
  String toName() {
    var texts = modelName.split("_");
    // Her kelimenin baş harfini büyük yap ve birleştir
    return texts.map((word) => word[0].toUpperCase() + word.substring(1)).join(" ");
  }
}
