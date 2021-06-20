import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqlite_db/controller/form_controller.dart';
import 'package:sqlite_db/models/contact_model.dart';
import 'package:sqlite_db/resources/colors.dart';
import 'package:sqlite_db/views/home_page.dart';
import 'package:sqlite_db/widget/text_input_field.dart';

class FormPage extends StatelessWidget {
  FormPage({Key? key}) : super(key: key);
  final formController = Get.put(FormController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        backgroundColor: AppColors.primary,
        title: Text(
          "Add new contact",
          style: GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.text),
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppColors.call,
                  borderRadius: BorderRadius.circular(15)),
              child: Icon(
                Icons.chevron_left,
                size: 30,
                color: AppColors.text,
              )),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              formController.addToDatabase();
              Get.back();
              // Get.offAll(HomePage(),
              //     transition: Transition.leftToRight,
              //     duration: Duration(milliseconds: 500));
            },
            child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.call,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Icon(Icons.done_rounded),
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add to favourite",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.text),
                    ),
                  ),
                  GetX<FormController>(builder: (controller) {
                    return Switch(
                        activeColor: AppColors.call,
                        hoverColor: AppColors.text,
                        value: controller.switchValue.value,
                        onChanged: (value) {

                               controller.switchValue.value = value;

                        });
                  }),
                ],
              ),
              TextInputField(
                title: "Name",
                hints: "Enter Name",
                controller: formController.nameController.value,
              ),
              TextInputField(
                title: "Profile Image",
                hints: "Enter Image URL",
                controller: formController.imageController.value,
              ),
              TextInputField(
                  title: "Phone",
                  hints: "Enter Phone",
                  controller: formController.phoneController.value),
              TextInputField(
                  title: "Alternative Phone",
                  hints: "Enter Phone",
                  controller: formController.altrPhoneController.value),
              TextInputField(
                  title: "Email",
                  hints: "Enter Email",
                  controller: formController.emailController.value),
              TextInputField(
                  title: "Address",
                  hints: "Enter Address",
                  controller: formController.addressController.value),
              TextInputField(
                  title: "Blood group",
                  hints: "Enter Blood group",
                  controller: formController.bloodController.value),
              TextInputField(
                  title: "Relation",
                  hints: "Enter Relation",
                  controller: formController.relationController.value),
            ],
          ),
        ),
      ),
    );
  }

  Widget textField(String hintText, TextEditingController controller) {
    return Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.grey, offset: Offset(2, 2), blurRadius: 2)
        ], color: AppColors.text, borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(5),
        child: TextField(
          controller: controller,
          cursorColor: Colors.grey,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            fillColor: AppColors.text,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.black54),
            border: InputBorder.none,
          ),
        ));
  }
}
