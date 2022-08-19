import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modern Pathologist'),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Chest X-Ray',
                  style: TextStyle(fontSize: 15),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.blue.shade900),
              )
            ],
          ),
          constraints: BoxConstraints.expand(),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://img.freepik.com/free-vector/painted-mountain-view-landscape-illustration_53876-8144.jpg?w=360&t=st=1660885121~exp=1660885721~hmac=dae3d4bc1305dd984e92536313e22876ffcda731c19a29814063f4d55ec1a03e'))),
        ),
      ),
    );
  }
}
