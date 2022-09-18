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


}

class SeatStatus {
  static const String available = "Available";
  static  const String reserved = "Reserved";
  static const String selected = "Selected";

}


class Utils{
static bool isMobileLayout(smallestDimension) {
  final useMobileLayout = smallestDimension < 600;
  return useMobileLayout;
}
}