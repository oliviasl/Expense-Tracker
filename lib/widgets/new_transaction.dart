import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addNewTransaction(
      titleController.text,
      double.parse(amountController.text),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              autocorrect: true,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              autocorrect: true,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal:true),
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Theme.of(context).primaryColor,
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
