// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, curly_braces_in_flow_control_structures

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubePlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (_movies.isEmpty)
      return Container(child: Center(child: CircularProgressIndicator()));

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('YOUTUBE VIDEO'),
        centerTitle: true,
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: _movies.length,
        itemBuilder: (_, i) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Container(
            width: 370,
            child: CustomYoutubePlayer(youtubeURL: _movies[i]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'HeroBackButtom',
        child: Icon(Icons.home),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}

class CustomYoutubePlayer extends StatefulWidget {
  final String? youtubeURL;

  const CustomYoutubePlayer({required this.youtubeURL});

  @override
  State<CustomYoutubePlayer> createState() => _CustomYoutubePlayerState();
}

class _CustomYoutubePlayerState extends State<CustomYoutubePlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId:
          YoutubePlayerController.convertUrlToId(widget.youtubeURL!)!,
      params: const YoutubePlayerParams(
        loop: true,
        color: 'transparent',
        desktopMode: true,
        strictRelatedVideos: true,
        showFullscreenButton: !kIsWeb,
        autoPlay: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => YoutubePlayerControllerProvider(
        controller: _controller,
        child: YoutubePlayerIFrame(
          controller: _controller,
        ),
      );
}

List<String> _movies = [
  'https://www.youtube.com/watch?v=O_uUXxy6ADk&list=RDO_uUXxy6ADk&start_radio=1',
  'https://www.youtube.com/watch?v=hbfadtw-fjs',
  'https://www.youtube.com/watch?v=Df00ZNYEcAY',
];
