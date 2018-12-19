import 'package:flutter/material.dart';
import 'chat_message.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  
  final TextEditingController _textController = new TextEditingController();
  final List<ChatMessage> _message = <ChatMessage> [];


  void _handleSubmitted(String text)
  {
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
    );

    setState(() {
          _message.insert(0, message);
        });
  }
  Widget _textComposer()
  {
    return IconTheme(
      data: IconThemeData(
        color: Colors.blue
      ),
          child: new Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
               decoration: new InputDecoration.collapsed(
                hintText: 'Type a Message',
              ),
              controller: _textController,
              onSubmitted: _handleSubmitted,
              ),
            ),
            new Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text),
              )
              
            )
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Column(
        children: <Widget>[
          new Flexible
          (child: new ListView.builder(
            padding: EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_,int index) => _message[index],
            itemCount: _message.length,
          ),
          ),
          new Divider(
            height: 2.0,
          ),
          new Container(
            decoration: new BoxDecoration(
              color: Theme.of(context).canvasColor,
            ),
            child: _textComposer(),
          )
        ],
      );
  }
}