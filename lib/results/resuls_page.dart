import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_impact_app/main.dart';
import 'package:food_impact_app/results/results_Sentences.dart';
import 'package:food_impact_app/results/results_summary.dart';

class ResultsPage extends StatelessWidget {
  final String title;

  ResultsPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _buildBody());
  }

  _buildBody() {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: viewportConstraints.maxHeight,
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                  children: <Widget>[ResultsSummary(), ResultsSentences(), _retryButton(context)]),
            ),
          ),
        ),
      );
    });
  }

    Widget _retryButton(context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Choose another food',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          color: AppColorPalette.teal,
          textColor: Colors.white,
        ));
  }
}
