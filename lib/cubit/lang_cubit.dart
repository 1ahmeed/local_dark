import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../core/cache_helper.dart';
import 'lang_state.dart';


class LangCubit extends Cubit<LangState> {
  LangCubit() : super(LangInitial());

  static LangCubit get(context)=> BlocProvider.of(context);
  bool checkArabic() {
    return Intl.getCurrentLocale() == 'ar';
  }
   bool isArabic=false;
  void changeLang({bool? fromShared}){
    if(fromShared != null){
      isArabic =fromShared;
      emit(LangChangeSuccessState());
    }else {
      isArabic =  !isArabic;
    }
    CacheHelper.saveData(key: "isArabic", value: isArabic).
    then((value) {
      emit(LangChangeSuccessState());

    });
  }


  bool isDark=false;
  void changeMode({bool? fromShared}){
    if(fromShared != null){
      isDark =fromShared;
      emit(LangChangeModeStates());
    }else
    {
      isDark =  !isDark;
    }
    CacheHelper.saveData(key: "isDark", value: isDark).
    then((value) {
      emit(LangChangeModeStates());

    });
  }

}
