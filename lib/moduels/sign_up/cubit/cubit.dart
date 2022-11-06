import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/models/social_get_user_data/user_data_model.dart';
import 'package:social/moduels/sign_up/cubit/states.dart';
import 'package:social/shared/network/remote/dio_helper.dart';
import 'package:social/shared/network/remote/end_points.dart';

class SignUpCubit extends Cubit<SignUpStates>
{
  SignUpCubit(): super(SignUpInitialState());

  static SignUpCubit get(context)=>BlocProvider.of(context);


  GetUserDataModel? getUserDataModel;
  void signUpUser({
    required String email,
    required String password
  })
  {
    emit(SignUpLoadingState());
    DioHelper.postData(
      url: login,
      data:{
        'email':email,
        'password':password,
      },


    ).then((value) {
      getUserDataModel=GetUserDataModel.fromJson(value.data);
      emit(SignUpSuccessState());
    }).catchError((error){
      // ignore: avoid_print
      print(error.toString());
      emit(SignUpErrorState());
    });
  }
}