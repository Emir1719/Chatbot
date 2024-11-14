enum Chatbots {
  technologyExpert("technology_expert", null, [
    "İşlemcinin temel görevi nedir?",
    "DDR5 RAM'in DDR4'e göre avantajı nedir?",
    "Laptop soğutucuları ne kadar faydalı?"
  ]),
  friendlyGuide("friendly_guide", null, [
    "Arkadaşım! Bugün futbol hakkında konuşalım mı?",
    "Sana bir sır versem tutar mısın?",
    "Lisedeki anılarımdan bahsetmek istiyorum."
  ]),
  creativeWriter("creative_writer", null, [
    "Yazacağım metni daha akıcı hale getir.",
    "Polisiye konusunda bir hikaye yaz.",
  ]),
  girlFriend("girl_friend", "Fashion Expert", [
    "En popüler giysi markası nedir?",
    "Sarı bir kazağın altına ne iyi gider?",
    "Resmi yerlerde hangi tür giysiler giyilmelidir?"
  ]);

  final String modelName;
  final String? displayName;
  final List<String> starters;

  const Chatbots(this.modelName, this.displayName, this.starters);
}
