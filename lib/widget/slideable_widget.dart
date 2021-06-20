import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:sqlite_db/controller/form_controller.dart';
import 'package:sqlite_db/resources/colors.dart';

class SlidableWidget extends StatelessWidget {
  final Widget child;
  final int index;
  SlidableWidget({Key? key, required this.child, required this.index}) : super(key: key);
  final formController = Get.put(FormController());
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      child: child,
    actionExtentRatio: 0.23,
    closeOnScroll: true,
    actions: [
      Container(
        margin: EdgeInsets.all(15),
        child: ClipOval(
          child: IconSlideAction(
            onTap: (){
              // formController.customLauncher(medium: "tel:+88 ${formController.contactList[index].phone}");
              },
            icon: Icons.call_outlined,
            color: AppColors.call,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.all(15),
        child: ClipOval(
          child: IconSlideAction(
            icon: Icons.message_outlined,
            color: AppColors.message,
            foregroundColor: Colors.white,
            onTap: (){
              // formController.customLauncher(medium: "sms:+88 ${formController.contactList[index].phone}");
              },
          ),
        ),
      ),
    ],
    );
  }
}
