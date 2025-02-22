import 'package:nyxx/nyxx.dart';

void main() async{
  String token = const String.fromEnvironment('TOKEN', defaultValue: '');

  final client = await Nyxx.connectGateway(
    token, 
    GatewayIntents.allUnprivileged
    );

    final bot = await client.users.fetchCurrentUser();

    client.onMessageCreate.listen((event) async{
      if(event.mentions.contains(bot)) {
        await event.message.channel.sendMessage(MessageBuilder(
          content: 'Hi ${event.message.author.username}, How may I help you today',
          replyId: event.message.id,
        ));
      }
    });
}
