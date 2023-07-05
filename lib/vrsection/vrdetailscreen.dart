import 'package:flutter/material.dart';

class VrDetailsSection extends StatefulWidget {
  String placename;
  String videoid;
  VrDetailsSection({super.key, required this.placename, required this.videoid});

  @override
  State<VrDetailsSection> createState() => _VrDetailsSectionState();
}

class _VrDetailsSectionState extends State<VrDetailsSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vr Details Section'),
      ),
      body: Center(
          child: Column(
        children: [],
      )),
    );
  }
}
