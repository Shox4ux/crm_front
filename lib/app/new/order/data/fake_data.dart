import 'package:crm_app/app/new/common/ui/app_colour.dart';
import 'package:flutter/material.dart';

enum OrderStatus {
  completed(color: AppColour.completedDark),
  processing(color: AppColour.inprocessDark),
  rejected(color: AppColour.rejectedDark),
  onhold(color: AppColour.onholdDark),
  intransit(color: AppColour.intransitDark);

  final Color color;
  const OrderStatus({required this.color});
}

class OrderData {
  final int id;
  final String clientName;
  final String clientAddress;
  final String date;
  final String type;
  final OrderStatus status;
  OrderData({
    required this.id,
    required this.clientName,
    required this.clientAddress,
    required this.date,
    required this.type,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'clientName': clientName,
      'clientAddress': clientAddress,
      'date': date,
      'type': type,
      'status': status.name,
    };
  }
}

final List<OrderData> orderList = [
  OrderData(
    id: 1,
    clientName: "Shodiev Asadbek",
    clientAddress: "Yunusobod, Tashkent",
    date: "2025-01-12",
    type: "Delivery",
    status: OrderStatus.onhold,
  ),
  OrderData(
    id: 2,
    clientName: "Karimova Dilnoza",
    clientAddress: "Chilonzor, Tashkent",
    date: "2025-01-13",
    type: "Pickup",
    status: OrderStatus.processing,
  ),
  OrderData(
    id: 3,
    clientName: "Umarov Sardor",
    clientAddress: "Sergeli, Tashkent",
    date: "2025-02-01",
    type: "Delivery",
    status: OrderStatus.completed,
  ),
  OrderData(
    id: 4,
    clientName: "Abdullayev Mirjalol",
    clientAddress: "Samarkand City",
    date: "2025-02-03",
    type: "Delivery",
    status: OrderStatus.rejected,
  ),
  OrderData(
    id: 5,
    clientName: "Nazarova Maftuna",
    clientAddress: "Olmazor, Tashkent",
    date: "2025-02-05",
    type: "Pickup",
    status: OrderStatus.processing,
  ),
  OrderData(
    id: 6,
    clientName: "Mansurov Behruz",
    clientAddress: "Bukhara City",
    date: "2025-02-10",
    type: "Delivery",
    status: OrderStatus.onhold,
  ),
  OrderData(
    id: 7,
    clientName: "Matkarimov Javohir",
    clientAddress: "Nukus, Karakalpakstan",
    date: "2025-02-12",
    type: "Pickup",
    status: OrderStatus.completed,
  ),
  OrderData(
    id: 8,
    clientName: "Rasulov Komil",
    clientAddress: "Namangan City",
    date: "2025-02-14",
    type: "Delivery",
    status: OrderStatus.processing,
  ),
  OrderData(
    id: 9,
    clientName: "Yusupova Zilola",
    clientAddress: "Andijan City",
    date: "2025-02-18",
    type: "Pickup",
    status: OrderStatus.onhold,
  ),
  OrderData(
    id: 10,
    clientName: "Shamshiyev Murod",
    clientAddress: "Fergana City",
    date: "2025-02-20",
    type: "Delivery",
    status: OrderStatus.completed,
  ),
  OrderData(
    id: 11,
    clientName: "Boltaboev Aziz",
    clientAddress: "Urganch City",
    date: "2025-02-22",
    type: "Pickup",
    status: OrderStatus.processing,
  ),
  OrderData(
    id: 12,
    clientName: "Qodirova Madina",
    clientAddress: "Qoqon City",
    date: "2025-02-23",
    type: "Delivery",
    status: OrderStatus.onhold,
  ),
];
