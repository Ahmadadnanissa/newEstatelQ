import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/features/profile_feature/presentation/widgets/custom_edit_text_field.dart';
import 'package:estatelqapp/features/profile_feature/presentation/widgets/custom_image_for_edit_profile.dart';
import 'package:flutter/material.dart';

class BodyEditProfilePage extends StatefulWidget {
  const BodyEditProfilePage({super.key});

  @override
  State<BodyEditProfilePage> createState() => _BodyEditProfilePageState();
}

class _BodyEditProfilePageState extends State<BodyEditProfilePage> {
  late TextEditingController nameController;
  late TextEditingController emilController;
  late TextEditingController phoneController;
  late TextEditingController locationController;
  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: "Ahmad Issa");
    emilController = TextEditingController(text: "AhmadIssa@gmail.com");
    phoneController = TextEditingController(text: "0984763728");
    locationController = TextEditingController(text: "Homs,Alnha");
  }

  @override
  void dispose() {
    nameController.dispose();
    emilController.dispose();
    phoneController.dispose();
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: width * 0.08),
              CustomImageForEditProfile(),
              SizedBox(height: width * 0.08),
              CustomEditTextField(
                controller: nameController,
                title: 'Full Name',
                icon: Icon(Icons.person_outline, size: width * 0.08),
              ),
              SizedBox(height: width * 0.04),
              CustomEditTextField(
                controller: emilController,
                title: 'Email',
                icon: Icon(Icons.email_outlined, size: width * 0.08),
              ),
              SizedBox(height: width * 0.04),
              CustomEditTextField(
                controller: phoneController,
                title: 'Phone',
                icon: Icon(Icons.phone_outlined, size: width * 0.08),
              ),
              SizedBox(height: width * 0.04),
              CustomEditTextField(
                controller: locationController,
                title: 'Location',
                icon: Icon(Icons.location_on_outlined, size: width * 0.08),
              ),
              SizedBox(height: width * 0.08),

              PrimaryButton(name: 'Save', pushing: () {}),
              SizedBox(height: width * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
