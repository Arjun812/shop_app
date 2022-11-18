
import 'package:flutter/material.dart';


class ShopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShopAppBar({Key? key,this.title,this.leading,this.color,this.backgroundColor,}) : super(key: key);
  final String? title;
  final Widget? leading;
  final  Color? color;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: (){
          Navigator.of(context).pop();
        },

        child: Icon(
          Icons.arrow_back,
          color: color,
          size: 30,
        ),
      ),
      backgroundColor: backgroundColor,
      centerTitle: false,
      titleSpacing: 22,
      title: Transform(
        // you can forcefully translate values left side using Transform
        transform: Matrix4.translationValues(-20.0, 0.0, 0.0),
        child: RichText(
          //  textAlign: TextAlign.center,
          text: TextSpan(
            text: title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),

    );
  }
  @override
  Size get preferredSize => AppBar().preferredSize;
}

