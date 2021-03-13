import 'package:flutter/material.dart';

class PhotoGallery extends StatelessWidget {
  const PhotoGallery({
    Key key,
    @required this.photos,
    @required this.numCols,
  }) : super(key: key);

  final List<String> photos;
  final int numCols;

  @override
  Widget build(BuildContext context) {
    int numRows = photos.length % 3 > 0
        ? (photos.length / 3 + 1).toInt()
        : (photos.length / 3).toInt();

    List<Widget> rows = [];
    int count = 0;
    for (int i = 0; i < numRows; i++) {
      List<Widget> photosWidgets = [];
      for (int j = 0; j < numCols; j++) {
        if (count > photos.length - 1)
          break;
        else {
          photosWidgets.add(
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: NetworkImage(
                  photos[count],
                ),
                height: 110,
                width: 110,
                fit: BoxFit.fill,
              ),
            ),
          );
          photosWidgets.add(
            SizedBox(
              width: 10,
            ),
          );
          count++;
        }
      }
      Row row = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: photosWidgets,
      );
      rows.add(row);
      rows.add(
        SizedBox(
          height: 10,
        ),
      );
    }
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: rows,
      ),
    );
  }
}
