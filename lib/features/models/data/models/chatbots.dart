enum Chatbots {
  technologyExpert("technology_expert", null, "Güncel teknolojiler hakkında bilgi sunar.", [
    "İşlemcinin temel görevi nedir?",
    "DDR5 RAM'in DDR4'e göre avantajı nedir?",
    "Laptop soğutucuları ne kadar faydalı?"
  ]),
  friendlyGuide("friendly_guide", null, "Gerçek bir arkadaş gibi sizinle etkileşim kurar.", [
    "Arkadaşım! Bugün futbol hakkında konuşalım mı?",
    "Sana bir sır versem tutar mısın?",
    "Lisedeki anılarımdan bahsetmek istiyorum."
  ]),
  creativeWriter("creative_writer", null, "Yazılarınızı daha etkin ve akıcı hale getirir.", [
    "Yazacağım metni daha akıcı hale getir.",
    "Polisiye konusunda bir hikaye yaz.",
  ]),
  girlFriend("girl_friend", "Fashion Expert", "Moda, giyim hakkında en güncel bilgileri sunar.", [
    "En popüler giysi markası nedir?",
    "Sarı bir kazağın altına ne iyi gider?",
    "Resmi yerlerde hangi tür giysiler giyilmelidir?"
  ]);

  final String modelName;
  final String? displayName;
  final String description;
  final List<String> starters;

  const Chatbots(this.modelName, this.displayName, this.description, this.starters);
}
