import 'package:flutter/material.dart';
class CategoriesScreen extends StatelessWidget{ //the categories should not be handled with state
    const CategoriesScreen({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Pick your category'),
            ),
        );
    }
}