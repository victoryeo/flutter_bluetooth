import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class FifthPage extends StatefulWidget{
  @override
  HomePage createState() => new HomePage();
}

class HomePage extends State<FifthPage>{
  //noSuchMethod(Invocation i) => super.noSuchMethod(i);

  final _biggerFont = const TextStyle(fontSize: 18.0);
  bool switchCurrent = false;
  bool switchBtf = false;
  bool switchProx = false;
  bool switchTrack = false;
  GoogleMapController mapController;
  //Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(3.1412, 101.68653);

  void _onMapCreated(GoogleMapController controller) {
    //_controller.complete(controller);
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    Color hexToColor(String code) {
      return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    }
    return Scaffold(
      //backgroundColor: Colors.amber[200],
      backgroundColor: hexToColor('#FDDA24'),
      drawer: new Drawer(),
      appBar: PreferredSize(
          child: AppBar(
            leading: new IconButton(
                icon: Image.asset('assets/images/mylogo.png', height: 70),
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                    'assets/images/myalert.png', fit: BoxFit.contain, height: 70),
                //Icon(Icons.access_alarm, size:32)
                Container(padding: const EdgeInsets.all(8), child: Text('Fifth'))
              ],
            ),
            actions: [
              //new IconButton(
              //  icon: Image.asset('assets/images/mylogo.png'),
              //  onPressed: _pushSaved
              //)
            ],
          ),
          preferredSize: Size.fromHeight(60.0)
      ),
      body: _buildBtfApp(),
    );
  }

  Widget _buildBtfApp() {
    Color hexToColor(String code) {
      return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    }

    return Column(
        children: <Widget>[
          new Expanded(
              child: new SingleChildScrollView(
                  child: new Column(
                      children: <Widget>[
                        new Container(
                          padding: new EdgeInsets.all(5.0),
                          child: new
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              new Text('Show Location',
                                style: new TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: 16.0,
                                ),
                              )
                            ]
                          ),
                        ),
                        new Container(
                          padding: new EdgeInsets.all(5.0),
                          child: new
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                new Container(
                                    padding: new EdgeInsets.only(left: 8),
                                    child: new Column(
                                        children: <Widget> [
                                          Text('    Future',
                                            style: new TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.0,
                                            ),
                                          )
                                        ]
                                    )
                                ),
                                Switch(
                                    value: switchCurrent,
                                    onChanged: (bool value) {
                                      setState(() {
                                        switchCurrent = value;
                                      });
                                    }
                                )
                              ]
                          ),
                        ),
                        new Container(
                          padding: new EdgeInsets.all(5.0),
                          child: new
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                new Container(
                                    padding: new EdgeInsets.only(left: 8),
                                    child: new Column(
                                        children: <Widget> [
                                          Text('    Past',
                                            style: new TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.0,
                                            ),
                                          )
                                        ]
                                    )
                                ),
                                Switch(
                                    value: switchBtf,
                                    onChanged: (bool value) {
                                      setState(() {
                                        switchBtf = value;
                                      });
                                    }
                                )
                              ]
                          ),
                        ),
                        new Container(
                          padding: new EdgeInsets.all(5.0),
                          child: new
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                new Container(
                                    padding: new EdgeInsets.only(left: 8),
                                    child: new Column(
                                        children: <Widget> [
                                          Text('Food',
                                            style: new TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.0,
                                            ),
                                          )
                                        ]
                                    )
                                ),
                                Switch(
                                    value: switchProx,
                                    onChanged: (bool value) {
                                      setState(() {
                                        switchProx = value;
                                      });
                                    }
                                )
                              ]
                          ),
                        ),
                        new Container(
                          padding: new EdgeInsets.all(5.0),
                          child: new
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                new Container(
                                    padding: new EdgeInsets.only(left: 8),
                                    child: new Column(
                                        children: <Widget> [
                                          Text('Drink',
                                            style: new TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.0,
                                            ),
                                          )
                                        ]
                                    )
                                ),
                                Switch(
                                    value: switchTrack,
                                    onChanged: (bool value) {
                                      setState(() {
                                        switchTrack = value;
                                      });
                                    }
                                )
                              ]
                          ),
                        ),
                        new Container(
                          padding: new EdgeInsets.all(5.0),
                          child: new
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                new Text('Geo Map',
                                  style: new TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0,
                                  ),
                                )
                              ]
                          ),
                        ),

                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child:
                            GoogleMap(
                                onMapCreated: _onMapCreated,
                                initialCameraPosition: CameraPosition(
                                  target: _center,
                                  zoom: 4,
                                )
                            )

                        )
                      ]
                  )
              )
          ),

        ]
    );
  }

  void backToMainPage(context) {
    Navigator.pop(context);
  }
}