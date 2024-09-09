
import 'package:book_bus_togo/core/utils/screen_size.dart';
import 'package:book_bus_togo/core/utils/text_size.dart';
import 'package:book_bus_togo/presentation/views/dashboard/bottom_nav_bar_sreens/profile_screens/settings/historic_screen.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../themes/app_themes.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  bool isDarkModeEnabled = false;
  bool isNotificationEnabled = false;
  late final AnimationController _controller;
  late final Animation<double> _rotationAnimation;
  // ignore: unused_field
  final bool _isRotated = false;
 final String imageUrl = 'assets/pp.jpg';
  final ImagePicker _picker = ImagePicker();
  // ignore: unused_field
  XFile? _image;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
    });
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String fullName = 'HACKERMAN Livai';
  String phoneNumber = '+228 90 00 00 00';

  Future<void> _editProfile() async {
    _nameController.text = fullName;
    _phoneController.text = phoneNumber;
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Modifier profil',
            style: AppTheme().stylish1(16, AppTheme.black, isBold: true),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nom complet',
                  labelStyle: AppTheme().stylish1(15, AppTheme.black),
                ),
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                    labelText: 'Numéro de téléphone',
                    labelStyle: AppTheme().stylish1(15, AppTheme.black)),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child:
                  Text('Annuler', style: AppTheme().stylish1(15, Colors.red)),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  fullName = _nameController.text;
                  phoneNumber = _phoneController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('Sauvegarder',
                  style: AppTheme().stylish1(15, AppTheme.primaryColor)),
            ),
          ],
        );
      },
    );
  }

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
          backgroundImage: NetworkImage(imageUrl),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {},
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
            SizedBox(height: context.heightPercent(10)),

////////////////////////////  Container du solde ////////////////////////
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: context.heightPercent(2),
                  horizontal: context.heightPercent(2)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppTheme.primaryColor),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Solde",
                          style: AppTheme().stylish2(context.p2, AppTheme.white,
                              isBold: true),
                        ),
                       Text(
                          "10 0000",
                          style: AppTheme().stylish2(context.p2, AppTheme.white,
                              isBold: true),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                       
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
            ),
 SizedBox(height: context.heightPercent(10)),


////////////////////// Les paramètres et fonctionnalités ///////////////////////////////////////
            Container(
              // height: context.heightPercent(43),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(context.heightPercent(2)),
                child: Column(
                  children: [
                     ListTile(
                      leading: const HeroIcon(HeroIcons.language),
                      title: Text('Historique',
                          style:
                              AppTheme().stylish1(context.p1, AppTheme.black)),
                      onTap: () {
                          Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HistoricScreen()),
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
