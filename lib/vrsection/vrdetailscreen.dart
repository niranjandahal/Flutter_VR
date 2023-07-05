import 'package:flutter/material.dart';

class VrDetailsSection extends StatefulWidget {
  final String placename;
  final String videoid;
  const VrDetailsSection({super.key, required this.placename, required this.videoid});

  @override
  State<VrDetailsSection> createState() => _VrDetailsSectionState();
}

class _VrDetailsSectionState extends State<VrDetailsSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vr Details Section'),
      ),
      body: const Center(
          child: Column(
        children: [],
      )),
    );
  }
}
