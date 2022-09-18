import 'package:flutter/material.dart';
import 'package:simili_shetty_l1_17092022/model/seat_selection.dart';
import 'package:simili_shetty_l1_17092022/screens/ticket_details_screen.dart';
import 'package:simili_shetty_l1_17092022/utils/app_colors.dart';
import 'package:simili_shetty_l1_17092022/utils/custom_app_data.dart';

class SeatSelectionScreen extends StatefulWidget {
  const SeatSelectionScreen({Key? key}) : super(key: key);

  @override
  _SeatSelectionScreenState createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  late SeatSelection seatSelection;
  late bool isMobileLayout;
  late List<Map<String, String>> selectedSeats = [];
  int totalAmount = 0;
  int vipPrice = 15;
  int normalPrice = 10;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    seatSelection = SeatSelection.fromJson(AppData.seatData);
  }

  @override
  Widget build(BuildContext context) {
    isMobileLayout = Utils.isMobileLayout(MediaQuery.of(context).size.shortestSide);
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Choose Seats",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        elevation: 0.0,
      ),
      bottomSheet: selectedSeats.isNotEmpty?ticketSummary():const SizedBox(width: 0,height: 0,),
      body: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30, top: 50),
              child: Image.asset(
                "assets/images/movie_seat_line.png",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            vipSections(),
            const SizedBox(
              height: 30,
            ),
            nonVipSections(),
            const SizedBox(
              height: 20,
            ),
            statusDescription()
          ]),
    );
  }

  Widget vipSections() {
    return Column(
      children: List.generate(
          seatSelection.vipSeats.totalCount,
          (index) => Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            seatSelection.vipSeats.items[index].total ~/ 2,
                            (item) => buildSeats(
                                status: seatSelection
                                    .vipSeats.items[index].status[item],
                                seat: (item + 1).toString(),
                                isSelected: seatSelection
                                    .vipSeats.items[index].isSelected[item],
                                onTap: () {
                                  onItemSelectedVip(
                                      rowIndex: index, seatIndex: item);
                                })),
                      ),
                      Row(children: [
                        for (int i =
                                (seatSelection.vipSeats.items[index].total ~/
                                    2);
                            i < seatSelection.vipSeats.items[index].total;
                            i++)
                          buildSeats(
                              status:
                                  seatSelection.vipSeats.items[index].status[i],
                              seat: (i + 1).toString(),
                              isSelected: seatSelection
                                  .vipSeats.items[index].isSelected[i],
                              onTap: () {
                                onItemSelectedVip(
                                    rowIndex: index, seatIndex: i);
                              })
                      ])
                    ]),
              )),
    );
  }

  Widget nonVipSections() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
          seatSelection.nonVipSeats.totalCount,
          (index) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  seatSelection.nonVipSeats.items[index].total,
                  (item) => buildSeats(
                      status:
                          seatSelection.nonVipSeats.items[index].status[item],
                      seat: (item + 1).toString(),
                      isSelected: seatSelection
                          .nonVipSeats.items[index].isSelected[item],
                      onTap: () {
                        onItemSelectedNonVip(rowIndex: index, seatIndex: item);
                      })))),
    );
  }

  Color getStatusColor(String status) {
    if (status == SeatStatus.available) {
      return AppColors.white;
    } else if (status == SeatStatus.reserved) {
      return AppColors.reservationDarkGradient;
    }
    return AppColors.white;
  }

  Widget buildSeats(
      {required String status,
      required String seat,
      required bool isSelected,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Container(
          color: isSelected ? AppColors.gradientColor : getStatusColor(status),
          alignment: Alignment.center,
          width: isMobileLayout ? 35 : 75,
          height: isMobileLayout ? 35 : 75,
          child: Text(seat),
        ),
      ),
    );
  }

  Widget statusDescription() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        getStatus(SeatStatus.available, AppColors.white),
        getStatus(SeatStatus.reserved, AppColors.reservationDarkGradient),
        getStatus(SeatStatus.selected, AppColors.gradientColor),
      ],
    );
  }

  Widget getStatus(String status, Color statusColor) {
    return Row(
      children: [
        Icon(
          Icons.circle,
          color: statusColor,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          status,
          style: const TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w400,
              fontSize: 15),
        )
      ],
    );
  }

  void onItemSelectedVip({required int seatIndex, required int rowIndex}) {
    setState(() {
      if (seatSelection.vipSeats.items[rowIndex].status[seatIndex] ==
          SeatStatus.available) {
        seatSelection.vipSeats.items[rowIndex].isSelected[seatIndex] =
            !seatSelection.vipSeats.items[rowIndex].isSelected[seatIndex];
        if (seatSelection.vipSeats.items[rowIndex].isSelected[seatIndex]) {
          selectedSeats.add({
            seatSelection.vipSeats.items[rowIndex].row:
                (seatIndex + 1).toString()
          });
          totalAmount = totalAmount+vipPrice;
        } else {
          selectedSeats.removeWhere((element) => (element.keys.first ==
                  seatSelection.vipSeats.items[rowIndex].row &&
              element.values.first == (seatIndex + 1).toString()));
          totalAmount = totalAmount-vipPrice;
        }
      }

    });


  }

  void onItemSelectedNonVip({required int seatIndex, required int rowIndex}) {
    setState(() {
      if (seatSelection.nonVipSeats.items[rowIndex].status[seatIndex] ==
          SeatStatus.available) {
        seatSelection.nonVipSeats.items[rowIndex].isSelected[seatIndex] =
            !seatSelection.nonVipSeats.items[rowIndex].isSelected[seatIndex];
        if (seatSelection.nonVipSeats.items[rowIndex].isSelected[seatIndex]) {
          selectedSeats.add({
            seatSelection.nonVipSeats.items[rowIndex].row:
                (seatIndex + 1).toString()
          });
          totalAmount = totalAmount+normalPrice;
        } else {
          selectedSeats.removeWhere((element) => (element.keys.first ==
                  seatSelection.nonVipSeats.items[rowIndex].row &&
              element.values.first == (seatIndex + 1).toString()));
          totalAmount = totalAmount-normalPrice;
        }
      }
    });
  }

  Widget ticketSummary() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          AppColors.dateTimeCardColor,
          AppColors.reservationLightGradient
        ])
      ),
      child : Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(Icons.calendar_today_rounded,color: AppColors.white,size: 20,),
                          Text("April 23, 2020",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: AppColors.white),),
                          Icon(Icons.circle,color: AppColors.white,size: 10,),
                          Text("6 PM",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: AppColors.white),),

                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(Icons.event_seat,color: AppColors.white,size: 20,),
                          Text("April 23, 2020",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: AppColors.white),),
                          Icon(Icons.circle,color: AppColors.white,size: 10,),
                          Text("6 PM",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: AppColors.white),),

                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(Icons.add_shopping_cart_outlined,color: AppColors.white,size: 20,),
                          Text("April 23, 2020",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: AppColors.white),),
                          Icon(Icons.circle,color: AppColors.white,size: 10,),
                          Text("6 PM",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: AppColors.white),),
                        ],
                      )
                  ],),
                ),
              ),
               Expanded(child: ElevatedButton(
                child: const Text("Buy",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: AppColors.white),),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                  shadowColor: AppColors.gradientColor,
                  primary: AppColors.buyColor, // <-- Button color
                  onPrimary: Colors.red, // <-- Splash color
                ), onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const TicketDetailsScreen()));
               },
              ))
            ],
          ),
          const SizedBox(height: 50,)
        ],
      )
    );
  }
}
