import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  final String apiKey = 'AIzaSyD97SknZ-EF3t4CGSJZfCvSwLse0n7PDAM';

  Future<String?> message(String prompt) async {
    final model = GenerativeModel(
      model: 'gemini-1.5-pro',
      apiKey: apiKey,
      // safetySettings: Adjust safety settings
      // See https://ai.google.dev/gemini-api/docs/safety-settings
      generationConfig: GenerationConfig(
        temperature: 1,
        topK: 64,
        topP: 0.95,
        maxOutputTokens: 8192,
        responseMimeType: 'text/plain',
      ),
      systemInstruction:
          Content.system('Sen bilgisayar teknolojileri hakkında bilgi veren bir asistansın.'),
    );

    final chat = model.startChat();
    final content = Content.text(prompt);
    final response = await chat.sendMessage(content);
    return response.text;
  }
}
