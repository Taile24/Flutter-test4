import 'package:flutter/material.dart';
import 'package:test4/expensesItem.dart';
import 'package:test4/models/expense.dart';

class Expenseslist extends StatelessWidget {
  const Expenseslist({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(0.75),
            margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal,
            )),
        key: ValueKey(ExpensesItem(expenses[index])),
        onDismissed: (direction) {
          onRemoveExpense(
            expenses[index],
          );
        },
        child: ExpensesItem(
          expenses[index],
        ),
      ),
    );
  }
}
