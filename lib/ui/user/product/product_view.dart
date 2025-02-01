import 'package:cotton_valley_app/widgets/custom_appbar.dart';
import 'package:cotton_valley_app/widgets/products_widget.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            title: 'Products',
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: 4, 
              itemBuilder: (context, index) {
                return const ProductsWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}
