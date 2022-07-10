import 'package:bloc/bloc.dart';
import 'package:bloc_pub/Models/UserModel.dart';
import 'package:flutter/material.dart';

class UserBlocProvider extends Cubit<List<UserModel>> {
  UserBlocProvider() : super([]);

  void addUser({required UserModel newUser}) => emit([...state, newUser]);
}
