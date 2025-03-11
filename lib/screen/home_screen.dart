import 'package:flutter/material.dart';
import 'package:flutter_budget_ui/data/data.dart';
// widgets
import 'package:flutter_budget_ui/widgets/bar_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            forceElevated: false,
            // floating true; this let you when scroll up to show the AppBar
            floating: true,
            expandedHeight: 100.0,
            leading: IconButton(
              icon: Icon(Icons.settings),
              iconSize: 30.0,
              onPressed: () {},
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'Simple Budget',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                  /**
                   * Error when specif height 100.0
                   */
                  // height: 100.0,
                  // color: Colors.red,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 6.0),
                    ],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: BarChart(expenses: weeklySpending),
                );
              },
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}
