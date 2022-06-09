import 'package:flutter/material.dart';
import './widgets/transaction_form.dart';
import './widgets/transaction_list.dart';
import '../../models/transaction.dart';

class TransactionView extends StatefulWidget {
  const TransactionView({Key? key}) : super(key: key);

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: "T1", title: "New Shoes", amount: 14.6, date: DateTime.now()),
    Transaction(
        id: "T2", title: "New Bottle", amount: 24.6, date: DateTime.now()),
    Transaction(
        id: "T3", title: "New Shirt", amount: 34.1, date: DateTime.now()),
  ];

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
    return Column(
      children: [
        TransactionForm(addTransaction: _addTransaction),
        TransactionList(
          userTransactions: _userTransactions,
        )
      ],
    );
  }
}
