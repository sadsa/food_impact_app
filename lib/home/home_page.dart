import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home_selector_form.dart';

class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  _buildBody(context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _headerImage(),
        Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: <Widget>[
              _heading(context),
              HomeSelectorForm(() => _onSubmit(context))
            ],
          ),
        )
      ],
    ));
  }

  Widget _headerImage() {
    String assetName = 'assets/header.svg';
    Widget svg = new SvgPicture.asset(assetName);
    return Container(
      child: svg,
    );
  }

  _heading(context) => Container(
      padding: EdgeInsets.all(20),
      width: 360,
      child: Text(
        'How do your food choices impact on the environment?',
        style: Theme.of(context).textTheme.headline,
        textAlign: TextAlign.center,
      ));

  _onSubmit(context) {
    Navigator.pushNamed(context, '/results');
  }
}
