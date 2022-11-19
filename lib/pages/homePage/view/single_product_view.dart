import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/pages/homePage/model/product_model.dart';
import 'package:shop_app/utils/styles.dart';
import 'package:shop_app/widgets/app_bar.dart';
import 'package:shop_app/widgets/image_slider.dart';

import '../../../services/arguments.dart';

class SingleProductView extends StatefulWidget {
  const SingleProductView({Key? key}) : super(key: key);

  @override
  State<SingleProductView> createState() => _SingleProductViewState();
}

class _SingleProductViewState extends State<SingleProductView> {
  @override
  Widget build(BuildContext context) {
    SingleProductArgs? args = ModalRoute.of(context)!.settings.arguments as SingleProductArgs;
    return Scaffold(
      appBar: const ShopAppBar(
        title: 'Product',
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AspectRatio(
                  aspectRatio: 2/1,
                  child: Stack(children:[
                    Container(
                        width: double.infinity,
                        child: ImageSlider(images:args.product!.images!)),
                  ]
                  ),),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        args.product!.title??"",
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(args.product!.rating.toString(),
                      style: TextStyle(fontSize: 14),),
                    const SizedBox(width: 1),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 18,
                    ),
                    SizedBox(width: 2),

                  ],
                ),
              ),
              //price section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Rs ${args.product!.price}",
                            style: GoogleFonts.karla(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(width: 10),
                          args.product!.discountPercentage == null
                              ? Container()
                              : args.product!.discountPercentage != 0
                              ? Text('${args.product!.discountPercentage.toString()} %',
                              style: const TextStyle(
                                  color: Colors.redAccent,

                                  fontSize: 20))
                              : Container()
                        ],
                      ),
                      Row(
                        children: [
                          Text('Items left',style: TextStyles.normalStyle,),

                          Text(args.product!.stock.toString(),
                            style: TextStyle(color:args.product!.stock!<=50?  Colors.red :Colors.black ,
                                fontSize: 14
                            ),)
                        ],
                      ),
                      args.product!.stock!<=50?const Text(
                        "Hurry up few items left",
                        style: TextStyle(color: Colors.grey),
                      ):Container(),
                    ],
                  ),
                ),
              ),
              //Description section
              args.product!.description == null
                  ? Container()
                  : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                args.product!.description.toString(),
                textAlign: TextAlign.justify,
              ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
