import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class loadingscreen extends StatefulWidget {
  const loadingscreen({Key? key}) : super(key: key);

  @override
  _loadingscreenState createState() => _loadingscreenState();
}

class _loadingscreenState extends State<loadingscreen> {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}
