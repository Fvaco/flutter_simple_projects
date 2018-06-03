import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() async {
  List _posts = await getJson();
  List<Widget> _widgetPosts = [];
  for (var post in _posts) {
    Widget _currentWidget = new ListTile(
      leading: new Icon(Icons.local_post_office),
      title: new Padding(
        padding: const EdgeInsets.all(10.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              post['title'],
              maxLines: 1,
              style: new TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0),
            ),
            new Text(
              post['body'],
              maxLines: 3,
              style: new TextStyle(color: Colors.grey.shade500),
            )
          ],
        ),
      ),
    );
    _widgetPosts.add(_currentWidget);
  }

  runApp(new MaterialApp(
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text("JSON Parse Example"),
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
      ),
      body: new Center(
        child: new ListView.builder(
          itemCount: _posts.length,
          itemBuilder: (BuildContext context, int position) {
//            if(position.isOdd) return new Divider();
            return new ListTile(
              onTap: () {
                debugPrint("$position tapped");
              },
              leading: new CircleAvatar(
                backgroundColor: Colors.red.shade700,
              ),
              title: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    _posts[position]['title'],
                    maxLines: 1,
                    style: new TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                    ),
                  ),
                  new Text(
                    _posts[position]['body'],
                    maxLines: 3,
                    style: new TextStyle(color: Colors.grey.shade500),
                  ),
                  new Divider()
                ],
              ),
            );
          },
        ),
      ),
    ),
  ));
}

Future<List> getJson() async {
  String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  http.Response response = await http.get(apiUrl);

  return json.decode(response.body);
}
