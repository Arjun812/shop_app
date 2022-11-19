import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/pages/homePage/viewModel/home_page_cubit.dart';
import 'package:shop_app/utils/gifs.dart';
import 'package:shop_app/widgets/app_bar.dart';
import 'package:shop_app/widgets/product_card.dart';

import '../../../utils/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit()..getProduct(),
      child: Scaffold(
          appBar: const ShopAppBar(
            title: 'Shop',
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(children: [
              BlocConsumer<HomePageCubit, HomePageState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  if(state is HomePageLoading){
                    return const Loading();
                  }
                  if(state is HomePageLoaded){
                    return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 3 / 4,

                          mainAxisSpacing: 6,
                          crossAxisSpacing: 6,
                          mainAxisExtent: 170,
                          crossAxisCount: 2,
                        ),
                        shrinkWrap: true,
                        itemCount:state.model!.products?.length,
                        primary: false,
                        itemBuilder: (context, index) =>
                            ProductCard(
                              onTap: (){

                              },
                              pid:state.model!.products![index].id.toString(),
                              title: state.model!.products![index].title,
                              cost: state.model!.products![index].price.toString(),
                              description: state.model!.products![index].description,
                              imageUrl: state.model!.products![index].thumbnail,
                              discountPrice: state.model!.products![index].discountPercentage.toString(),
                            )

                    );
                  }
                  if(state is HomePageError){
                    return const Center(
                      child: Text(
                        'Error'
                      ),
                    );
                  }
                return Container();
                },

              ),
            ],),
          )
      ),
    );
  }
}
