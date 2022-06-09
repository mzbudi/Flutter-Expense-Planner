import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key, required this.userTransactions})
      : super(key: key);

  final List<Transaction> userTransactions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: userTransactions.map((tx) {
        return Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                      fontWeight: FontWeight.bold, color: Colors.grey),
                )
              ],
            )
          ],
        );
      }).toList(),
    );
  }
}