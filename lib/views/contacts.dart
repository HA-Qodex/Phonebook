import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqlite_db/controller/form_controller.dart';
import 'package:sqlite_db/resources/colors.dart';
import 'package:sqlite_db/widget/slideable_widget.dart';

import 'contact_view_page.dart';
import 'form_page.dart';

class Contacts extends StatelessWidget {
  final FormController formController;

  const Contacts({Key? key, required this.formController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            )),
        child: GetX<FormController>(
            builder: (controller) {
              return RefreshIndicator(
                color: AppColors.call,
                semanticsLabel: "Loading...",
                onRefresh: (){ return controller.refreshList();},
                child: ListView.builder(
                    itemCount: controller.contactList.length,
                    itemBuilder: (context, index) {
                      return SlidableWidget(
                        child: listTile(index, controller), index: index,);
                    }),
              );
            }
        )
    );
  }

  Widget listTile(int index, FormController controller) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(ContactViewPage(index: index), transition: Transition.zoom,
                  curve: Curves.easeInOutCirc,
                  duration: Duration(milliseconds: 500));
            },
            onLongPress: () {
              controller.deleteData(controller.contactList[index]);
            },
            child: ListTile(
              leading: Hero(
                tag: "${controller.contactList[index].id}",
                child:
                controller.contactList[index].image != null
                    ? CircleAvatar(backgroundImage: NetworkImage(
                    "${controller.contactList[index].image}"), radius: 25,)
                    : CircleAvatar(child: Text(
                    "${controller.contactList[index].name![0]}",
                    style: TextStyle(color: AppColors.text,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                  backgroundColor: AppColors.call,
                  radius: 20,),),
              title: Text(
                "${controller.contactList[index].name}",
                style: GoogleFonts.firaSans(
                    color: AppColors.text, fontSize: 18),
              ),
              subtitle: Text("${controller.contactList[index].phone}",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 15,
                      color: AppColors.text),
                ),
              ),
              trailing: Icon(
                Icons.double_arrow_sharp,
                color: AppColors.text.withOpacity(0.1),
              ),
            ),
          ),
          Divider(color: AppColors.text.withOpacity(0.2),)
        ],
      ),
    );
  }
}
