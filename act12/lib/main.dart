// Import Flutter package
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(InventoryApp());
}

class InventoryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventory Management App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: InventoryHomePage(title: 'Inventory Home Page'),
    );
  }
}

class InventoryHomePage extends StatefulWidget {
  InventoryHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _InventoryHomePageState createState() => _InventoryHomePageState();
}

class _InventoryHomePageState extends State<InventoryHomePage> {
  void _addItem() {}

  Widget _buildListItem(BuildContext context, DocumentSnapshot itemName) {
    return ListTile(
      title: Row(children: [Expanded(child: Text(itemName['name']))]),
    );
  }

  // TODO: Implement Firestore integration
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Inventory Management System'),
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection('itemnames').snapshots(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemExtent: 50.0,
                  itemCount: snapshot.data.length,
                  itemBuilder:
                      (context, index) => _buildListItem(
                        context,
                        snapshot.data.[index],
                      ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }
}
