import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchableDropdown extends StatefulWidget {
  final List<dynamic> items;
  final String hintText;
  final ValueChanged<String>? onItemSelected;

  const SearchableDropdown({
    Key? key,
    required this.items,
    required this.hintText,
    this.onItemSelected,
  }) : super(key: key);

  @override
  SearchableDropdownState createState() => SearchableDropdownState();
}

class SearchableDropdownState extends State<SearchableDropdown> {
  List<dynamic> _filteredItems = [];
  bool _isDropdownOpen = false;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  int _selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items;
    _searchController.addListener(_filterItems);
  }

  void _filterItems() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems = widget.items
          .where((item) => item.toLowerCase().contains(query))
          .toList();

      _isDropdownOpen = query.isNotEmpty;
      _selectedIndex = -1;
    });
  }

  void _selectItem(String item) {
    setState(() {
      _searchController.text = item;
      _isDropdownOpen = false;
    });
    if (widget.onItemSelected != null) {
      widget.onItemSelected!(item);
    }
  }

  void _handleKeyEvent(KeyEvent event) {
    if (event is KeyDownEvent) {
      if (_filteredItems.isNotEmpty) {
        if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
          setState(() {
            if (_selectedIndex < _filteredItems.length - 1) {
              _selectedIndex++;
            }
          });
        } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
          setState(() {
            if (_selectedIndex > 0) {
              _selectedIndex--;
            }
          });
        } else if (event.logicalKey == LogicalKeyboardKey.enter) {
          if (_selectedIndex >= 0 && _selectedIndex < _filteredItems.length) {
            _selectItem(_filteredItems[_selectedIndex]);
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KeyboardListener(
          focusNode: _focusNode,
          onKeyEvent: _handleKeyEvent,
          child: TextFormField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: widget.hintText,
              border: const OutlineInputBorder(),
              suffixIcon: const Icon(Icons.search),
            ),
          ),
        ),
        if (_isDropdownOpen)
          Container(
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0),
              ),
            ),
            child: _filteredItems.isNotEmpty
                ? ListView.builder(
                    itemCount: _filteredItems.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_filteredItems[index]),
                        tileColor:
                            _selectedIndex == index ? Colors.grey[300] : null,
                        onTap: () => _selectItem(_filteredItems[index]),
                      );
                    },
                  )
                : const Center(
                    child: Text('Nenhum item encontrado'),
                  ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
