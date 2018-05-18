import 'package:flutter/material.dart';
import '../model/appconfs.dart';
import '../pages/mysettings_page.dart';
import '../pages/camera_page.dart';
import '../pages/myphotos_page.dart';

class BottomBar extends StatelessWidget {

  final AppConfs appConfs;

  BottomBar(this.appConfs);

  @override
  Widget build(BuildContext context) {
   return new BottomNavigationBar(
          currentIndex: 0,
          onTap: (int index) { 
            if (index == 1) {
              Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (context) => new CameraPage(this.appConfs )
                )
              );
            } else if (index == 2) {
              // MyPhotos page
              Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (context) => new MyPhotosPage(this.appConfs)
                )
              );
            } else if (index == 3) {
              // MySettings page
              Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (context) => new MySettingsPage(this.appConfs)
                )
              );
            }
          },
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text("Home"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.camera),
              title: new Text("Camera"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.person),
              title: new Text("My Photos"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.person),
              title: new Text("My Settings"),
            ),
        ],
      );
 }
}