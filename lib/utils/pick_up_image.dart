import 'dart:io';

import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickUpImage extends StatefulWidget {
  final double height, width;
  final IconData icon;

  const PickUpImage({
    Key key,
    this.height,
    this.width,
    this.icon,
  }) : super(key: key);

  @override
  _PickUpImageState createState() => _PickUpImageState();
}

class _PickUpImageState extends State<PickUpImage> {
  File imageURI;

  Future getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imageURI = image;
    });
  }

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageURI = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showCupertinoDialog(
            context: context,
            builder: (BuildContext context) => Align(
                  alignment: Alignment.bottomCenter,
                  child: CupertinoActionSheet(
                    title: const Text('Choose your options',
                        style: TextStyle(
                          fontSize: 12,
                        )),
                    actions: <Widget>[
                      CupertinoActionSheetAction(
                        child: const Text('From Camera',
                            style: TextStyle(
                              fontSize: 17,
                            )),
                        onPressed: () {
                          Navigator.pop(context, 'camera');
                          getImageFromCamera();
                        },
                      ),
                      CupertinoActionSheetAction(
                        child: const Text('From Gallery',
                            style: TextStyle(
                              fontSize: 17,
                            )),
                        onPressed: () {
                          Navigator.pop(context, 'gallery');
                          getImageFromGallery();
                        },
                      ),
                    ],
                    cancelButton: CupertinoActionSheetAction(
                      child: const Text('Cancel',
                          style: TextStyle(
                            fontSize: 17,
                          )),
                      isDefaultAction: true,
                      onPressed: () {
                        Navigator.pop(context, 'Cancel');
                      },
                    ),
                  ),
                ));
      },
      child: FDottedLine(
        color: Colors.black45,
        strokeWidth: 1,
        space: 2.0,
        corner: FDottedLineCorner.all(5),
        child: Container(
            height: widget.height,
            width: widget.width,
            child: imageURI == null
                ? Icon(
                    widget.icon,
                    color: Colors.black45.withOpacity(0.3),
                  )
                : Image.file(
                    imageURI,
                    width: widget.width,
                    height: widget.height,
                    fit: BoxFit.cover,
                  )),
      ),
    );
  }
}
