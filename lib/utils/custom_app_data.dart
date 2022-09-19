import 'package:flutter/cupertino.dart';
import 'package:simili_shetty_l1_17092022/utils/app_colors.dart';

class AppData {
  static Map<String, dynamic> seatData = {
    "vip_seats": {
      "total_count": 2,
      "items": [
        {
          "row": "A",
          "total": 6,
          "status": [
            "Reserved",
            "Reserved",
            "Available",
            "Reserved",
            "Reserved",
            "Available"
          ]
        },
        {
          "row": "B",
          "total": 8,
          "status": [
            "Reserved",
            "Reserved",
            "Available",
            "Available",
            "Reserved",
            "Reserved",
            "Reserved",
            "Reserved"
          ]
        }
      ]
    },
    "non_vip_seats": {
      "total_count": 4,
      "items": [
        {
          "row": "C",
          "total": 8,
          "status": [
            "Reserved",
            "Reserved",
            "Reserved",
            "Available",
            "Available",
            "Reserved",
            "Reserved",
            "Reserved"
          ]
        },
        {
          "row": "D",
          "total": 9,
          "status": [
            "Available",
            "Available",
            "Reserved",
            "Reserved",
            "Reserved",
            "Reserved",
            "Reserved",
            "Available",
            "Available",
          ]
        },
        {
          "row": "E",
          "total": 9,
          "status": [
            "Reserved",
            "Reserved",
            "Reserved",
            "Available",
            "Available",
            "Available",
            "Reserved",
            "Reserved",
            "Reserved",
          ]
        },
        {
          "row": "F",
          "total": 9,
          "status": [
            "Available",
            "Available",
            "Reserved",
            "Reserved",
            "Reserved",
            "Available",
            "Available",
            "Reserved",
            "Reserved",
          ]
        }
      ]
    }
  };

  static List<String> nowPlaying = [
    "assets/images/movie1.png",
    "assets/images/movie2.png",
    "assets/images/movie3.png",
    "assets/images/movie4.png",
    "assets/images/movie5.png"
  ];
  static List<String> comingSoon = [
    "assets/images/movie6.png",
    "assets/images/movie7.png",
    "assets/images/movie8.png",
        "assets/images/movie9.png",
        "assets/images/movie1.png"
  ];
  static List<String> topMovies = [
    "assets/images/movie2.png",
    "assets/images/movie6.png",
    "assets/images/movie5.png",
        "assets/images/movie9.png",
        "assets/images/movie3.png"
  ];

  static Map<String, dynamic> ticketDetails = {
    "ticket_details": [
      {
        "movie_path": "assets/images/movie_image_details1.png",
        "date": "April 23",
        "time": "6 p.m.",
        "row": "2",
        "seats": "1, 2"
      },
      {
        "movie_path": "assets/images/movie_image_details2.png",
        "date": "June 19",
        "time": "8 p.m.",
        "row": "1",
        "seats": "1, 2"
      },
      {
        "movie_path": "assets/images/movie_image_details3.png",
        "date": "October 8",
        "time": "7 p.m.",
        "row": "2",
        "seats": "9, 10"
      }
      ]
  };


}

class SeatStatus {
  static const String available = "Available";
  static const String reserved = "Reserved";
  static const String selected = "Selected";
}

class Utils {
  static bool isMobileLayout(smallestDimension) {
    final useMobileLayout = smallestDimension < 600;
    return useMobileLayout;
  }
  static Widget appBarButtonBg(IconData iconData,double iconSize){
    return Container(
        width: 45,
        height: 40,
        decoration: const BoxDecoration(
          color: AppColors.iconBgColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.gradientColor,
              blurRadius: 1.0,
              spreadRadius: 1,
              offset: Offset(
                -2, //left
                -2, // upward
              ),
            )
          ],
        ),
        child:  Icon(iconData,size: iconSize));
  }
}
