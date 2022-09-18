

import 'dart:convert';

SeatSelection seatSelectionFromJson(String str) => SeatSelection.fromJson(json.decode(str));

class SeatSelection {
  SeatSelection({
    required this.vipSeats,
    required this.nonVipSeats,
  });

  VipSeats vipSeats;
  VipSeats nonVipSeats;

  factory SeatSelection.fromJson(Map<String, dynamic> json) => SeatSelection(
    vipSeats: VipSeats.fromJson(json["vip_seats"]),
    nonVipSeats: VipSeats.fromJson(json["non_vip_seats"]),
  );


}

class VipSeats {
  VipSeats({
    required this.totalCount,
    required this.items,
  });

  int totalCount;
  List<Item> items;

  factory VipSeats.fromJson(Map<String, dynamic> json) => VipSeats(
    totalCount: json["total_count"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );


}

class Item {
  Item({
    required this.row,
    required this.total,
    required this.status,
    required this.isSelected
  });

  String row;
  int total;
  List<String> status;
  List<bool> isSelected;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    row: json["row"],
    total: json["total"],
    status: List<String>.from(json["status"].map((x) => x)),
    isSelected : List.generate(json["total"], (index) => false),
  );

}



