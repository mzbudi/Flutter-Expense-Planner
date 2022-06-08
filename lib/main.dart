import 'package:expense_planner/transaction.dart';
import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                child: const Card(
                  child: Text("Chart"),
                  elevation: 5,
                ),
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const TextField(
                        decoration: InputDecoration(labelText: "Title"),
                      ),
                      const TextField(
                        decoration: InputDecoration(labelText: "Amount"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(20))),
                          child: const Text("Add Transaction",
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: transactions.map((tx) {
                  return Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2)),
                        padding: const EdgeInsets.all(10),
                        child: Text("\$${tx.amount}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            DateFormat.yMEd().format(tx.date),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          )
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
