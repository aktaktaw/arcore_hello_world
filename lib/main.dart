import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ArCore Flutter Hello World',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'ArCore Flutter Hello World'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
    ArCoreController arCoreController;

  _onArCoreViewCreated(ArCoreController controller){
    arCoreController = controller;
    _addSphere(arCoreController);
  }

  _addSphere(ArCoreController controller){
    final material = ArCoreMaterial(
      color: Colors.deepOrange,
    );
    final sphere = ArCoreSphere(
      materials: [material],
      radius: 0.2
    );
    final node = ArCoreNode(
      shape: sphere,
      position: vector.Vector3(0,0,-1.5),
    );
    controller.addArCoreNode(node);
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: ArCoreView(
        onArCoreViewCreated: _onArCoreViewCreated,
      ),

    );
  }
}
