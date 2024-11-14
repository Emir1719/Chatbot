/*
class GeminiService {
  final String _apiKey = 'AIzaSyD97SknZ-EF3t4CGSJZfCvSwLse0n7PDAM';
  final String _sysPrompt = "Sen bilgisayar teknolojileri hakkında bilgi veren bir asistansın.";
  late GenerativeModel _model;

  GeminiService() {
    _model = GenerativeModel(
      model: 'gemini-1.5-pro',
      apiKey: _apiKey,
      safetySettings: _safetySettings,
      generationConfig: GenerationConfig(
        temperature: 1,
        topK: 64,
        topP: 0.95,
        maxOutputTokens: 8192,
        responseMimeType: 'text/plain',
      ),
      systemInstruction: Content.system(_sysPrompt),
    );
  }

  final _safetySettings = [
    SafetySetting(HarmCategory.harassment, HarmBlockThreshold.none),
    SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.low),
    SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.high),
    SafetySetting(HarmCategory.dangerousContent, HarmBlockThreshold.medium),
  ];

  Future<String?> message(String prompt) async {
    final chat = _model.startChat();
    final content = Content.text(prompt);
    final response = await chat.sendMessage(content);
    return response.text;
  }
}
*/