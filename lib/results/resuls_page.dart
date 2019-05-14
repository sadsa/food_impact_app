import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_impact_app/results/results_sentences.dart';
import 'package:food_impact_app/results/results_summary.dart';

class ResultsPage extends StatefulWidget {
  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  _buildBody() {
    return Center(
      child: Column(
        children: <Widget>[
          ResultsSummary(),
          ResultsSentences()
        ],
      ),
    );
  }
}
