import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/dtos/message.dart';
import '../../../viewmodel/providers/chats/chat_provider.dart';
import '../../../viewmodel/widgets/chat/message_bubble.dart';
import '../../../viewmodel/widgets/shared/message_field_box.dart';
import '../../../viewmodel/widgets/herBar/her_presentation.dart';
import '../../../viewmodel/widgets/chat/offer_button.dart';

class ChatScreen extends StatelessWidget {
  static const String screenName = 'chat_screen';
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatProvider(), // Create an instance of your ChatProvider
      child: const Scaffold(
        appBar: HerPresentation(
          nombre: 'Chat',
          urlAvatar:
          'https://c4.wallpaperflare.com/wallpaper/987/482/404/anime-spice-and-wolf-holo-spice-and-wolf-hd-wallpaper-preview.jpg',
        ),
        body: ChatView(),
      ),
    );
  }
}

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return Container( // Wrap with a Container
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://media.istockphoto.com/id/1284882634/vector/give-money-outline-icon-payment-with-money-hand-holding-paycheck-icon.jpg?s=612x612&w=0&k=20&c=-1xhlUk9_h1wKtSrnEMVszfccZawU4THy8bJjBsPZ-g='),
          colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.5), BlendMode.dstATop),
        ),

      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: chatProvider.chatScrollController,
                  itemCount: chatProvider.messageList.length,
                  itemBuilder: (context, index) {
                    final message = chatProvider.messageList[index];
                    return (message.fromWho == FromWho.hers)
                        ? HerMessageBubble(
                        message: message.text, urlGif: message.imageUrl)
                        : MyMessageBubble(message: message.text);
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: MessageFieldBox(onValue: chatProvider.sendMessage),
                  ),
                  const SizedBox(width: 8),
                  GreenDollarButton(onPressed: () {
                    //aqui la idea del boton de oferta en el chat
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}