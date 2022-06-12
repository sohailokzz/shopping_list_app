import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.labelText,
    required this.textEditingController,
  }) : super(key: key);
  final String labelText;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 327,
      child: TextField(
        controller: textEditingController,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey.shade100,
          labelText: labelText,
          labelStyle: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
