import 'package:flutter/material.dart';

Card container = Card(
  elevation: 5,
  child: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.all(10),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.red,
            padding: const EdgeInsets.all(10),
          ),
        )
      ],
    ),
  ),
);
