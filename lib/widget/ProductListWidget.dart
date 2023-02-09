// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/product/productModel.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Products item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print(item.title);
        },
        leading: Image.network(item.image),
        title: Text(
          item.title,
          maxLines: 5,
        ),
        subtitle: Text(item.description),
        trailing: Text(
          "\$${item.price.toString()}",
          textScaleFactor: 1.3,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
