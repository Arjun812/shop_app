import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/pages/homePage/viewModel/home_page_cubit.dart';
import 'package:shop_app/services/arguments.dart';
import 'package:shop_app/utils/gifs.dart';
import 'package:shop_app/widgets/app_bar.dart';
import 'package:shop_app/widgets/multi_filter.dart';
import 'package:shop_app/widgets/product_card.dart';

import '../../../utils/styles.dart';
import '../../../widgets/sort_filter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Query? query;
  String _sort = '-1';
  List<SortModel> _sortModel = const [
    SortModel('Price', '0'),
    SortModel('Rating', '1'),
    SortModel('Discount', '2'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var cubit= BlocProvider.of<HomePageCubit>(context);
    return BlocProvider(
        create: (ctx) =>
        HomePageCubit()
          ..getProduct(),
        child: Builder(
            builder: (context) {
              return Scaffold(
                  appBar: const ShopAppBar(
                    title: 'Shop',
                  ),
                  body: BlocConsumer<HomePageCubit, HomePageState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        if (state is HomePageLoading) {
                          return const Loading();
                        }
                        if (state is HomePageLoaded) {
                          return SingleChildScrollView(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              child: Column(children: [
                                GestureDetector(
                                  onTap: () =>
                                      showModalBottomSheet(
                                        context: context,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20.0),
                                              topRight: Radius.circular(20.0)),
                                        ),
                                        backgroundColor: Theme
                                            .of(context)
                                            .primaryColor
                                            .withOpacity(0.0),
                                        builder: (contex) =>
                                            ClipRRect(
                                              clipBehavior: Clip.antiAlias,
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                    sigmaX: 5, sigmaY: 5),
                                                child: Sort(
                                                  sort: _sortModel,
                                                  sortValue: _sort,
                                                  onSort: (sort) {
                                                    _sort = sort;
                                                    BlocProvider.of<
                                                        HomePageCubit>(context)
                                                        .getProduct(sort: sort);
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ),
                                            ),
                                      ),
                                  child: Icon(Icons.sort),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20.0),
                                              topRight: Radius.circular(20.0)),
                                        ),
                                        backgroundColor: Theme
                                            .of(context)
                                            .primaryColor
                                            .withOpacity(0.0),
                                        builder: (contex) =>
                                            ClipRRect(
                                              clipBehavior: Clip.antiAlias,
                                              child: BackdropFilter(
                                                  filter: ImageFilter.blur(
                                                      sigmaX: 5, sigmaY: 5),
                                                  child: Filter(
                                                    category: "Brand",
                                                    filter: const [
                                                    ],
                                                    filterValue: const [
                                                    ],
                                                    onFilter: (value) {

                                                    },
                                                  )
                                              ),
                                            ),
                                      );
                                    },
                                    child: const Icon(Icons.filter_alt)),


                                GridView.builder(
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 3 / 4,
                                      mainAxisSpacing: 6,
                                      crossAxisSpacing: 6,
                                      mainAxisExtent: 170,
                                      crossAxisCount: 2,
                                    ),
                                    shrinkWrap: true,
                                    itemCount: state.model!.products?.length,
                                    primary: false,
                                    itemBuilder: (context, index) =>
                                        ProductCard(
                                          onTap: () {
                                            Navigator.of(context).pushNamed(
                                                'singleProduct',
                                                arguments: SingleProductArgs(
                                                    state.model!
                                                        .products![index]));
                                          },
                                          pid: state.model!.products![index].id
                                              .toString(),
                                          title: state.model!.products![index]
                                              .title,
                                          cost: state.model!.products![index]
                                              .price.toString(),
                                          description: state.model!
                                              .products![index].description,
                                          imageUrl: state.model!
                                              .products![index].thumbnail,
                                          discountPrice: state.model!
                                              .products![index]
                                              .discountPercentage.toString(),
                                        )

                                ),

                              ],
                              ));
                        }
                        return Container();
                      }
                      )
              );
            }
        ));
  }
}