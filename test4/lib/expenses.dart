import 'package:flutter/material.dart';
import 'package:test4/chart.dart';
import 'package:test4/expenses_List.dart';
import 'package:test4/new_expenses.dart';
import 'models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerExpenses = [
    Expense(
      title: 'học tiếng anh ',
      amount: 19.199,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'học thêm ',
      amount: 1.25,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'đi cafe ',
      amount: 10.22,
      date: DateTime.now(),
      category: Category.leisure,
    )
  ];

  void _openAddExpensesOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpenses(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registerExpenses.add(expense);
    });
  }

  void _remoExpense(Expense expense) {
    final expenseIndex = _registerExpenses.indexOf(expense);
    setState(() {
      _registerExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Đã xóa'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registerExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContainer = const Center(
      child: Text('bắt đầu chi tiền nè'),
    );
    if (_registerExpenses.isNotEmpty) {
      mainContainer = Expenseslist(
        expenses: _registerExpenses,
        onRemoveExpense: _remoExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('bạn muốn chi thêm tiền '),
        actions: [
          IconButton(
            onPressed: _openAddExpensesOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registerExpenses),
          Expanded(
            child: mainContainer,
          ),
        ],
      ),
    );
  }
}
