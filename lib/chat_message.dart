import 'package:flutter/material.dart';

const String _name = 'Dev';

class ChatMessage extends StatelessWidget {
  String text ;

  ChatMessage({this.text});
  
    @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(margin: EdgeInsets.only(right: 20.0),
          child: new CircleAvatar(
            child: new Text(_name[0]),
          ),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(_name, style: Theme.of(context).textTheme.subhead,),
              new Container(
                margin: const EdgeInsets.only(top: 4.0),
                child: new Text(text),
              )
            ],
          )
        ],
      ),
    );
  }
}