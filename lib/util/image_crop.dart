import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageCrop extends StatelessWidget {
  final String url;

  const ImageCrop({Key key, this.url}) : super(key: key);

  double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(
            top: 8,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            child: Container(
              width: fullWidth(context) * (.8) - 8,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
              ),
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: customNetworkImage(url, fit: BoxFit.cover),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget customNetworkImage(String path, {BoxFit fit = BoxFit.contain}) {
    return CachedNetworkImage(
      fit: fit,
      imageUrl: path,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      placeholderFadeInDuration: Duration(milliseconds: 500),
      placeholder: (context, url) => Container(
        color: Color(0xffeeeeee),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
