import 'package:flutter/material.dart';
import 'package:r06placevr/HomeScreen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart';

class VrDetailsSection extends StatefulWidget {
  final String placename;
  final String videoid;
  const VrDetailsSection(
      {super.key, required this.placename, required this.videoid});

  @override
  State<VrDetailsSection> createState() => _VrDetailsSectionState();
}

class _VrDetailsSectionState extends State<VrDetailsSection> {
  late YoutubePlayerController _controller;
  bool _isplaying = true;
  bool _isvr = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    _controller = YoutubePlayerController(
        initialVideoId: widget.videoid,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          hideControls: true,
          controlsVisibleAtStart: false,
          startAt: 15,
          disableDragSeek: true,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            //onpressing i want to remove all and go to home page
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Homepage(),
                  ),
                  (route) => false);
            },
          ),
          title: Text(widget.placename.toString()),
        ),
        body: OrientationBuilder(builder: (context, rotatestatus) {
          if (rotatestatus == Orientation.portrait && _isvr == false) {
            //360 gyroscope section
            return Stack(
              children: [
                YoutubePlayerBuilder(
                    player: YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: false,
                      onReady: () {
                        if (_isplaying) {
                          _controller.play();
                        }
                      },
                    ),
                    builder: (context, player) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: player,
                      );
                    }),
                //pausebutton
                Align(
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isplaying = !_isplaying;
                        if (_isplaying) {
                          _controller.play();
                        } else {
                          _controller.pause();
                        }
                      });
                    },
                    child: Icon(
                      _isplaying ? Icons.pause : Icons.play_arrow,
                      size: 40,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isvr = !_isvr;
                        if (_isvr) {
                          SystemChrome.setPreferredOrientations([
                            DeviceOrientation.landscapeLeft,
                          ]);
                        } else {
                          SystemChrome.setPreferredOrientations([
                            DeviceOrientation.portraitUp,
                          ]);
                        }
                      });
                    },
                    child: Icon(
                      _isvr ? Icons.videocam_off : Icons.videocam,
                      size: 40,
                    ),
                  ),
                ),
              ],
              //vrchangebutton
            );
            //sucessfully end of the 360 gyro sextion
          } else {
            //vr section
            return Stack(children: [
              YoutubePlayerBuilder(
                player: YoutubePlayer(
                  bufferIndicator: Container(),
                  progressIndicatorColor: Colors.transparent,
                  controller: _controller,
                  showVideoProgressIndicator: false,
                  onReady: () {
                    if (_isplaying) {
                      _controller.play();
                    }
                  },
                ),
                builder: (context, player) {
                  return Container(
                    child: player,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  );
                },
              ),
              //pausebutton
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isplaying = !_isplaying;
                      if (_isplaying) {
                        _controller.play();
                      } else {
                        _controller.pause();
                      }
                    });
                  },
                  child: Icon(
                    _isplaying ? Icons.pause : Icons.play_arrow,
                    size: 40,
                  ),
                ),
              ),
              //vr button
              Align(
                alignment: Alignment.topLeft,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isvr = !_isvr;
                      if (_isvr) {
                        SystemChrome.setPreferredOrientations([
                          DeviceOrientation.landscapeLeft,
                        ]);
                      } else {
                        SystemChrome.setPreferredOrientations([
                          DeviceOrientation.portraitUp,
                        ]);
                      }
                    });
                  },
                  child: Icon(
                    Icons.videocam,
                    size: 40,
                  ),
                ),
              ),
              //customvrmanupulation
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: 20,
                  color: Colors.black,
                ),
              ),
            ]);
          }
        }));
  }
}
