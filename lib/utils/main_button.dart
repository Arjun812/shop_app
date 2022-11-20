
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/utils/styles.dart';



class MainButton extends StatelessWidget {
  final VoidCallback onPressed;
  double? height;
  double? width;
  final bool? isLoading;
  final String text;
  final String? text2;
  MainButton({
    Key? key,
    this.height,
    this.isLoading,
    this.width,
    required this.onPressed,
    this.text = "ok",
    this.text2,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: height??80,
      width: width??size.width/1.3,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: AppColors.primaryColor,
          shape: const RoundedRectangleBorder(
              side: Borders.primaryBorder,
              borderRadius: BorderRadius.all(Radius.circular(25))),
          padding: const EdgeInsets.all(10),
          textStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: isLoading == true ?
              const CircularProgressIndicator()
                  :Text(
                text,
                maxLines: 1,
                style:  GoogleFonts.karla(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            text2 !=null ?
            Container(
              child: Text(
                text2!,
                maxLines: 1,
                style: GoogleFonts.karla(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize:  14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ): Container(),
          ],
        ),
      ),
    );
  }
}
