import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:r06placevr/placedatabasesection/placehomesection.dart';
import 'package:r06placevr/vrsection/vrdetailscreen.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<dynamic> places = [
    {
      "name": "Pashupatinath Temple",
      "photo": "assets/Pashupatinath.jpg",
      "vrvideoLink": "-h9dh8BzUqM"
    },
    {
      "name": "Pokhara",
      "photo": "assets/Pokhara.jpg",
      "vrvideoLink": "rpCjeuDBD4M"
    },
    {
      "name": "Boudhanath Stupa",
      "photo": "assets/Boudhanath Stupa.jpg",
      "vrvideoLink": "2FnS_W3XpC4"
    },
    {
      "name": "Everest Base Camp",
      "photo": "assets/Everestcamp.jpg",
      "vrvideoLink": "nqC7VnbCY7k"
    },
    {
      "name": "Durbar Square",
      "photo": "assets/Durbarsquare.jpg",
      "vrvideoLink": "ASZlMNWev7s"
    },
    {
      "name": "Garden of Dreams",
      "photo": "assets/Gardenofdreams.jpg",
      "vrvideoLink": "msvnJVLuZds"
    },
  ];

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, 
    ]);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          // VR section
          GridView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.8,
            ),
            itemCount: places.length,
            itemBuilder: (context, index) {
              final place = places[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VrDetailsSection(
                        placename: place['name'],
                        videoid: place['vrvideoLink'],
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(8),
                          ),
                          child: Image.asset(
                            place['photo'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          place['name'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          // Home section
          PlaceHomeSection(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.vrpano),
            label: 'VR',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
