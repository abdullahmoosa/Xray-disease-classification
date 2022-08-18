// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';

class TfliteModel extends StatefulWidget {
  @override
  State<TfliteModel> createState() => _TfliteModelState();
}

class _TfliteModelState extends State<TfliteModel> {
  File? _image;
  List? _results;
  bool imageSelect = false;
  @override
  void initState() {
    super.initState();
    imageSelect = true;

    loadModel().then((value) {
      setState(() {
        imageSelect = false;
      });
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
      numThreads: 1,
    );
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 2,
        threshold: 0.2,
        asynch: true);
    setState(() {
      //imageSelect = false;
      _results = output!;
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    File image = File(pickedFile!.path);
    setState(() {
      imageSelect = true;
      _image = image;
    });
    classifyImage(image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chest X-ray Classification'),
      ),
      body: Container(
          child: Column(children: <Widget>[
        const SizedBox(
          height: 30,
        ),
        imageSelect == false
            ? Container(
                margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Text(
                  'Please Select An Image From Gallery',
                  style: TextStyle(fontSize: 20),
                ),
                height: 300,
                width: double.infinity,
              )
            : Container(
                margin: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 40,
                    ),
                    _image == null ? Container() : Image.file(_image!),
                    const SizedBox(
                      height: 40,
                    ),
                    _image == null
                        ? Container()
                        : _results != null
                            ? Text(
                                "${_results![0]["label"].toString().toUpperCase()} - Detected",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            : Container(
                                child: Text(
                                    "Nothing Detected, Please try Again! "))
                  ],
                ),
              ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
      ])),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImage,
        tooltip: "Pick Image",
        child: const Icon(Icons.image),
      ),
    );
  }
}
