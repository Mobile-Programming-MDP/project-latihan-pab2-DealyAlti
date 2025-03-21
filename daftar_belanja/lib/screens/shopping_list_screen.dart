import 'package:daftar_belanja/services/shopping_service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  @override
  final TextEditingController _controller = TextEditingController();
  final ShoppingService _shoppingService = ShoppingService();
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}