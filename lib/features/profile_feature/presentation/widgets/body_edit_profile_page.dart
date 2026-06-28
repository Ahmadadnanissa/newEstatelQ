import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/features/profile_feature/presentation/providers/client_provider.dart';
import 'package:estatelqapp/features/profile_feature/presentation/widgets/custom_edit_text_field.dart';
import 'package:estatelqapp/features/profile_feature/presentation/widgets/custom_image_for_edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyEditProfilePage extends StatefulWidget {
  const BodyEditProfilePage({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.location,
  });

  final String name;
  final String email;
  final String phone;
  final String image;
  final String location;

  @override
  State<BodyEditProfilePage> createState() => _BodyEditProfilePageState();
}

class _BodyEditProfilePageState extends State<BodyEditProfilePage> {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController locationController;
  String? imagePath;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.name);
    phoneController = TextEditingController(text: widget.phone);
    locationController = TextEditingController(text: widget.location);

    imagePath = widget.image;
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    locationController.dispose();
    super.dispose();
  }

  // void _saveProfile() {
  //   final provider = context.read<ClientProvider>();

  //   provider.updateProfile(
  //     name: nameController.text.trim(),
  //     phone: phoneController.text.trim(),
  //     location: locationController.text.trim(),
  //     image: imagePath ?? widget.image,
  //     context: context,
  //   );
  // }

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

              /// Image
              CustomImageForEditProfile(image: widget.image),

              SizedBox(height: width * 0.08),

              /// Name
              CustomEditTextField(
                controller: nameController,
                title: 'Full Name',
                icon: Icon(Icons.person_outline, size: width * 0.08),
              ),

              SizedBox(height: width * 0.04),

              /// Email
              SizedBox(height: width * 0.04),

              /// Phone
              CustomEditTextField(
                controller: phoneController,
                title: 'Phone',
                icon: Icon(Icons.phone_outlined, size: width * 0.08),
              ),

              SizedBox(height: width * 0.04),

              /// Location
              CustomEditTextField(
                controller: locationController,
                title: 'Location',
                icon: Icon(Icons.location_on_outlined, size: width * 0.08),
              ),

              SizedBox(height: width * 0.08),

              /// Save Button
              PrimaryButton(
                name: 'Save',
                pushing: () async {
                  // _saveProfile();

                  // Navigator.pop(context);

                  final provider = context.read<ClientProvider>();

                  await provider.updateProfile(
                    name: nameController.text.trim(),
                    phone: phoneController.text.trim(),
                    location: locationController.text.trim(),
                    image: imagePath ?? widget.image,
                  );

                  if (!context.mounted) return;
                  await provider.getClient(context);
                  Navigator.pop(context);
                },
              ),

              SizedBox(height: width * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
