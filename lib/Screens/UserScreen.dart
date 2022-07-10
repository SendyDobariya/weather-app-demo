import 'package:bloc_pub/Bloc/UserBlocProvider.dart';
import 'package:bloc_pub/Components/CustomeButton.dart';
import 'package:bloc_pub/Components/CustomeField.dart';
import 'package:bloc_pub/Const/CommonConst.dart';
import 'package:bloc_pub/Models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatefulWidget {
  UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  String _nameFieldLabel = "Name";
  String _ageFieldLabel = "Age";
  String _emailFieldLabel = "Email";

  @override
  Widget build(BuildContext context) {
    UserBlocProvider x =
        ModalRoute.of(context)?.settings.arguments as UserBlocProvider;

    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: SafeArea(
              child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                FormBuilder(
                    key: _formKey,
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        CustomeField(
                          textcapitalization: TextCapitalization.words,
                          labeltext: _nameFieldLabel,
                          textinputaction: TextInputAction.next,
                          validator: (String? value) {
                            print("Validator name value =>$value");
                            if (value == "" || value == null) {
                              return "Please enter name";
                            }
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomeField(
                          labeltext: _ageFieldLabel,
                          textinputaction: TextInputAction.next,
                          keyboardtype: TextInputType.number,
                          validator: (String? value) {
                            print("Validator age value $value");
                            if (value == "" || value == null) {
                              return "Please enter age";
                            }
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomeField(
                          labeltext: _emailFieldLabel,
                          textinputaction: TextInputAction.done,
                          keyboardtype: TextInputType.emailAddress,
                          onchange: (String? value) {
                            print("On CHANGE => $value");
                          },
                          validator: (String? value) {
                            print("Validator email value $value");
                            if (value == "" || value == null) {
                              return "Please enter email-id";
                            }
                            if (!RegExp(emailRex).hasMatch(value)) {
                              return "Please enter valid email-id";
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomeButton(
                            label: "Submit",
                            ontap: () {
                              print("Submit click");

                              if (_formKey.currentState!.validate()) {
                                print("VALIDATE");
                                FormBuilderState _state =
                                    _formKey.currentState!;

                                UserModel _user = UserModel(
                                  name: _state.fields[_nameFieldLabel]?.value,
                                  age: int.parse(
                                      _state.fields[_ageFieldLabel]?.value),
                                  emailId:
                                      _state.fields[_emailFieldLabel]?.value,
                                );
                                x.addUser(newUser: _user);
                                Navigator.of(context).pop();
                                // context
                                //     .read<UserBlocProvider>()
                                //     .addUser(newUser: _user);
                              }
                            })
                      ],
                    ))
              ],
            ),
          )),
        ));
  }
}
