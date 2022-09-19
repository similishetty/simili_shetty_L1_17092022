

import 'dart:convert';

TicketDetails ticketDetailsFromJson(String str) => TicketDetails.fromJson(json.decode(str));


class TicketDetails {
  TicketDetails({
    required this.ticketDetails,
  });

  List<TicketDetail> ticketDetails;

  factory TicketDetails.fromJson(Map<String, dynamic> json) => TicketDetails(
    ticketDetails: List<TicketDetail>.from(json["ticket_details"].map((x) => TicketDetail.fromJson(x))),
  );

}

class TicketDetail {
  TicketDetail({
    required this.moviePath,
    required this.date,
    required this.time,
    required this.row,
    required this.seats,
  });

  String moviePath;
  String date;
  String time;
  String row;
  String seats;

  factory TicketDetail.fromJson(Map<String, dynamic> json) => TicketDetail(
    moviePath: json["movie_path"],
    date: json["date"],
    time: json["time"],
    row: json["row"],
    seats: json["seats"],
  );


}
