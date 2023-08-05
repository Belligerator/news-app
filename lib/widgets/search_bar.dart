import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final Function(String value) onChanged;

  const SearchBar({
    super.key,
    required this.onChanged,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: 'Search...',
        hintStyle: const TextStyle(color: Colors.white),
        suffixIcon: IconButton(
          onPressed: () {
            _searchController.clear();
            widget.onChanged('');
          },
          icon: const Icon(
            Icons.clear,
            color: Colors.white,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: widget.onChanged,
    );
  }
}
