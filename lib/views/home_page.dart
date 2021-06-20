
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqlite_db/controller/form_controller.dart';
import 'package:sqlite_db/resources/colors.dart';
import 'package:sqlite_db/views/favourites.dart';
import 'package:sqlite_db/views/form_page.dart';

import 'contacts.dart';

class HomePage extends StatelessWidget {

  final formController = Get.put(FormController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.secondary,
        body: Column(
          children: [
          Container(
          height: 170,
          child: Stack(
            children: [
              Container(
                child: AppBar(
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  backgroundColor: AppColors.primary,
                  title: Text("Contacts", style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.text),
                  )),
                  centerTitle: true,
                  leading: GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/profile.jpg"), fit: BoxFit.fill,),
                          color: AppColors.call,
                          borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                  ),
                  actions: [
                    GestureDetector(
                      onTap: (){
                        Get.to(FormPage(), transition: Transition.downToUp, curve: Curves.decelerate,
                        duration: Duration(milliseconds: 500));
                      },
                      child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColors.call,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Icon(Icons.add),
                          )),)
                  ],
                ),
              ),
              Align(
                alignment: Alignment(0,1),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35), topRight: Radius.circular(35),
                      )),
                  child: TabBar(
                    automaticIndicatorColorAdjustment: true,
                      indicatorColor: Colors.transparent,
                      labelColor: AppColors.text,
                      unselectedLabelColor: Colors.grey[600],
                      tabs: [
                        Tab(text: "Contacts", icon: Icon(Icons.contact_mail_outlined),),
                        Tab(text: "Favourites", icon: Icon(Icons.star_border),),
                      ]),
                ),
              ),
            ],
          ),
          ),
            Expanded(
              child: TabBarView(children: [
                Contacts(formController: formController),
                Favourites(formController: formController,)
              ]),
            ),
          ],
        ),

      ),
    );
  }
}
