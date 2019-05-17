import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_selector_form.dart';

class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: _buildBody(context));
  }

  _buildBody(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[HomeSelectorForm(() => _onSubmit(context))],
      ),
    );
  }

  _onSubmit(context) {
    Navigator.pushNamed(context, '/results');
  }
}
