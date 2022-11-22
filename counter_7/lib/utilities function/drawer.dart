import 'package:counter_7/main.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/page/budgetForm.dart';
import 'package:counter_7/page/budgetData.dart';
import 'package:counter_7/page/mywatchlistPage.dart';

Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Menambahkan clickable menu
          ListTile(
            title: const Text('Counter'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Form Budget'),
            onTap: () {
              // Route menu ke halaman form budget
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const BudgetFormPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Data Budget'),
            onTap: () {
              // Route menu ke halaman data budget
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const BudgetDataPage()),
              );
            },
          ),
          ListTile(
            title: const Text('My Watch List'),
            onTap: () {
              // Route menu ke halaman data budget
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyWatchlistPage()),
              );
            },
          ),
        ],
      ),
    );
}
