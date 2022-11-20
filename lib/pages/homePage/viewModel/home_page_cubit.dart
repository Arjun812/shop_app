import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/pages/homePage/home_repo.dart';
import 'package:shop_app/pages/homePage/model/product_model.dart';

import '../../../widgets/sort_filter.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());

  void getProduct({String? sort, List<String>? filter})async{
    try{
      emit(HomePageLoading());
      ProductModel model = await getProductRepo();

      ///sort
      if(sort == "0" ){
        model.products!.sort((a,b)=> a.price!.compareTo(b.price!));
      }
      if(sort == "1" ){
        model.products!.sort((a,b)=> a.rating!.compareTo(b.rating!));
      }
      if(sort == "2" ){
        model.products!.sort((a,b)=> a.discountPercentage!.compareTo(b.discountPercentage!));
      }


      emit(HomePageLoaded(model: model));
    }catch(e){
      HomePageError(e.toString());
    }
  }
}
