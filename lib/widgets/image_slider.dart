import 'package:flutter/material.dart';
import 'package:shop_app/utils/constants.dart';

class ImageSlider extends StatefulWidget {
  final List<String> images;
  const ImageSlider({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _index = 0;
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: _controller,
          itemCount: widget.images.length,
          onPageChanged: (value) {
            setState(() {
              _index = value;
            });
          },
          itemBuilder: (context, index) => Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: FadeInImage(
              fit: BoxFit.contain,
              placeholder: const AssetImage(Base.placeHolder),
              image: NetworkImage(widget.images[index]),
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          right: 10,
          child: Row(
            children: [
              for (int i = 0; i < widget.images.length; i++)
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: i == _index
                        ? Colors.white
                        : Colors.grey.withOpacity(0.5),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
