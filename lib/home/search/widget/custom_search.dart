import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';

class CustomSearch extends StatelessWidget {
  CustomSearch({
    super.key,
    required this.onSubmit,
    required this.onClear,
    required this.controller,
  });

  void Function(String) onSubmit;
  void Function() onClear;
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapUpOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      controller: controller,
      onFieldSubmitted: (value) => onSubmit(value),
      cursorColor: Colors.black,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor),
        suffixIcon: IconButton(
          icon: Icon(Icons.clear, color: Theme.of(context).primaryColor),
          onPressed: onClear,
        ),
        hint: Text(
          AppLocalizations.of(context)!.search,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
