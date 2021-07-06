import 'package:flutter/material.dart';

///共性元素动画
class HonorDemoPage extends StatelessWidget {
  final Object tag = "image";
  final String imageUrl = "static/test.jpeg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("HonorDemoPage"),
      ),
      body: Container(
        child: Center(
          child: new InkWell(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) {
                    return HonorPage(
                      tag: this.tag,
                      imageUrl: this.imageUrl,
                    );
                  },
                  fullscreenDialog: true));
            },

            /// Hero  tag 共享
            child: new Hero(
              tag: this.tag,
              child: new Image.asset(
                this.imageUrl,
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HonorPage extends StatelessWidget {
  final Object tag;
  final String imageUrl;

  HonorPage({this.tag, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.transparent,
      body: new InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: new Container(
          alignment: Alignment.center,
          child: new Hero(
            tag: this.tag,
            child: new Image.asset(
              this.imageUrl,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
            ),
          ),
        ),
      ),
    );
  }
}
