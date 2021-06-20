
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlite_db/database/db_helper.dart';
import 'package:sqlite_db/models/contact_model.dart';
import 'package:url_launcher/url_launcher.dart';

class FormController extends GetxController {
  final nameController = TextEditingController().obs;
  final imageController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final altrPhoneController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  final bloodController = TextEditingController().obs;
  final relationController = TextEditingController().obs;

  int? id;
  var switchValue = false.obs;
  var contactList = <ContactData>[].obs;
  var favouriteList = <ContactData>[].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void addToDatabase() async {
    ContactData updateData = ContactData(
      id: id,
      name: nameController.value.text,
      image: imageController.value.text,
      phone: phoneController.value.text,
      altrphone: altrPhoneController.value.text,
      email: emailController.value.text,
      address: addressController.value.text,
      blood: bloodController.value.text,
      relation: relationController.value.text,
      favourite: switchValue.value == false ? 0 : 1,
    );

    updateData.id == null
        ? await DBHelper.insert(updateData)
        : await DBHelper.updateData(updateData);
    clearField();
    fetchData();
  }

  void fetchData() async {
    List<Map<String, dynamic>> data = await DBHelper.fetchData();
    contactList.assignAll(data.map((e) => ContactData.fromJson(e)).toList());
    favouriteList.assignAll(contactList.where((fav) => fav.favourite == 1));
    contactList.sort((a, b) => a.name!.compareTo(b.name!));
    favouriteList.sort((a, b) => a.name!.compareTo(b.name!));
    print("Size: ${contactList.length}");
  }

  void deleteData(ContactData contactData) async {
    await DBHelper.delete(contactData);
    fetchData();
  }

  void editData(ContactData contactData) async {
    id = contactData.id;
    nameController.value.text = contactData.name!;
    phoneController.value.text = contactData.phone!;
    altrPhoneController.value.text = contactData.altrphone!;
    emailController.value.text = contactData.email!;
    addressController.value.text = contactData.address!;
    bloodController.value.text = contactData.blood!;
    relationController.value.text = contactData.relation!;
    switchValue.value = contactData.favourite == 0 ? false : true;
    imageController.value.text = contactData.image!;
  }

  void clearField() {
    nameController.value.text = "";
    phoneController.value.text = "";
    altrPhoneController.value.text = "";
    emailController.value.text = "";
    addressController.value.text = "";
    bloodController.value.text = "";
    relationController.value.text = "";
    imageController.value.text = "";
    switchValue.value = false;
  }

  void customLauncher() async {
    await canLaunch('tel:01722468897')
        ? await launch('tel:01722468897')
        : Get.snackbar("Error", "Failed to contact");
  }

  Future<void> refreshList() async {
    await Future.delayed(Duration(milliseconds: 1000));
    fetchData();
  }
}
