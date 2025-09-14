// lib/screens/dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:pharmax/screens/customers/customers_screen.dart';
import 'package:pharmax/screens/purchases/purchases_screen.dart';
import 'package:pharmax/database/app_database.dart'; // Import AppDatabase

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Assuming you have a way to access the database instance,
    // for example, through a Singleton or dependency injection.
    // For this example, let's create a new instance (for demonstration only).
    final AppDatabase db = AppDatabase();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pharmax Dashboard'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PurchasesScreen(db: db),
                  ),
                );
              },
              child: const Text('المشتريات'),
            ),
            // ... other buttons
          ],
        ),
      ),
    );
  }
}
