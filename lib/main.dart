import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:sensores_app2/Pages/camara.dart';
import 'package:sensores_app2/Pages/firma.dart';
import 'package:sensores_app2/Pages/inicio.dart';
import 'package:sensores_app2/Pages/ubicacion.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;

  final Camara _listCamara = Camara();
  final Firma _listFirma = new Firma();
  final Ubicacion _listUbicacion = new Ubicacion();
  final Inicio _listInicio = new Inicio();

  Widget _showPage = new Inicio();
  Widget _pageChooser(int page){
    switch(page){
      case 0:
      return _listInicio;
      break;
      case 1:
      return _listFirma;
      break;
      case 2:
      return _listUbicacion;
      break;
      case 3:
      return _listCamara;
      break;
      default: 
      return new Container(
        child: new Center(
          child: new Text('NO page found by page chooser'),)
      );
    }
  }

  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: pageIndex,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.camera, size: 30),
            Icon(Icons.line_style, size: 30),
            Icon(Icons.gps_fixed, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Center(
            child: Column(
              
              children: <Widget>[
                //Text(_page.toString(), textScaleFactor: 10.0),
                
                RaisedButton(
                  child: _showPage, 
                  onPressed: () {
                    final CurvedNavigationBarState navBarState =
                        _bottomNavigationKey.currentState;
                    navBarState.setPage(1);
                  },
                )
              ],
            ),
          ),
        ));
  }
}