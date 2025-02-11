import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _slelectedDate;

  // handles the picking date
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    // to select and save date
    setState(() {
      _slelectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(
                label: Text(
              'Title',
            )),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      prefixText: '\u20A6 ',
                      label: Text(
                        'Amount',
                      )),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_slelectedDate == null ? "No Date Selected" : formatter.format(_slelectedDate!)),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: Icon(
                        Icons.calendar_month,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                  print(_amountController);
                },
                child: Text("Save Expense"),
              )
            ],
          )
        ],
      ),
    );
  }
}
