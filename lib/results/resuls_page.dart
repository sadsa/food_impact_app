import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_impact_app/results/results_Sentences.dart';
import 'package:food_impact_app/results/results_summary.dart';

class ResultsPage extends StatelessWidget {
  final String title;

  ResultsPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: _buildBody());
  }

  _buildBody() {
    return Center(
      child: Column(
        children: <Widget>[ResultsSummary(), ResultsSentences()],
      ),
    );
  }
}
