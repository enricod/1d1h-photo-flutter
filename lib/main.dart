import 'dart:async';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'package:camera/camera.dart';
import 'model/apptoken_storage.dart';
import 'model/appconfs.dart';

//void main() => 

List<CameraDescription> cameras;

Future<Null> main() async {
  AppTokenStorage storage = new AppTokenStorage();
  cameras = await availableCameras();
  var readToken = storage.readToken();
  readToken.then((onValue) {
    print('apptoken = $onValue');
    runApp(new MyApp(onValue));
  });
}

class MyApp extends StatelessWidget {

  AppConfs appConfs;
  MyApp(this.appConfs);

  Widget _getStartPage() {
    return appConfs.appToken == '' ?
    new LoginPage() :
    new MyHomePage(title: 'One Hour, One Day Photo', cameras: cameras);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: _getStartPage(),
    );
  }
}


