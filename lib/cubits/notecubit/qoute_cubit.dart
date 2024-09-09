import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoutes/cubits/notecubit/qoute_state.dart';
import 'package:qoutes/services/get_data.dart';
import 'package:qoutes/services/qoute_model.dart';

class QouteCubit extends Cubit<QouteState> {
  final Services qoute;
  QouteCubit(this.qoute) : super(InitialState());

  static QouteCubit get(context) => BlocProvider.of(context);

  List<QouteModel> qoutes = [];
  List<QouteModel> favorites = [];
  List<String> category = [
    "age",
    "amazing",
    "failure",
    "attitude",
    "beauty",
    "forgiveness",
    "happiness",
    "hope",
    "dreams",
    "imagination",
    "inspirational",
    "intelligence",
    "knowledge",
    "leadership",
    "learning",
    "life",
    "success"



  ];


  void fetchQoutes() async {
    emit(LoadingState());
    try {
      for (int i = 0; i < category.length; i++) {
        qoutes.add(await qoute.getData(category[i])!);
      }
      emit(sucessState());
    } catch (e) {
      emit(FailureState());
    }
  }

  void addFav(QouteModel myqoute) {
    if (favorites.contains(myqoute)) {
      favorites.remove(myqoute);
      emit(RemovFavState());
    } else {
      favorites.add(myqoute);
      emit(AddFavState());
    }
  }
}
