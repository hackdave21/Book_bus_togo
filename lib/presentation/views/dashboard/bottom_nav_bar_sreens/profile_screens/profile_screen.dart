import 'dart:io';
import 'package:book_bus_togo/core/utils/screen_size.dart';
import 'package:book_bus_togo/core/utils/text_size.dart';
import 'package:book_bus_togo/domain/useCases/profile_image_usecase.dart';
import 'package:book_bus_togo/presentation/views/dashboard/bottom_nav_bar_sreens/profile_screens/settings/historic_screen.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../themes/app_themes.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    with SingleTickerProviderStateMixin {
  bool isDarkModeEnabled = false;
  bool isNotificationEnabled = false;

  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    _loadProfileImage();
  }

  Future<void> _loadProfileImage() async {
    final getProfileImageUseCase = ref.read(getProfileImageUseCaseProvider);
    String? imagePath = await getProfileImageUseCase.execute();
    if (imagePath != null) {
      setState(() {
        _selectedImage = File(imagePath);
      });
    }
  }

  Future<void> _selectImageFromGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _cropImage(pickedFile.path);
    }
  }

  Future<void> _takePhoto() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _cropImage(pickedFile.path);
    }
  }

  Future<void> _cropImage(String imagePath) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imagePath,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Recadrer la photo',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          minimumAspectRatio: 1.0,
        ),
      ],
    );

    if (croppedFile != null) {
      setState(() {
        _selectedImage = File(croppedFile.path);
      });
      // Save the image using Riverpod
      final saveProfileImageUseCase = ref.read(saveProfileImageUseCaseProvider);
      await saveProfileImageUseCase.execute(croppedFile.path);
    }
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(
                Icons.photo_library,
                color: AppTheme.primaryColor,
              ),
              title: Text(
                'Choisir dans la galerie',
                style: AppTheme()
                    .stylish1(15, AppTheme.primaryColor, isBold: true),
              ),
              onTap: () {
                _selectImageFromGallery();
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.photo_camera,
                color: AppTheme.primaryColor,
              ),
              title: Text(
                'Prendre une photo',
                style: AppTheme()
                    .stylish1(15, AppTheme.primaryColor, isBold: true),
              ),
              onTap: () {
                _takePhoto();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Padding(
        padding: EdgeInsets.all(context.heightPercent(2)),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            SizedBox(height: context.heightPercent(5)),

            ////////////////////////////  Photo de profil ////////////////////////
            Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: _selectedImage != null
                      ? FileImage(_selectedImage!)
                      : const AssetImage('assets/pp.jpg') as ImageProvider,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: _showImagePickerOptions,
                    child: Container(
                      color:
                          Colors.transparent, // Rendre le conteneur cliquable
                      child: const CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.camera_alt,
                          size: 20,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: context.heightPercent(10)),

            ////////////////////// Les paramètres et fonctionnalités ///////////////////////////////////////
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(context.heightPercent(2)),
                child: Column(
                  children: [
                    ListTile(
                      iconColor: AppTheme.primaryColor,
                      leading: const HeroIcon(HeroIcons.listBullet),
                      title: Text('Historique',
                          style:
                              AppTheme().stylish1(context.p1, AppTheme.black)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const TicketHistoryScreen()),
                        );
                      },
                    ),
                    Container(
                      width: double.infinity,
                      height: context.heightPercent(0.2),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    ListTile(
                      iconColor: AppTheme.primaryColor,
                      leading: HeroIcon(isNotificationEnabled
                          ? HeroIcons.bellAlert
                          : HeroIcons.bellSlash),
                      title: Text('Notifications',
                          style:
                              AppTheme().stylish1(context.p1, AppTheme.black)),
                      trailing: Switch(
                        value: isNotificationEnabled,
                        onChanged: _toggleNotifications,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: context.heightPercent(0.2),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    ListTile(
                      iconColor: AppTheme.primaryColor,
                      leading: const HeroIcon(HeroIcons.language),
                      title: Text('Langue',
                          style:
                              AppTheme().stylish1(context.p1, AppTheme.black)),
                      onTap: () {},
                    ),
                    Container(
                      width: double.infinity,
                      height: context.heightPercent(0.2),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    ListTile(
                      iconColor: AppTheme.primaryColor,
                      leading: const HeroIcon(HeroIcons.shieldCheck),
                      title: Text('Politique de confidentialité',
                          style:
                              AppTheme().stylish1(context.p1, AppTheme.black)),
                      onTap: () {},
                    ),
                    Container(
                      width: double.infinity,
                      height: context.heightPercent(0.2),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    ListTile(
                      iconColor: AppTheme.primaryColor,
                      leading: HeroIcon(
                          isDarkModeEnabled ? HeroIcons.moon : HeroIcons.sun),
                      title: Text('Mode sombre',
                          style:
                              AppTheme().stylish1(context.p1, AppTheme.black)),
                      trailing: Switch(
                        value: isDarkModeEnabled,
                        onChanged: _toggleDarkMode,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  void _toggleDarkMode(bool value) {
    setState(() {
      isDarkModeEnabled = value;
    });
  }

  void _toggleNotifications(bool value) {
    setState(() {
      isNotificationEnabled = value;
    });
  }
}
