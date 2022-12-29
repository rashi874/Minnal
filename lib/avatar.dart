import 'package:flutter/cupertino.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/Superman.png',
      colorBlendMode: BlendMode.srcOver,
      height: 100,
      width: 130,
    );
  }
}
