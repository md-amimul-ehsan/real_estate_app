import 'package:flutter/material.dart';
import 'package:real_estate_app/views/components/icon_text_vertical.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:video_player/video_player.dart';

class PropertiesDetails extends StatefulWidget {
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
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      parallaxEnabled: true,
      parallaxOffset: 0.7,
      boxShadow: [BoxShadow(blurRadius: 0)],
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
        bottom: Radius.zero,
      ),
      body: Image(
        image: NetworkImage(
          "https://cdn.britannica.com/08/187508-050-D6FB5173/Shanghai-Tower-Gensler-San-Francisco-world-Oriental-2015.jpg",
        ),
        fit: BoxFit.fill,
      ),
      header: Center(
        child: Divider(
          height: 100,
          color: Colors.black,
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
                  CircleAvatar(
                    radius: 30,
                    foregroundColor: Colors.black,
                    foregroundImage: NetworkImage(
                      "https://giantbomb1.cbsistatic.com/uploads/scale_medium/1/16944/2427349-426065_10151435086863987_724057164_n.jpg",
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Agent name",
                      ),
                      Text(
                        "Agent description",
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.phone),
                    color: Colors.orange,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.email),
                    color: Colors.orange,
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
                    color: Colors.orange,
                    text: "Bedrooms",
                  ),
                  IconTextVertical(
                    icon: Icons.bathtub_outlined,
                    color: Colors.orange,
                    text: "Bathrooms",
                  ),
                  IconTextVertical(
                    icon: Icons.kitchen_outlined,
                    color: Colors.orange,
                    text: "Kitchens",
                  ),
                  IconTextVertical(
                    icon: Icons.pool_outlined,
                    color: Colors.orange,
                    text: "Pools",
                  ),
                  IconTextVertical(
                    icon: Icons.local_parking,
                    color: Colors.orange,
                    text: "Parking",
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Description",
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
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
                  Container(
                    height: 100,
                    width: 100,
                    child: Image.network(
                      "https://cdn.britannica.com/08/187508-050-D6FB5173/Shanghai-Tower-Gensler-San-Francisco-world-Oriental-2015.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: Image.network(
                      "https://cdn.britannica.com/08/187508-050-D6FB5173/Shanghai-Tower-Gensler-San-Francisco-world-Oriental-2015.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: Image.network(
                      "https://cdn.britannica.com/08/187508-050-D6FB5173/Shanghai-Tower-Gensler-San-Francisco-world-Oriental-2015.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: Image.network(
                      "https://cdn.britannica.com/08/187508-050-D6FB5173/Shanghai-Tower-Gensler-San-Francisco-world-Oriental-2015.jpg",
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
                icon: _controller.value.isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying ? _controller.pause() : _controller.play();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
