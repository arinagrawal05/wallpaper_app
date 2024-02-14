import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:preload_page_view/preload_page_view.dart';

import './imageScreen.dart';
import './searchScreen.dart';
import '../widgets/imageCard.dart';
import '../providers/image_model.dart';
import '../providers/image_provider.dart';

class HomepageScreen extends StatefulWidget {
  @override
  _HomepageScreenState createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  List<ImageModel> images = [];
  List<PreloadPageController> controllers = [];

  _loadImage() {
    images = Provider.of<Images>(context, listen: false).mainImages;
    setState(() {});
  }

  @override
  void initState() {
    _loadImage();
    controllers = [
      PreloadPageController(viewportFraction: 0.6, initialPage: 4),
      PreloadPageController(viewportFraction: 0.6, initialPage: 4),
      PreloadPageController(viewportFraction: 0.6, initialPage: 4),
      PreloadPageController(viewportFraction: 0.6, initialPage: 4),
      PreloadPageController(viewportFraction: 0.6, initialPage: 4),
      PreloadPageController(viewportFraction: 0.6, initialPage: 4),
      PreloadPageController(viewportFraction: 0.6, initialPage: 4),
    ];
    super.initState();
  }

  _animatePage(int page, int index) {
    for (int i = 0; i < 7; i++) {
      if (i != index) {
        controllers[i].animateToPage(page,
            duration: Duration(milliseconds: 300), curve: Curves.ease);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black38,
      body: PreloadPageView.builder(
        controller:
            PreloadPageController(viewportFraction: 0.7, initialPage: 4),
        itemCount: 7,
        preloadPagesCount: 7,
        itemBuilder: (context, mainIndex) {
          return PreloadPageView.builder(
            controller: controllers[mainIndex],
            itemCount: 7,
            preloadPagesCount: 7,
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            onPageChanged: (page) {
              _animatePage(page, mainIndex);
            },
            itemBuilder: (context, index) {
              var imageIndex = (mainIndex * 7) + index;
              ImageModel? image;
              if (images != null) {
                image = images[imageIndex];
              }
              return GestureDetector(
                onTap: () {
                  if (images != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ImageScreen(
                            url: image!.url,
                            title: image!.user,
                            description: image!.tags,
                          );
                        },
                      ),
                    );
                  }
                },
                child: Hero(
                  tag: image!.url,
                  child: ImageCard(
                    title: image!.user,
                    url: image!.url,
                    description: image!.tags,
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Row(
          children: [
            Icon(
              Icons.search,
              size: 20,
            ),
            Text("  Search"),
          ],
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchScreen(),
            ),
          );
        },
        // child: Icon(Icons.search),
      ),
    );
  }
}
