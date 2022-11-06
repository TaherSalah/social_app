import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/models/social_login_model/login_model.dart';
import 'package:social/moduels/login/cubit/states.dart';
import 'package:social/moduels/sign_up/cubit/states.dart';
import 'package:social/shared/network/remote/dio_helper.dart';
import 'package:social/shared/network/remote/end_points.dart';

class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit(): super(LoginInitialState());

  static LoginCubit get(context)=>BlocProvider.of(context);


  LoginModel? loginModel;
  void loginUser({
    required String email,
    required String password
})
  {
    emit(LoginLoadingState());
    DioHelper.postData(
        url: login,
        data:{
          'email':email,
          'password':password,
        },


    ).then((value) {
       loginModel=LoginModel.fromJson(value.data);
       emit(LoginSuccessState());
    }).catchError((error){
      // ignore: avoid_print
      print(error.toString());
      emit(LoginErrorState());
    });
  }

  bool isPassword = true;
IconData suffixC =Icons.confirmation_number_sharp;


void changePasswordVisibility(){
  isPassword =!isPassword;
  suffixC=isPassword? Icons.visibility_rounded:Icons.visibility_off_rounded;
  emit(SocialLoginChangePasswordVisibilityState());
}
}