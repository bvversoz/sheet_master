
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Dashboard/custom_classes.dart';


class CustomTextButton extends StatelessWidget {
  final String imageAssetPath;
  final String text;
  final String url;

  CustomTextButton({
    required this.imageAssetPath,
    required this.text,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          child: Text(
            text,
            style: PluginsAndMore(),
          ),
          onPressed: () async {
            if (await canLaunch(url)) {
              await launch(
                url,
              );
            } else {
              throw 'Could not launch $url';
            }
          },
        ),
        SizedBox(height: 25, width: 25, child: Image.asset(imageAssetPath)),
      ],
    );
  }
}
