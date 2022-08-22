import 'package:flutter/material.dart';

import '../theme.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    this.hasFilter = false,
  }) : super(key: key);

  final bool hasFilter;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      style: const TextStyle(
        fontSize: 12,
      ),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: lightTheme.colorScheme.surface,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: lightTheme.colorScheme.primary,
            ),
          ),
          contentPadding: const EdgeInsets.all(8),
          isDense: true,
          fillColor: lightTheme.colorScheme.surfaceVariant.withOpacity(0.2),
          filled: true,
          hintText: 'Search',
          prefixIcon: const Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
            child: Icon(
              Icons.search,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            maxHeight: 24,
          ),
          suffixIcon: hasFilter
              ? IconButton(
                  splashRadius: 10,
                  padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                  icon: const Icon(Icons.filter_alt),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (ctx) {
                        return Container();
                      },
                    );
                  },
                )
              : null,
          suffixIconConstraints: const BoxConstraints(maxHeight: 24)),
    );
  }
}
