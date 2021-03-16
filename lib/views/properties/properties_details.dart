import 'package:flutter/material.dart';
import 'package:real_estate_app/models/property.dart';
import 'package:real_estate_app/utilities/constants.dart';
import 'package:real_estate_app/views/components/icon_text_horizontal.dart';
import 'package:real_estate_app/views/components/icon_text_vertical.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:video_player/video_player.dart';

class PropertiesDetails extends StatefulWidget {
  PropertiesDetails({
    Key key,
    @required this.property,
  }) : super(key: key);

  final Property property;

  @override
  _PropertiesDetailsState createState() => _PropertiesDetailsState();
}

class _PropertiesDetailsState extends State<PropertiesDetails> {
  VideoPlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.network(
        'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4');
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller..initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final property = widget.property;
    final photos = widget.property.img;
    final agent = widget.property.agentId;
    return Scaffold(
      body: SafeArea(
        child: SlidingUpPanel(
          parallaxEnabled: true,
          parallaxOffset: 1,
          boxShadow: [BoxShadow(blurRadius: 0)],
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
            bottom: Radius.zero,
          ),
          body: Container(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.5,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            // "https://www.realestatebd.com/images/pic8.jpg",
                            property.img.isNotEmpty
                                ? widget.property.img.first
                                : "https://www.realestatebd.com/images/pic8.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.keyboard_arrow_left,
                          color: Colors.white, size: 50),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 300,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: kMainScreenPadding,
                        right: kMainScreenPadding,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            property.name,
                            style: kCardLargeTextStyle,
                          ),
                          Text(
                            "\$${property.price}",
                            style: kCardLargeTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: kMainScreenPadding,
                        right: kMainScreenPadding,
                        bottom: 15.0,
                      ),
                      child: Row(
                        children: [
                          IconTextHorizontal(
                            title: property.location,
                            icon: Icons.location_on_outlined,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          panelBuilder: (scrollController) => SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
            controller: scrollController,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 30,
                          foregroundColor: Colors.black,
                          foregroundImage: NetworkImage(
                            agent.img.isNotEmpty
                                ? agent.img
                                : "https://giantbomb1.cbsistatic.com/uploads/scale_medium/1/16944/2427349-426065_10151435086863987_724057164_n.jpg",
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            agent.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            agent.title,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.phone),
                        color: kPrimaryAccentColor,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.email),
                        color: kPrimaryAccentColor,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconTextVertical(
                        icon: Icons.king_bed_outlined,
                        iconColor: kPrimaryAccentColor,
                        text: property.bed.toString(),
                        titleText: "Bedroom",
                      ),
                      IconTextVertical(
                        icon: Icons.bathtub_outlined,
                        iconColor: kPrimaryAccentColor,
                        text: property.bath.toString(),
                        titleText: "Bathroom",
                      ),
                      IconTextVertical(
                        icon: Icons.kitchen_outlined,
                        iconColor: kPrimaryAccentColor,
                        text: "0",
                        titleText: "Kitchen",
                      ),
                      IconTextVertical(
                        icon: Icons.pool_outlined,
                        iconColor: kPrimaryAccentColor,
                        text: property.pool.toString(),
                        titleText: "Pool",
                      ),
                      IconTextVertical(
                        icon: Icons.local_parking,
                        iconColor: kPrimaryAccentColor,
                        text: "0",
                        titleText: "Parking",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Description",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    property.description.isNotEmpty
                        ? property.description
                        : "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Photos",
                  ),
                  GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    shrinkWrap: true,
                    children: [
                      for (var i in photos)
                        Container(
                          height: 100,
                          width: 100,
                          child: Image.network(
                            // "https://cdn.britannica.com/08/187508-050-D6FB5173/Shanghai-Tower-Gensler-San-Francisco-world-Oriental-2015.jpg",
                            i,
                            fit: BoxFit.fill,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Video",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: _controller.value.isInitialized
                        ? AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          )
                        : Container(),
                  ),
                  IconButton(
                    icon: _controller.value.isPlaying
                        ? Icon(Icons.pause, color: kPrimaryAccentColor)
                        : Icon(Icons.play_arrow, color: kPrimaryAccentColor),
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
