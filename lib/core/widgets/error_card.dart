import 'package:flutter/material.dart';

class ErrorCard extends StatelessWidget {
  final String errorMessage;

  const ErrorCard({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.red.shade50,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.red.shade100, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.red.shade300,
                size: 24,
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  errorMessage,
                  style: TextStyle(
                    color: Colors.red.shade300,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
