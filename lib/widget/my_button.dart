import 'package:flutter/material.dart';

class MyButtonWidget extends StatelessWidget {
  MyButtonWidget({
    super.key,
    this.minimumSize,
    this.onPressed,
    this.backgroundColor,
    this.child,
    this.lebar,
  });

  MaterialStateProperty<Size?>? minimumSize;
  MaterialStateProperty<Color?>? backgroundColor;
  Widget? child;
  void Function()? onPressed;
  double? lebar;

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;

    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: backgroundColor,
          minimumSize: MaterialStatePropertyAll(Size(lebar * 10, 60)),
          shape: const MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
        onPressed: onPressed,
        child: child);
  }
}
