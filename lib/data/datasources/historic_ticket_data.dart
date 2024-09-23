import 'package:book_bus_togo/domain/entities/transport_company.dart';

final List<Map<String, dynamic>> reservedTickets = [
  {
    'company': TransportCompany(
      logoPath: 'assets/logonagode.jpg',
      name: 'NAGODE TRANSFERT',
    ),
    'reservationDate': DateTime.now().subtract(const Duration(days: 2)),
  },
  {
    'company': TransportCompany(
      logoPath: 'assets/solimlogo.png',
      name: 'SOLIM SEROU TRANSPORT',
    ),
    'reservationDate': DateTime.now().subtract(const Duration(days: 5)),
  },
];

final List<Map<String, dynamic>> usedTickets = [
  {
    'company': TransportCompany(
      logoPath: 'assets/logonagode.jpg',
      name: 'NAGODE TRANSFERT',
    ),
    'reservationDate': DateTime.now().subtract(const Duration(days: 10)),
  },
  {
    'company': TransportCompany(
      logoPath: 'assets/solimlogo.png',
      name: 'SOLIM SEROU TRANSPORT',
    ),
    'reservationDate': DateTime.now().subtract(const Duration(days: 15)),
  },
  {
    'company': TransportCompany(
      logoPath: 'assets/solimlogo.png',
      name: 'SOLIM SEROU TRANSPORT',
    ),
    'reservationDate': DateTime.now().subtract(const Duration(days: 15)),
  },
  {
    'company': TransportCompany(
      logoPath: 'assets/solimlogo.png',
      name: 'SOLIM SEROU TRANSPORT',
    ),
    'reservationDate': DateTime.now().subtract(const Duration(days: 15)),
  },
];
