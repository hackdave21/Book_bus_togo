import 'package:book_bus_togo/core/utils/screen_size.dart';
import 'package:book_bus_togo/domain/entities/transport_company.dart';
import 'package:book_bus_togo/presentation/views/dashboard/bottom_nav_bar_sreens/ticket_screens/widgets/custom_button_step.dart';
import 'package:book_bus_togo/presentation/views/dashboard/bottom_nav_bar_sreens/ticket_screens/widgets/payment_form.dart';
import 'package:book_bus_togo/presentation/views/dashboard/bottom_nav_bar_sreens/ticket_screens/widgets/personal_infos_form.dart';
import 'package:book_bus_togo/presentation/views/dashboard/bottom_nav_bar_sreens/ticket_screens/widgets/travel_details_form.dart';
import 'package:book_bus_togo/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';


class ReservationScreen extends StatefulWidget {
  final TransportCompany transportCompany;
  const ReservationScreen({super.key, required this.transportCompany});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  int _currentStep = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const HeroIcon(HeroIcons.arrowLeftCircle, color: AppTheme.white,),
        ),
        backgroundColor: AppTheme.primaryColor,
        title: Text(widget.transportCompany.name, style: AppTheme().stylish1(18, AppTheme.white, isBold: true)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStepContainer("1. Infos\nPersonnelles", _currentStep == 1, 1),
                _buildStepContainer("2. Détails du\nVoyage", _currentStep == 2, 2),
                _buildStepContainer("3. Paiement", _currentStep == 3, 3),
              ],
            ),
            SizedBox(height: context.heightPercent(1)),
            Expanded(
              child: _buildForm(),
            ),
            SizedBox(height: context.heightPercent(1)),
            NavigationButtons(
              showNext: _currentStep < 3,
              showPrev: _currentStep > 1,
              onNext: () {
                setState(() {
                  if (_currentStep < 3) _currentStep++;
                });
              },
              onPrev: () {
                setState(() {
                  if (_currentStep > 1) _currentStep--;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepContainer(String title, bool isActive, int step) {
    return InkWell(
      onTap: () {
        setState(() {
          _currentStep = step;
        });
      },
      child: Container(
        width: context.widthPercent(30),
        height: context.heightPercent(10),
        decoration: BoxDecoration(
          color: isActive ? AppTheme.primaryColor : Colors.grey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: AppTheme().stylish1(15, AppTheme.white, isBold: true),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    switch (_currentStep) {
      case 1:
        return PersonalInfoForm();
      case 2:
        return const TravelDetailsForm();
      case 3:
        return const PaymentForm();
      default:
        return PersonalInfoForm();
    }
  }
}
