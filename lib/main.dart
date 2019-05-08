import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Impact Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Food Impact Calculator'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[FoodSelectorForm()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class FoodSelectorForm extends StatefulWidget {
  @override
  FoodSelectorFormState createState() {
    return FoodSelectorFormState();
  }
}

class FoodSelectorFormState extends State<FoodSelectorForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> _foods = [
    "Farmed fishy",
    "Farmed prawns",
    "Pork",
  ];
  List<String> _frequencies = [
    "1-2 times per week",
    "3-5 times per week",
    "Once a day",
    "Never",
  ];
  String _selectedFood;
  String _selectedFrequency;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          DropdownButtonFormField(
            decoration:
                InputDecoration(labelText: 'Which food would you like?'),
            items: _buildBuildDropdownItems(_foods),
            onChanged: _setSelectedFood,
          ),
          DropdownButtonFormField(
            decoration: InputDecoration(
                labelText: 'How often fo you have it?',
                hintText: _frequencies[0]),
            items: _buildBuildDropdownItems(_frequencies),
            onChanged: _setSelectedFrequency,
          ),
          Text(_selectedFood.toString()),
          Text(_selectedFrequency.toString()),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildBuildDropdownItems(List<String> items) {
    return items.map((item) {
      return DropdownMenuItem(
        child: Text(item),
        value: item,
      );
    }).toList();
  }

  void _setSelectedFood(String value) {
    setState(() {
      _selectedFood = value;
    });
  }

  void _setSelectedFrequency(String value) {
    setState(() {
      _selectedFrequency = value;
    });
  }
}
