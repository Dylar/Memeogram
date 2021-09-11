import 'package:flutter/material.dart';

import '../../asset_paths.dart';

class LoadingStartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage(loadingImagePath),
        ),
      ),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
