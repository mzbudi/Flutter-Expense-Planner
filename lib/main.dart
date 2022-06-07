import 'package:expense_planner/transaction.dart';
import 'package:flutter/material.dart';
import './transaction.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final List<Transaction> transactions = [
    Transaction(
        id: "T1", title: "New Shoes", amount: 14.6, date: DateTime.now()),
    Transaction(
        id: "T2", title: "New Bottle", amount: 4.6, date: DateTime.now()),
    Transaction(
        id: "T3", title: "New Shirt", amount: 34.1, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Expense Planner"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                child: const Card(
                  child: Text("Chart"),
                  elevation: 5,
                ),
              ),
              Column(
                children: transactions.map((item) {
                  return Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2)),
                        padding: const EdgeInsets.all(10),
                        child: Text(item.amount.toString()),
                      ),
                      Column(
                        children: [
                          Text(item.title),
                          Text(item.date.toString())
                        ],
                      )
                    ],
                  );
                }).toList(),
              )
            ],
          )),
    );
  }
}
