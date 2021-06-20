import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqlite_db/controller/form_controller.dart';
import 'package:sqlite_db/resources/colors.dart';

import 'form_page.dart';

class ContactViewPage extends StatelessWidget {
  final int index;

  ContactViewPage({Key? key, required this.index}) : super(key: key);

  final formController = Get.put(FormController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Column(
        children: [
          Container(
            height: 350,
            child: Stack(
              children: [
                Container(
                  child: AppBar(
                    elevation: 0,
                    automaticallyImplyLeading: false,
                    backgroundColor: AppColors.primary,
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
                          formController
                              .editData(formController.contactList[index]);
                          Get.to(FormPage(),
                              transition: Transition.downToUp,
                              curve: Curves.decelerate,
                              duration: Duration(milliseconds: 500));
                        },
                        child: Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: AppColors.call,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Icon(Icons.edit_outlined),
                            )),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0),
                  child: Container(
                    height: 180,
                    // color: AppColors.text,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: "${formController.contactList[index].id}",
                          child: formController.contactList[index].image == null
                              ? CircleAvatar(
                                  radius: 35,
                                  child: Text(
                                      "${formController.contactList[index].name![0]}",
                                      style: TextStyle(
                                          color: AppColors.text,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30)))
                              : Container(
                                  height: 130,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "${formController.contactList[index].image}"),
                                          fit: BoxFit.cover)),
                                ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${formController.contactList[index].name}",
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.text),
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            formController.contactList[index].favourite == 1
                                ? Icon(
                                    Icons.star,
                                    size: 15,
                                    color: Colors.yellow,
                                  )
                                : Text("")
                          ],
                        ),
                        Text("${formController.contactList[index].relation}",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 15, color: Colors.grey[400]),
                            )),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, 1),
                  child: Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35),
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: AppColors.message,
                                  borderRadius: BorderRadius.circular(25)),
                              child: IconButton(
                                icon: Icon(Icons.message_outlined),
                                color: AppColors.text,
                                onPressed: () {
                                  // formController.customLauncher(medium: "sms:${formController.contactList[index].phone}");
                                },
                              )),
                          Container(
                              decoration: BoxDecoration(
                                  color: AppColors.call,
                                  borderRadius: BorderRadius.circular(25)),
                              child: IconButton(
                                icon: Icon(Icons.call_outlined),
                                color: AppColors.text,
                                onPressed: () {
                                  formController.customLauncher();
                                  // medium:
                                  // "tel:+88 ${formController.contactList[index].phone}");
                                },
                              )),
                          Container(
                              decoration: BoxDecoration(
                                  color: AppColors.video,
                                  borderRadius: BorderRadius.circular(25)),
                              child: IconButton(
                                icon: Icon(Icons.video_call),
                                color: AppColors.text,
                                onPressed: () {},
                              )),
                          Container(
                              decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(25)),
                              child: IconButton(
                                icon: Icon(Icons.email_outlined),
                                color: AppColors.text,
                                onPressed: () {
                                  //formController.customLauncher(medium: "mailto:${formController.contactList[index].email}?subject=News&body=New%20plugin ");
                                },
                              )),
                        ],
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 20, right: 20, left: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  lists(
                      title: "Cellular",
                      type: formController.contactList[index].phone,
                      icon: Icons.phone_android),
                  SizedBox(
                    height: 10,
                  ),
                  lists(
                      title: "Home",
                      type: formController.contactList[index].altrphone,
                      icon: Icons.phone_android_sharp),
                  SizedBox(
                    height: 10,
                  ),
                  lists(
                      title: "Email",
                      type: formController.contactList[index].email,
                      icon: Icons.alternate_email),
                  SizedBox(
                    height: 10,
                  ),
                  lists(
                      title: "Address",
                      type: formController.contactList[index].address,
                      icon: Icons.home_work_rounded),
                  SizedBox(
                    height: 10,
                  ),
                  lists(
                      title: "Blood Group",
                      type: formController.contactList[index].blood,
                      icon: Icons.bloodtype),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget lists(
      {required String title, required var type, required IconData icon}) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.text,
          size: 32,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.lato(
                textStyle: TextStyle(fontSize: 15, color: Colors.grey[400]),
              ),
            ),
            Text("$type",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.text),
                )),
          ],
        ),
      ],
    );
  }
}
