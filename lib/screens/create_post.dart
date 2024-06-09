// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_final_fields, avoid_print, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:post_api_app/model/server.dart';

// Thes project by Eng/Mohammed Amin Alathwari
//برمجة وتطوير المهندس محمد أمين

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  TextEditingController _userNameTD = TextEditingController();
  TextEditingController _postTitleTD = TextEditingController();
  TextEditingController _postTextTD = TextEditingController();

  _clearTextInput() {
    _userNameTD.text = '';
    _postTitleTD.text = '';
    _postTextTD.text = '';
  }

  _createTable() {
    Services.createTable().then((reault) {
      if ('success' == reault) {
        print('success to create table');
      } else {
        print(reault);
        // print('failed to create table');
      }
    });
  }

  _addPost() {
    _createTable();
    if (_userNameTD.text.isEmpty ||
        _postTitleTD.text.isEmpty ||
        _postTextTD.text.isEmpty) {
      print('Empty Fielsd');
      return;
    } else {
      Services.addPost(
        _userNameTD.text,
        _postTitleTD.text,
        _postTextTD.text,
      ).then((result) {
        if ('success' == result) {
          _clearTextInput();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.blue,
              content: Row(
                children: [
                  Icon(Icons.thumb_up, color: Colors.white),
                  Text(
                    'تم اضافة المنشور',
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('أنشاء منشور'),
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
                      'انشاء منشور',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _userNameTD,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        hintText: 'اسم المستخدم',
                      ),
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
                      onPressed: () {
                        _addPost();
                      },
                      child: Text(
                        'نشر الأن',
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
