import 'package:flutter/material.dart';

class RoomSearchBar extends StatelessWidget {
  final TextEditingController searchController;
  final VoidCallback onTap;
  const RoomSearchBar({
    super.key, required this.searchController, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.deepOrange.withOpacity(0.3)),
          child:  TextField(
            controller: searchController,
            decoration: const InputDecoration(
                border: InputBorder.none, hintText: 'Search for a room'),
          ),
        ),
        Positioned(
            top: 0,
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.deepPurple),
                child: const Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ))
      ],
    );
  }
}