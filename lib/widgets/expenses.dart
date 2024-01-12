import 'package:expense_tracer/models/expense.dart';
import 'package:expense_tracer/widgets/chart/chart.dart';
import 'package:expense_tracer/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracer/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
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
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true, // akhi screen ma avi jay
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    //The clearSnackBars method is called on the ScaffoldMessenger to remove or dismiss any currently displayed snack bars.
    ScaffoldMessenger.of(context).clearSnackBars();
    // bhulthi expense delete thay gyu hoy ane pachi pachu lav va mate ni trick che
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Expense deleted."),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(
                  expenseIndex, expense); // insert method
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    //print(MediaQuery.of(context).size.width);
    //print(MediaQuery.of(context).size.height);

    // we can not use var ,const or final instead of Widget because of Widget type assigned only widget ex :Text,column, row etx....
    Widget? mainContent;
    // = const Center(child: Text("no expense found. Start adding some!"));
    // if (_registeredExpenses.isNotEmpty) {
    //   mainContent = ExpensesList(
    //       expenses: _registeredExpenses, onRemoveExpense: _removeExpense);
    // }
    mainContent = _registeredExpenses.isNotEmpty
        ? mainContent = ExpensesList(
            expenses: _registeredExpenses, onRemoveExpense: _removeExpense)
        : const Text("no expense found. Start adding some!");
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter ExpenseTracker'),
          actions: [
            IconButton(
              onPressed: _openAddExpenseOverlay,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: width < 600
            ? Column(
                children: [
                  Chart(expenses: _registeredExpenses),
                  Expanded(child: mainContent),
                ],
              )
            : Row(
                children: [
                  Expanded(child: Chart(expenses: _registeredExpenses)),
                  Expanded(child: mainContent),
                ],
              ));
  }
}
