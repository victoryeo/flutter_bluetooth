import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class FourthPage extends StatefulWidget{
  @override
  HomePage createState() => new HomePage();
}

class HomePage extends State<FourthPage>{
  //noSuchMethod(Invocation i) => super.noSuchMethod(i);

  final _biggerFont = const TextStyle(fontSize: 18.0);
  bool switchConnect = false;
  bool switchLogged = false;
  bool switchAlert = false;
  bool switchAlertLoss = false;
  final textEmailController = TextEditingController();
  final textMessageController = TextEditingController();
  String textEmail = "";
  int _minAlertDelay = 1;
  int _minAlertBattery = 1;
  String motionSensitivity = 'off';
  List<String> motionState = ['off','Near','Medium','Far'];
  int _currRadioValue = 1;
  int p1_1, p1_2, p1_3, p1_4, p1_5, p1_6, p1_7, p1_8;

  var _scanSubscription;

  void _stopScan() {
    _scanSubscription?.cancel();
    _scanSubscription = null;
  }

  void _sendData() {
    FlutterBlue flutterBlue = FlutterBlue.instance;
    BluetoothDevice device;

    p1_1 = switchConnect ? 1: 0;
    p1_2 = switchLogged ? 1 : 0;
    p1_3 = switchAlert ? 1 : 0;
    p1_4 = switchAlertLoss ? 1 : 0;
    p1_5 = _minAlertDelay;
    p1_6 = _minAlertBattery;
    switch  (motionSensitivity) {
      case "off":
        p1_7 = 0;
        break;
      case "Near":
        p1_7 = 1;
        break;
      case "Medium":
        p1_7 = 2;
        break;
      case "Far":
        p1_7 = 3;
        break;
      default:
        p1_7 = 0;
    }
    p1_8 = _currRadioValue;

    //call bluetooth send function
    _scanSubscription = flutterBlue.scan(
      timeout: const Duration(seconds: 5),
    ).listen((scanResult) async {
      // do something with scan result
      device = scanResult.device;
      print('${device.name} found! rssi: ${scanResult.rssi}');
      try {
        await device.connect();
        print("connected");
        
        List<BluetoothService> services = await device.discoverServices();
        services.forEach((service) {
          //do sth
          print(service);
          var charac = service.characteristics;
          for (BluetoothCharacteristic c in charac) {
            //do sth
            //List<int> value = await c.read();
            //print(value);
          }
        });
      } on Exception {
        print("Error");
      }
    }, onDone: () => _stopScan());
  }

  void _changeAlertDelay(int dir) {
    print('direction ${dir}');
    if (dir == 1) {
      setState(() {
        _minAlertDelay++;
      });
    }
    else if (dir == 0) {
      setState(() {
        _minAlertDelay--;
      });
    }
  }

  void _changeAlertBattery(int dir) {
    print('direction ${dir}');
    if (dir == 1) {
      setState(() {
        _minAlertBattery++;
      });
    }
    else if (dir == 0) {
      setState(() {
        _minAlertBattery--;
      });
    }
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
                    'assets/images/myprox.png', fit: BoxFit.contain, height: 70),
                //Icon(Icons.access_alarm, size:32)
                Container(padding: const EdgeInsets.all(8), child: Text('Fourth'))
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
                                new Container(
                                    padding: new EdgeInsets.only(left: 8),
                                    child: new Column(
                                        children: <Widget> [
                                          Text('Connect to Btf',
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
                                    value: switchConnect,
                                    onChanged: (bool value) {
                                      setState(() {
                                        switchConnect = value;
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
                                          Text('Send money',
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
                                    value: switchLogged,
                                    onChanged: (bool value) {
                                      setState(() {
                                        switchLogged = value;
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
                                          Text('Btf ready',
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
                                    value: switchAlert,
                                    onChanged: (bool value) {
                                      setState(() {
                                        switchAlert = value;
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
                                          Text('Btf Delay',
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
                                    value: switchAlertLoss,
                                    onChanged: (bool value) {
                                      setState(() {
                                        switchAlertLoss = value;
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
                                          Text('Time sensitivity',
                                            style: new TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.0,
                                            ),
                                          )
                                        ]
                                    )
                                ),
                                DropdownButton<String> (
                                  value: motionSensitivity,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      motionSensitivity = newValue;
                                    });
                                  },
                                  items: motionState.map((String value) {
                                    return new DropdownMenuItem(
                                      value: value,
                                      child: new Text(value),
                                    );
                                  }).toList(),
                                  /*items: [
                                    DropdownMenuItem(
                                      value: "off",
                                      child: Text("off"),
                                    ),
                                    DropdownMenuItem(
                                      value: "low",
                                      child: Text("low"),
                                    ),
                                    DropdownMenuItem(
                                      value: "med",
                                      child: Text("med"),
                                    ),
                                    DropdownMenuItem(
                                      value: "high",
                                      child: Text("high"),
                                    ),
                                  ],*/
                                ),
                              ]
                          ),
                        ),
                        new Container(
                          padding: new EdgeInsets.all(5.0),
                          child: new
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                new Container(
                                    padding: new EdgeInsets.only(left: 8),
                                    child: new Column(
                                        children: <Widget> [
                                          Text('Time Delay ',
                                            style: new TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ]
                                    )
                                ),
                                new Expanded(
                                    child: Container(
                                        padding: new EdgeInsets.only(left: 8),
                                        child: new Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget> [
                                              Text('',
                                                style: new TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16.0,
                                                ),
                                              )
                                            ]
                                        )
                                    )
                                ),
                                new GestureDetector(
                                    onTap: (){
                                      _changeAlertDelay(0);
                                    },
                                    child: new Container(
                                      child: new Column(
                                          children: <Widget> [
                                            Image.asset(
                                                'assets/images/arrowleft.jpg', fit: BoxFit.scaleDown
                                            )
                                          ]
                                      ),
                                    )
                                ),
                                new Container(
                                    padding: new EdgeInsets.only(left: 8),
                                    child: new Column(
                                        children: <Widget> [
                                          Text(_minAlertDelay.toString( )+' ',
                                            style: new TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ]
                                    )
                                ),
                                new GestureDetector(
                                    onTap: (){
                                      _changeAlertDelay(1);
                                    },
                                    child: new Container(
                                      child: new Column(
                                          children: <Widget> [
                                            Image.asset(
                                                'assets/images/arrowrights.png', fit: BoxFit.scaleDown
                                            )
                                          ]
                                      ),
                                    )
                                ),
                                new Container(
                                    padding: new EdgeInsets.only(left: 8),
                                    child: new Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget> [
                                          Text('Mins',
                                            style: new TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.0,
                                            ),
                                          )
                                        ]
                                    )
                                ),
                              ]
                          ),
                        ),
                        new Container(
                          padding: new EdgeInsets.all(5.0),
                          child: new
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                new Container(
                                    padding: new EdgeInsets.only(left: 8),
                                    child: new Column(
                                        children: <Widget> [
                                          Text('Rinse Delay',
                                            style: new TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ]
                                    )
                                ),
                                new Expanded(
                                    child: Container(
                                        padding: new EdgeInsets.only(left: 8),
                                        child: new Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget> [
                                              Text('',
                                                style: new TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16.0,
                                                ),
                                              )
                                            ]
                                        )
                                    )
                                ),
                                new GestureDetector(
                                    onTap: (){
                                      _changeAlertBattery(0);
                                    },
                                    child: new Container(
                                      child: new Column(
                                          children: <Widget> [
                                            Image.asset(
                                                'assets/images/arrowleft.jpg', fit: BoxFit.scaleDown
                                            )
                                          ]
                                      ),
                                    )
                                ),
                                new Container(
                                    padding: new EdgeInsets.only(left: 8),
                                    child: new Column(
                                        children: <Widget> [
                                          Text(_minAlertBattery.toString( )+' ',
                                            style: new TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ]
                                    )
                                ),
                                new GestureDetector(
                                    onTap: (){
                                      _changeAlertBattery(1);
                                    },
                                    child: new Container(
                                      child: new Column(
                                          children: <Widget> [
                                            Image.asset(
                                                'assets/images/arrowrights.png', fit: BoxFit.scaleDown
                                            )
                                          ]
                                      ),
                                    )
                                ),
                                new Container(
                                    padding: new EdgeInsets.only(left: 8),
                                    child: new Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget> [
                                          Text('Days',
                                            style: new TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.0,
                                            ),
                                          )
                                        ]
                                    )
                                ),
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
                                          Text('Allow Btf Connection',
                                            style: new TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.0,
                                            ),
                                          )
                                        ]
                                    )
                                ),

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
                                    child:
                                          new Radio(
                                            groupValue: _currRadioValue,
                                            onChanged: (int i) => setState(()=> _currRadioValue = i),
                                            value: 0,
                                          ),
                                ),
                                Text('not selected',
                                  style: new TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
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
                                  child:
                                  new Radio(
                                    groupValue: _currRadioValue,
                                    onChanged: (int i) => setState(()=> _currRadioValue = i),
                                    value: 1,
                                  ),
                                ),
                                Text('smartphone',
                                  style: new TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
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
                                  child:
                                  new Radio(
                                    groupValue: _currRadioValue,
                                    onChanged: (int i) => setState(()=> _currRadioValue = i),
                                    value: 2,
                                  ),
                                ),
                                Text('router',
                                  style: new TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0,
                                  ),
                                )
                              ]
                          ),
                        ),
                      ]
                  )
              )
          ),

          new Center(
              child: new ConstrainedBox(
                  constraints: BoxConstraints(minWidth: double.infinity),
                  child:  new RaisedButton(
                      child: Text('Send'),
                      color: Colors.black,
                      textColor: Colors.white,
                      onPressed: _sendData,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0)
                      )
                  )
              )
          )

        ]
    );
  }

  void backToMainPage(context) {
    Navigator.pop(context);
  }
}