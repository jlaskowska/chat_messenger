abstract class IChatService {
  Stream<List<Map<String, dynamic>>> messageStream();

  void sendMessage(Map<String, dynamic> message);
}
