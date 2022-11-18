import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/pages/homePage/home_repo.dart';
import 'package:shop_app/pages/homePage/model/product_model.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());

  void getProduct()async{
    try{
      emit(HomePageLoading());
      ProductModel model = await getProductRepo();
      emit(HomePageLoaded(model: model));
    }catch(e){
      HomePageError(e.toString());
    }
  }
}
