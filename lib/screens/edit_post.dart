// ignore_for_file: no_logic_in_create_state, library_private_types_in_public_api, prefer_final_fields, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, avoid_print, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:post_api_app/model/server.dart';

// Thes project by Eng/Mohammed Amin Alathwari
//برمجة وتطوير المهندس محمد أمين

class EditPost extends StatefulWidget {
  String postId;
  String username;
  String postTitle;
  String postText;

  EditPost({
    required this.postId,
    required this.username,
    required this.postTitle,
    required this.postText,
  });

  @override
  _EditPostState createState() => _EditPostState(
        postId,
        username,
        postTitle,
        postText,
      );
}

class _EditPostState extends State<EditPost> {
  String postId;
  String username;
  String postTitle;
  String postText;

  _EditPostState(
    this.postId,
    this.username,
    this.postTitle,
    this.postText,
  );

  TextEditingController _postTitleTD = TextEditingController();
  TextEditingController _postTextTD = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _postTitleTD.text = postTitle;
      _postTextTD.text = postText;
    });
  }

  _updatePost() {
    Services.updatePost(postId, username, _postTitleTD.text, _postTextTD.text)
        .then((result) {
      print(postId);
      if ('success' == result) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.blue,
            content: Row(
              children: [
                Icon(Icons.thumb_up, color: Colors.white),
                Text(
                  'تم تعديل المنشور',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      } else {
        print(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تعديل منشور'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'تعديل منشور',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          username,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.blue,
                          ),
                        ),
                        Icon(
                          Icons.person,
                          size: 35,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _postTitleTD,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        hintText: 'العنوان',
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _postTextTD,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'النص',
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => _updatePost(),
                      child: Text(
                        'تعديل',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
