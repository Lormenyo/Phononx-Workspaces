import 'dart:html';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(this.imageUrl),
                  onError: (_, e) {},
                  fit: BoxFit.cover)),
        ),
        Text("${this.id}", style: Theme.of(context).textTheme.headline6),
        Text(this.name, style: Theme.of(context).textTheme.headline6),
      ],
    );
  }
}
