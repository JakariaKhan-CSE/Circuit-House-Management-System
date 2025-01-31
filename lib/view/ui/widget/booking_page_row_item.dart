import 'package:flutter/material.dart';
class booking_page_row_item extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String leftText;
  final bool isValidtorEnable;

  const booking_page_row_item({
    super.key, required this.controller, required this.hintText, required this.leftText,
    this.isValidtorEnable = true
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(

        children: [
          Expanded(
            flex: 2,
            child: Text(
             leftText,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: Text(
              ':',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: TextFormField(

                  // The validator receives the text that the user has entered.

                  validator: (value) {
                    if(isValidtorEnable)
                      {
                        if (value == null || value.isEmpty) {
                          return '$leftText is empty';
                        }
                        return null;
                      }
                    return null;
                  },
                  controller: controller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hintText,
                      hintStyle: const TextStyle(
                        fontSize: 15,

                      )
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}