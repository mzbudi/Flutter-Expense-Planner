import 'package:expense_planner/view/transaction/widgets/transaction_form.dart';
import 'package:expense_planner/view/transaction/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';
import './view/transaction/widgets/transaction_form.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final titleController = TextEditingController();

  final List<Transaction> _userTransactions = [
    Transaction(
        id: "T1", title: "New Shoes", amount: 14.6, date: DateTime.now()),
    Transaction(
        id: "T2", title: "New Bottle", amount: 24.126, date: DateTime.now()),
    Transaction(
        id: "T3", title: "New Shrt", amount: 34.1, date: DateTime.now()),
    Transaction(
        id: "T4", title: "New Shfirt", amount: 34.1, date: DateTime.now()),
    Transaction(
        id: "T5", title: "Nedsw Shirt", amount: 34.1, date: DateTime.now()),
    Transaction(
        id: "T6", title: "New Shairt", amount: 34.1, date: DateTime.now()),
    Transaction(
        id: "T7", title: "New Shdirt", amount: 34.1, date: DateTime.now()),
    Transaction(
        id: "T8", title: "New Sahirt", amount: 34.1, date: DateTime.now()),
  ];

  void _addTransactionModal(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return TransactionForm(addTransaction: _addTransaction);
        });
  }

  void _addTransaction({required String title, required double amount}) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Expense Planner"),
          actions: [
            Builder(
              builder: (context) => IconButton(
                onPressed: () => _addTransactionModal(context),
                icon: const Icon(Icons.add),
                splashRadius: 20,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                child: const Card(
                  child: Text("Chart"),
                  elevation: 5,
                ),
              ),
              TransactionList(userTransactions: _userTransactions)
            ],
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () {
              _addTransactionModal(context);
            },
            child: const Icon(Icons.add),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
