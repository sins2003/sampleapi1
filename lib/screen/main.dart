import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/controller.dart';

class mainpage extends StatelessWidget {
  final TableControllerclass itmcontroller = Get.put(TableControllerclass());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Obx(() {
          if (itmcontroller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: itmcontroller.itemlList.length,
              itemBuilder: (context, index) {
                return DataTable(columns: [
                  DataColumn(
                      label: Text(
                        "Name",
                        style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      )),
                  DataColumn(
                      label: Text(
                        "UID",
                        style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      )),
                  DataColumn(
                      label: Text(
                        "Doc Type",
                        style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      )),
                  DataColumn(
                      label: Text(
                        "Image",
                        style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      )),
                ], rows: [
                  DataRow(cells: [
                    DataCell(Text(itmcontroller.itemlList[index]["name"])),
                    DataCell(Text(itmcontroller.itemlList[index]["uid"])),
                    DataCell(Text(itmcontroller.itemlList[index]["docType"])),
                    DataCell(Image(
                        image: NetworkImage(
                            itmcontroller.itemlList[index]["url"]))),
                  ])
                ]);
              },
            );
          }
        },),
      ),
    );
  }
}
