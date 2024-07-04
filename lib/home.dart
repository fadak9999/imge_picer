import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  //
  File? imge;
  final ImagPicker = ImagePicker();

  //////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      viewimage_in_gallery();
                    },
                    child: Text("add image in gallery")),
                Divider(),

                ///

                ElevatedButton(
                    onPressed: () {
                      viewimage_in_camera();
                    },
                    child: Text("add image in camera")),
                Divider(),

                ///
                SizedBox(
                  height: 20,
                ),
                ///////////

                Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.amber,
                        border: Border.all(
                          color: Colors.black,
                        )),
                    //
                    child: imge == null
                        ? Text("No image choosed")
                        : Image.file(imge!)),
                /////////////////
              ],
            ),
          )
        ],
      ),
    );
  }

  /////////////////////////////////////////////////////////////////////
  void viewimage_in_camera() async {
    // ignore: invalid_use_of_visible_for_testing_member
    var pickimage = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.camera);
    if (pickimage != null) {
      setState(() {
        imge = File(pickimage.path);
      });
    }
  }

  //2
  viewimage_in_gallery() async {
    // ignore: invalid_use_of_visible_for_testing_member
    var pickimage = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.gallery);
    if (pickimage != null) {
      setState(() {
        imge = File(pickimage.path);
      });
    } else {}
  }
}
