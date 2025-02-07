import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nearme_app/core/data/bloc/profile/profile_bloc.dart';
import 'package:nearme_app/core/services/validator.dart';
import '../../../../core/constants.dart';
import '../../Auth/Sign_up_and_in/components/phone_widget.dart';
import '../../Home/Home/components/round_image_widget.dart';
import '../../auth/Sign_up_and_in/components/functions.dart';
import '../../auth/Sign_up_and_in/components/text_form_widget.dart';
import 'edit_text_field.dart';
import 'button_widget.dart';

class EditUserWidget extends StatefulWidget {
  static String editUserWidgetKey = '/EditUserWidget';

  final double spaceWithRows;
  final double imagePositionTop;
  final double paddingTopContainer;

  const EditUserWidget({
    super.key,
    required this.spaceWithRows,
    required this.imagePositionTop,
    required this.paddingTopContainer,
  });

  @override
  _EditUserWidgetState createState() => _EditUserWidgetState();
}

class _EditUserWidgetState extends State<EditUserWidget> {
  final TextEditingController _dateController = TextEditingController();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  bool isChanged = false;
  String? fName, lName, password, email, phoneNumber, dateOfBirth;
  void onFieldChanged(String value) {
    setState(() {
      isChanged = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is UserEditedSuccessState) {
          return Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: widget.paddingTopContainer),
                  child: Container(
                    width: screenWidth * 0.85,
                    height: screenHeight * 0.70,
                    decoration: BoxDecoration(
                      color: kPrimaryColor1.withOpacity(.20),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 60),
                        const Text(
                          'Edit Your Profile',
                          style: TextStyle(
                            color: kFontColor,
                            fontFamily: kFontBold,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenWidth * 0.06),

                        // First Name Field
                        EditTextField(
                          hintText: state.userModel.fName,
                          iconData: Icons.person_outlined,
                          controller: firstNameController,
                          onChanged: ((p0) {
                            onFieldChanged(p0);
                            fName = p0;
                          }),
                        ),
                        SizedBox(height: widget.spaceWithRows),

                        // Last Name Field
                        EditTextField(
                          hintText: state.userModel.lName,
                          iconData: Icons.person_outlined,
                          controller: lastNameController,
                          onChanged: ((p0) {
                            onFieldChanged(p0);
                            lName = p0;
                          }),
                        ),
                        // SizedBox(height: widget.spaceWithRows),
                        // // Email Field
                        // EditTextField(
                        //   hintText: state.userModel.email,
                        //   iconData: Icons.email_outlined,
                        //   controller: emailController,
                        //   onChanged: ((p0) {
                        //     onFieldChanged(p0);
                        //     email = p0;
                        //   }),
                        //   keyboardType: TextInputType.emailAddress,
                        // ),
                        SizedBox(height: widget.spaceWithRows),

                        // Phone Number Field
                        PhoneNumberWidget(
                          hint: state.userModel.phoneNumber
                              .split("number: ")[1]
                              .replaceAll(")", ""),
                          onchange: ((p0) {
                            onFieldChanged(p0.toString());
                            setState(() {
                              phoneNumber = p0.toString();
                            });
                          }),
                          dropdownIconColor: kFontColor,
                          dropdownTextStyleColor: kFontColor,
                          enabledBorderColor: kFontColor,
                          focusedBorderColor: kFontColor,
                          hintStyleColor: kFontColor,
                          phoneNumberController: _phoneNumberController,
                        ),

                        //SizedBox(height: widget.spaceWithRows),
                        // Birth Date Field

                        TextFormFieldWidget(
                          lineFocusColor: kFontColor,
                          validatior: ((p0) {
                            if (p0 == null || p0.isEmpty) {
                              return "Date of birth is required.";
                            }
                            final parts = p0.split('/');
                            if (parts.length == 3) {
                              final formattedDate =
                                  "${parts[2]}-${parts[1]}-${parts[0]}";
                              final date = DateTime.tryParse(formattedDate);
                              if (date == null) {
                                return "Invalid date format.";
                              }
                              return Validator.validateDateOfBirth(date);
                            } else {
                              return "Invalid date format.";
                            }
                          }),
                          hint: state.userModel.dateOfBirth,
                          prefixIcon: const Icon(Icons.edit_calendar_rounded,
                              color: kPrimaryColor1),
                          isBirthDate: true,
                          controller: birthDateController,
                          onTap: (() async {
                            await selectDate(context, _dateController,
                                (selectedDate) {
                              dateOfBirth = selectedDate;
                              birthDateController.text = selectedDate;
                            });
                            onFieldChanged(dateOfBirth.toString());
                          }),
                          onchange: ((p0) {
                            onFieldChanged(p0);
                            dateOfBirth = p0;
                          }),
                          hintColor: kFontColor,
                          lineColor: kPrimaryColor1,
                        ),

                        SizedBox(height: widget.spaceWithRows),

                        SizedBox(height: screenWidth * 0.1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonWidget(
                              name: "Save",
                              fontSize: 20,
                              onTap: isChanged
                                  ? () {
                                      BlocProvider.of<ProfileBloc>(context).add(
                                          EditUserEvent(
                                              fName: fName ??
                                                  state.userModel.fName,
                                              lName: lName ??
                                                  state.userModel.lName,
                                              email: email ??
                                                  state.userModel.email,
                                              phoneNumber: phoneNumber ??
                                                  state.userModel.phoneNumber,
                                              dateOfBirth: dateOfBirth ??
                                                  state.userModel.dateOfBirth));

                                      setState(() {
                                        isChanged = false;
                                      });
                                    }
                                  : null,
                              size: const Size(100, 65),
                              isEnabled: isChanged,
                            ),
                            const SizedBox(width: 70),
                            ButtonWidget(
                              name: "Cancel",
                              fontSize: 20,
                              onTap: () {
                                BlocProvider.of<ProfileBloc>(context)
                                    .add(ShowUserInfoEvent());
                                Navigator.pop(context);
                              },
                              size: const Size(100, 65),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: widget.imagePositionTop,
                  left: 120,
                  child: const RoundImageWidget(
                    name: kDefaultUserImge,
                    width: 110,
                    height: 110,
                  ),
                ),
              ],
            ),
          );
        } else if (state is UserInfoErrorState) {
          return Center(child: Text('Something went wrong: ${state.error}'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
