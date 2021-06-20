import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqlite_db/controller/form_controller.dart';
import 'package:sqlite_db/resources/colors.dart';
import 'package:sqlite_db/widget/slideable_widget.dart';

import 'contact_view_page.dart';

class Favourites extends StatelessWidget {
  final FormController formController;
  const Favourites({Key? key, required this.formController}) : super(key: key);

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
                onRefresh: (){return controller.refreshList();},
                child: ListView.builder(
                    itemCount: controller.favouriteList.length,
                    itemBuilder: (context, index) {
                      return SlidableWidget(child: listTile(index, controller), index: index,);
                    }),
              );
            }
        )
    );
  }
  Widget listTile(int index, FormController controller){
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              // controller.editData(controller.contactList[index]);
              Get.to(ContactViewPage(index: index), transition: Transition.zoom, curve: Curves.easeInOutCirc,
                  duration: Duration(milliseconds: 500));
            },
            onLongPress: (){controller.deleteData(controller.favouriteList[index]);},
            child: ListTile(
              leading: CircleAvatar(
                child: Text(
                  "${controller.favouriteList[index].name![0]}",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.text),
                  ),),
              ),
              title: Text(
                "${controller.favouriteList[index].name}",
                style: GoogleFonts.firaSans(color: AppColors.text, fontSize: 18),
              ),
              subtitle: Text("${controller.favouriteList[index].phone}",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 15,
                      color: AppColors.text),
                ),
              ),
              trailing: GestureDetector(
                  onTap: () {
                  },
                  child: Icon(
                    Icons.double_arrow_sharp,
                    color: AppColors.text.withOpacity(0.1),
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
