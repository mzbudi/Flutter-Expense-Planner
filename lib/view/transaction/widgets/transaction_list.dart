import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key, required this.userTransactions})
      : super(key: key);

  final List<Transaction> userTransactions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: userTransactions.isEmpty
          ? Column(
              children: [
                Text('No item added yet !',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  child: Image.asset('assets/images/waiting.png',
                      fit: BoxFit.cover),
                )
              ],
            )
          : ListView.builder(
              itemCount: userTransactions.length,
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).colorScheme.primary,
                                width: 2)),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                            "\$${userTransactions[index].amount.toStringAsFixed(2)}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Theme.of(context).colorScheme.primary)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(userTransactions[index].title,
                              style: Theme.of(context).textTheme.titleMedium),
                          Text(
                            DateFormat.yMEd()
                                .format(userTransactions[index].date),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
