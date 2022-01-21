import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WorkspaceWidget extends StatelessWidget {
  final int id;
  final String name;
  final String imageUrl;
  const WorkspaceWidget(
      {Key? key, required this.id, required this.name, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: CachedNetworkImageProvider(this.imageUrl),
                    onError: (_, e) {},
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 60,
          ),
          Container(
              child: Text("${this.id}",
                  style: Theme.of(context).textTheme.subtitle1)),
          SizedBox(
            width: 60,
          ),
          Flexible(
            child: Container(
                child: Text(
              this.name,
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.left,
            )),
          ),
        ],
      ),
    );
  }
}
