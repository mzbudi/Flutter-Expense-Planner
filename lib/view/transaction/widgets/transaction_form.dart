import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({Key? key, required this.addTransaction})
      : super(key: key);

  final Function addTransaction;

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTransaction(title: enteredTitle, amount: enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Add Item',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.purple),
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Title"),
              controller: _titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Amount"),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: TextButton(
                onPressed: () {
                  submitData();
                },
                style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(20))),
                child: const Text("Add Transaction",
                    style: TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
