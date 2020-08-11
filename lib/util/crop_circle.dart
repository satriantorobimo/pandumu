import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_crop/image_crop.dart';

class CropCirlce extends StatelessWidget {
  final File imagesPp;
  final cropKey = GlobalKey<CropState>();

  CropCirlce({Key key, this.imagesPp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Container(
            color: Colors.black,
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: _buildCroppingImage(context)),
      ),
    );
  }

  Widget _buildCroppingImage(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Crop.file(
            this.imagesPp,
            key: cropKey,
            aspectRatio: 2.0 / 2.0,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 20.0),
          alignment: AlignmentDirectional.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(
                child: Text(
                  'Crop Image',
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.white),
                ),
                onPressed: () => _cropImage(context),
              )
            ],
          ),
        )
      ],
    );
  }

  Future<void> _cropImage(BuildContext context) async {
    final scale = cropKey.currentState.scale;
    final area = cropKey.currentState.area;
    if (area == null) {
      // cannot crop, widget is not setup
      return;
    }

    // scale up to use maximum possible number of pixels
    // this will sample image in higher resolution to make cropped image larger
    final sample = await ImageCrop.sampleImage(
      file: imagesPp,
      preferredSize: (2000 / scale).round(),
    );

    final file = await ImageCrop.cropImage(
      file: sample,
      area: area,
    );

    print('Image lagi di crop : $file');
    Navigator.pop(context, file);
  }
}
