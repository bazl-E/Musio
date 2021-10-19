import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Album extends StatelessWidget {
  const Album({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitile,
  }) : super(key: key);

  final String image;
  final String title;
  final String subtitile;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(.3),
              ),
              // margin: EdgeInsets.only(
              //     top: 12, right: 10, bottom: 5),
              height: 150,
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(image: CachedNetworkImageProvider(image)),

                // )
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: 150,
              // height: 15,
              child: Text(
                title
                    .split("(")[0]
                    .replaceAll("&amp;", "&")
                    .replaceAll("&#039;", "'")
                    .replaceAll("&quot;", "\""),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: 2),
            Text(
              subtitile,
              style: TextStyle(
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
