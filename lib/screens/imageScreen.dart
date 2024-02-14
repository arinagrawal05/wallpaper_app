import 'dart:io';
import 'dart:async';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';

import '../providers/image_provider.dart';
import '../widgets/options.dart';

class ImageScreen extends StatelessWidget {
  final String url;
  final String title;
  final String description;
  ImageScreen(
      {required this.url, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Hero(
          tag: url,
          child: Container(
            child: CachedNetworkImage(
              imageUrl: url,
              filterQuality: FilterQuality.high,
            ),
            height: double.infinity,
            width: double.infinity,
          ),
        ),
      ),
      floatingActionButton: buildFAB(
        context,
      ),
    );
  }

  SpeedDial buildFAB(
    BuildContext context,
  ) {
    return SpeedDial(
      // overlayColor: Color(0xff457b9d),
      backgroundColor: Color(0xff457b9d),
      activeBackgroundColor: Color(0xff457b9d),
      activeForegroundColor: Color(0xff457b9d),
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 20),
      curve: Curves.easeInCirc,
      children: [
        // SpeedDialChild(
        //   backgroundColor: Colors.amber,
        //   child: Icon(
        //     Icons.download_rounded,
        //   ),
        //   onTap: () async {
        //     var result = await Provider.of<Images>(context, listen: false)
        //         .downloadImage(url);
        //     String msg =
        //         result ? 'Image Downloaded!!!' : 'Something Went Wrong!';
        //     // _scaffoldKey!.currentState!
        //     //     .showSnackBar(SnackBar(content: Text(msg)));
        //     print(msg);
        //     Fluttertoast.showToast(
        //       msg: msg,
        //       backgroundColor: Colors.green[100],
        //       fontSize: 16,
        //       gravity: ToastGravity.CENTER,
        //       toastLength: Toast.LENGTH_LONG,
        //     );
        //   },
        //   label: 'Download',
        //   labelBackgroundColor: Colors.amber,
        // ),

        SpeedDialChild(
          backgroundColor: Color(0xff457b9d),
          child: Icon(
            Icons.wallpaper,
          ),
          onTap: () {
            print('Set Wallpaper');
            showDialog(
              context: context,
              builder: (context) => Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                child: Container(
                  height: 203,
                  child: Option(url),
                ),
              ),
            );
          },
          label: 'Set Wallpaper',
          labelBackgroundColor: Color(0xff457b9d),
        ),
      ],
    );
  }
}
