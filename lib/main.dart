import 'package:expense_planner/view/transaction/transaction_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  // final titleController = TextEditingController();
  // String amountController = '';

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
              const TransactionView()
            ],
          )),
    );
  }
}
