import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_items.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onnRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onnRemoveExpense;

  @override
  Widget build(BuildContext context) {
    // create a scrollable view
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(expenses[index]),
          onDismissed: (directionn) {
            onnRemoveExpense(expenses[index]);
          },
          child: ExpenseItem(
            expense: expenses[index],
          )),
    );
  }
}
