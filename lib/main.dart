import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _red = 0;
  double _green = 0;
  double _blue = 0;
  double _opacity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1515261439133-0f6cfb098e04?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: 300,
                color: Color.fromRGBO(
                    _red.toInt(), _green.toInt(), _blue.toInt(), _opacity),
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Red',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Slider(
                        value: _red,
                        label: _red.toInt().toString(),
                        min: 0,
                        max: 255,
                        activeColor: Colors.red,
                        divisions: 256,
                        onChanged: (val) {
                          setState(() {
                            _red = val;
                          });
                        }),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Green',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Slider(
                        value: _green,
                        label: _green.toInt().toString(),
                        min: 0,
                        max: 255,
                        activeColor: Colors.green,
                        divisions: 256,
                        onChanged: (val) {
                          setState(() {
                            _green = val;
                          });
                        }),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Blue',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Slider(
                        value: _blue,
                        label: _blue.toInt().toString(),
                        min: 0,
                        max: 255,
                        activeColor: Colors.blue,
                        divisions: 256,
                        onChanged: (val) {
                          setState(() {
                            _blue = val;
                          });
                        }),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'opacity',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Slider(
                        value: _opacity,
                        label: _opacity.toDouble().toString(),
                        min: 0,
                        max: 1,
                        activeColor: Colors.grey,
                        divisions: 10,
                        onChanged: (val) {
                          setState(() {
                            _opacity = val;
                          });
                        }),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              RaisedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "Copy to ClipBoard",
                            style: TextStyle(
                              color: Colors.amber,
                              letterSpacing: 1,
                              fontSize: 25,
                            ),
                          ),
                          elevation: 3,
                          backgroundColor: Colors.blue,
                          contentPadding: EdgeInsets.only(
                            top: 30,
                            left: 25,
                            right: 25,
                          ),
                          content: Container(
                            height: 150,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Hex : 0xff${_red.toInt().toRadixString(16)}${_green.toInt().toRadixString(16)}${_blue.toInt().toRadixString(16)}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    InkWell(
                                      child: Icon(
                                        Icons.copy,
                                        color: Colors.white,
                                      ),
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(
                                                    "Coppied Succesfully...."),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: Text('Close'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                            });
                                        Clipboard.setData(new ClipboardData(
                                            text:
                                                "0xff${_red.toInt().toRadixString(16)}${_green.toInt().toRadixString(16)}${_blue.toInt().toRadixString(16)}"));
                                      },
                                    ),
                                  ],
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "RGBA :(${_red.toInt()},${_green.toInt()},${_blue.toInt()},${_opacity})",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                    InkWell(
                                      child: Icon(
                                        Icons.copy,
                                        color: Colors.white,
                                      ),
                                      onTap: () {
                                        Clipboard.setData(new ClipboardData(
                                            text:
                                                "RGBA(${_red.toInt()},${_green.toInt()},${_blue.toInt()},${_opacity})"));
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(
                                                    "Coppied Succesfully...."),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: Text('Close'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop(2);
                                                    },
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                    ),
                                  ],
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                color: Colors.blue,
                child: Text('Color Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
