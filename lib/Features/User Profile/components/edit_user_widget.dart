import 'package:flutter/material.dart';
import 'package:nearme_app/Features/User%20Profile/screens/user_profile_screen.dart';
import '../../../core/constants.dart';
import '../../../core/data/models/userRadwa.dart';
import '../../Home/components/round_image_widget.dart';
import 'edit_text_field.dart';
import 'button_widget.dart';

class EditUserWidget extends StatefulWidget {
  final double spaceWithRows;
  final double? imagePositionTop;
  final double? paddingTopContainer;

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
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  bool isChanged = false;

  // Update the `isChanged` flag whenever a field changes
  void onFieldChanged(String value) {
    setState(() {
      isChanged = true;
    });
  }

  // Function to handle picking a date
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        birthDateController.text = picked.toString().split(' ')[0];
        isChanged = true;
      });
    }
  }

  User user = User();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none, // Allow the image to overflow
        children: [
          Padding(
            padding: EdgeInsets.only(top: widget.paddingTopContainer!),
            child: Container(
              width: 350,
              height: 640,
              decoration: BoxDecoration(
                color: kPrimaryColor1.withOpacity(.20),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  SizedBox(height: 60), // Leave space for the image overflow
                  Text(
                    'Edit Your Profile',
                    style: TextStyle(
                      color: kFontColor,
                      fontFamily: kFontBold,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),

                  // First Name Field
                  EditTextField(
                    hintText: user.firstName,
                    iconData: Icons.person_outlined,
                    controller: firstNameController,
                    onChanged: onFieldChanged,
                  ),
                  SizedBox(height: widget.spaceWithRows),

                  // Last Name Field
                  EditTextField(
                    hintText: user.lastName,
                    iconData: Icons.person_outlined,
                    controller: lastNameController,
                    onChanged: onFieldChanged,
                  ),
                  SizedBox(height: widget.spaceWithRows),

                  // Phone Number Field
                  EditTextField(
                    hintText: user.phoneNumber,
                    iconData: Icons.phone_outlined,
                    controller: phoneNumberController,
                    onChanged: onFieldChanged,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: widget.spaceWithRows),

                  // Email Field
                  EditTextField(
                    hintText: user.email,
                    iconData: Icons.email_outlined,
                    controller: emailController,
                    onChanged: onFieldChanged,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: widget.spaceWithRows),

                  // Birth Date Field
                  GestureDetector(
                    onTap: () => selectDate(context),
                    child: AbsorbPointer(
                      child: EditTextField(
                        hintText: user.birthDate,
                        iconData: Icons.calendar_month_outlined,
                        controller: birthDateController,
                        readOnly: true,
                      ),
                    ),
                  ),
                  SizedBox(height: widget.spaceWithRows),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonWidget(
                        name: "Save",
                        fontSize: 20,
                        onTap: isChanged
                            ? () {
                                // Handle save logic here
                                setState(() {
                                  isChanged = false;
                                });
                              }
                            : null,
                        size: Size(100, 65),
                        isEnabled: isChanged,
                      ),
                      SizedBox(width: 70),
                      ButtonWidget(
                        name: "Cancel",
                        fontSize: 20,
                        onTap: () {
                          Navigator.pop(context);
                        },
                        size: Size(100, 65),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: widget
                .imagePositionTop, // Moves the image outside the container
            left: 120, // Centers the image horizontally within the container
            child: RoundImageWidget(
              name: kDefaultUserImge,
              width: 110,
              height: 110,
            ),
          ),
        ],
      ),
    );
  }
}
