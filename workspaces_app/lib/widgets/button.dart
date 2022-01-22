import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onpressed;

  const Button({Key? key, this.child, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 5),
      height: 50,
      child: ElevatedButton(
        child: child,
        onPressed: onpressed,
        style: ButtonStyle(
            // disabledMouseCursor: Colors.,
            backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).colorScheme.primary),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(114),
            )),
            textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white))),
      ),
    );
  }
}
