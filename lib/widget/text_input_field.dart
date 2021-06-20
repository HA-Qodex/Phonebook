import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqlite_db/resources/colors.dart';

class TextInputField extends StatelessWidget {
  final String hints, title;
  final TextEditingController controller;

  const TextInputField(
      {Key? key,
      required this.title,
      required this.hints,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 14.0),
              height: 52,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextFormField(
                      autofocus: false,
                      cursorColor: AppColors.text,
                      controller: controller,
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 16,
                            color: AppColors.text),
                      ),
                      decoration: InputDecoration(
                        hintText: hints,
                        hintStyle: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600]),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.primary,
                            width: 0,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.primary,
                            width: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
