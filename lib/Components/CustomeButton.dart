import 'package:flutter/material.dart';

Widget CustomeButton({required String label, required VoidCallback ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Padding(
          child: Text(
            label.toUpperCase(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
    ),
  );
}
