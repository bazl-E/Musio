import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
          fontWeight: FontWeight.w500, color: Theme.of(context).primaryColor),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 5.0,
          ),
        ),
        border: InputBorder.none,
        hintText: "Search...",
        hintStyle: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
        contentPadding: const EdgeInsets.only(
          left: 18,
          right: 20,
          top: 14,
          bottom: 14,
        ),
        suffixIcon: Icon(
          Icons.search,
          color: Theme.of(context).primaryColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 5.0,
          ),
        ),
      ),
    );
  }
}
