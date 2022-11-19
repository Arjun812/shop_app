import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shop_app/utils/constants.dart';

import '../utils/styles.dart';

class ProductCard extends StatefulWidget {
  final String pid;
  final String? cost, discountPrice, title, imageUrl, description;
  final VoidCallback? onTap;

  final EdgeInsetsGeometry padding;

  const ProductCard({
    Key? key,
    required this.pid,
    this.cost,
    this.padding = const EdgeInsets.all(0),
    this.title,
    this.imageUrl,
    this.description,
    this.onTap,
    this.discountPrice,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: widget.padding,
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
            decoration:  BoxDecoration(
            color: Colors.white,
            boxShadow: [  BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(3, 3),
            ),]
        ),
          margin: EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(children: [
                Card(
                  margin: EdgeInsets.all(0),
                  elevation: 4,
                  clipBehavior: Clip.hardEdge,
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    height: 120,
                    width: 120,
                    imageErrorBuilder: (_, __, ___) {
                      return Image.network(
                          'https://picsum.photos/200/300'); //this is what will fill the Container in case error happened
                    },
                    placeholder: const AssetImage(Base.placeHolder),
                    image: NetworkImage(widget.imageUrl!),
                  ),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Text(
                  widget.title!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                width: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 7,
                      child: Text(
                        "Rs ${widget.cost}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    widget.discountPrice != "0" && widget.discountPrice != null
                        ? const SizedBox(width: 2)
                        : Container(),
                    widget.discountPrice != "0" && widget.discountPrice != null
                        ? Flexible(
                            flex: 6,
                            child: Text(
                              'QR ${widget.discountPrice}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ))
                        : Container()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
