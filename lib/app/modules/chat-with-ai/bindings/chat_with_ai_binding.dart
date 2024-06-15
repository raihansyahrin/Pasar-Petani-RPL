import 'package:get/get.dart';

import '../controllers/chat_with_ai_controller.dart';

class ChatWithAiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatWithAiController>(
      () => ChatWithAiController(),
    );
  }
}
