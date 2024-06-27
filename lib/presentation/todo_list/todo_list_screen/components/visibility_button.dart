import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VisibilityButton extends StatelessWidget {
  const VisibilityButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset('assets/svg/visibility_off.svg'),
      onPressed: () {},
    );
  }
}
