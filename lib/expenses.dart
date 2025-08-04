import 'package:flutter/material.dart';
import 'package:expense_tracker/Models/expense.dart';
import 'package:expense_tracker/expenses_list.dart';
import 'package:expense_tracker/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(context: context, builder: (ctx){
      return const NewExpense();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ExpenseTracker'),
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          Text('The chart'),
          Expanded(child: ExpensesList(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}
