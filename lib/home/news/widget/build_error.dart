import 'package:flutter/material.dart';

Widget buildError({
  required BuildContext context,
  required String message,
  required Function() onTap,
}) {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(message, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            onTap();
          },
          child: const Text('Retry'),
        ),
      ],
    ),
  );
}
