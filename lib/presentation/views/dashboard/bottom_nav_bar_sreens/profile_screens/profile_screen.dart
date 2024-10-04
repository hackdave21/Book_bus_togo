import 'dart:io';
import 'package:book_bus_togo/core/utils/screen_size.dart';
import 'package:book_bus_togo/core/utils/text_size.dart';
import 'package:book_bus_togo/presentation/views/dashboard/bottom_nav_bar_sreens/profile_screens/settings/historic_screen.dart';
import 'package:book_bus_togo/presentation/views/dashboard/shimmers/shimmers_loading.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import '../../../../../themes/app_themes.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  bool isDarkModeEnabled = false;
  bool isNotificationEnabled = false;
  bool isRefreshing = false;
  late final AnimationController _controller;
  late final Animation<double> _rotationAnimation;
  // ignore: unused_field
  final bool _isRotated = false;
  final String imageUrl = 'assets/pp.jpg';
  String balance = '10 000 XOF';
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(begin: 0, end: 2 * 3.141592653589793)
        .animate(_controller);
  }

  Future<void> _refreshBalance() async {
    setState(() {
      isRefreshing = true;
    });

    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      balance = '20 000 XOF';
      isRefreshing = false;
    });
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
    }
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choisir dans la galerie'),
              onTap: () {
                _selectImageFromGallery();
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera),
              title: const Text('Prendre une photo'),
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
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: context.heightPercent(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppTheme.primaryColor,
                  ),
                ),
                Positioned(
                  bottom: -context.heightPercent(5),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: _selectedImage != null
                            ? FileImage(_selectedImage!)
                            : const AssetImage('assets/pp.jpg')
                                as ImageProvider,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: _showImagePickerOptions,
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
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: context.heightPercent(10)),

////////////////////////////  Container du solde ////////////////////////
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: context.heightPercent(2),
                  horizontal: context.heightPercent(2)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppTheme.primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Solde",
                        style: AppTheme()
                            .stylish2(context.p2, AppTheme.white, isBold: true),
                      ),
                      isRefreshing
                          ? const ShimmerWidget(
                              width: 100,
                              height: 20,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            )
                          : Text(
                              balance,
                              style: AppTheme().stylish2(
                                  context.p2, AppTheme.white,
                                  isBold: true),
                            ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      _controller.forward(from: 0);
                      _refreshBalance();
                    },
                    icon: AnimatedBuilder(
                      animation: _rotationAnimation,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _rotationAnimation.value,
                          child: const HeroIcon(
                            HeroIcons.arrowPath,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
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
