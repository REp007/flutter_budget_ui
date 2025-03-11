import 'package:flutter/material.dart';
import 'package:flutter_budget_ui/data/data.dart';
import 'package:flutter_budget_ui/models/category_model.dart';
// import 'package:flutter_budget_ui/models/expense_model.dart';
// widgets
import 'package:flutter_budget_ui/widgets/bar_chart.dart';

// helpers
import 'package:flutter_budget_ui/helpers/color_helper.dart';

// Screens
import 'package:flutter_budget_ui/screen/category_screen.dart';

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
                if (index == 0) {
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
                } else {
                  final Category category = categories[index - 1];
                  double totalAmountSpent = 0;
                  for (var exp in category.expenses) {
                    totalAmountSpent += exp.cost;
                  }
                  return _buildCategory(category, totalAmountSpent);
                }
              },
              childCount: categories.length + 1,
            ),
          )
        ],
      ),
    );
  }

  // make _buildCategory func
  _buildCategory(Category category, double totalAmountSpent) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => CategoryScreen(category: category)),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        padding: EdgeInsets.all(20.0),
        // height: 150.0,
        width: double.infinity,
        // color: Colors.red,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 2), blurRadius: 6.0),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  category.name,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                ),
                Text(
                  '\$${(category.maxAmount - totalAmountSpent).toStringAsFixed(2)} / \$${category.maxAmount.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final double maxBarWidth = constraints.maxWidth;
                final double percent = (category.maxAmount - totalAmountSpent) /
                    category.maxAmount;
                double barWidth = percent * maxBarWidth;
                if (barWidth < 0) {
                  barWidth = 0;
                }
                return Stack(
                  children: [
                    Container(
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    Container(
                      height: 20.0,
                      /**
                     * width defined by the calcul of category.maxAmount - totalAmountSpent
                     */
                      width: barWidth,
                      decoration: BoxDecoration(
                        color: getColor(context, percent),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
