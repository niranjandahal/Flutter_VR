import 'package:flutter/material.dart';

class PlaceHomeSection extends StatefulWidget {
  const PlaceHomeSection({super.key});

  @override
  State<PlaceHomeSection> createState() => _PlaceHomeSectionState();
}

class _PlaceHomeSectionState extends State<PlaceHomeSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Place Home Section'),
      ),
      body: const Center(
          child: Column(
        children: [
          Text(
              'It will contain various places of Nepal fetched realtime from database'),
        ],
      )),
    );
  }
}
