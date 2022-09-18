import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:simili_shetty_l1_17092022/screens/seat_selection_screen.dart';
import 'package:simili_shetty_l1_17092022/utils/app_colors.dart';


class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({Key? key}) : super(key: key);

  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late DateTime lastDayOfMonth;
  int currentDateIndex = 0;
  int currentTimeIndex = 0;

  PageController dateViewController =
      PageController(initialPage: 0,);
  PageController timeViewController =
      PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    lastDayOfMonth = DateTime(now.year, now.month, 0);
    dateViewController =
        PageController(initialPage: now.day - 1, viewportFraction: 0.25);
    timeViewController = PageController(initialPage: 5, viewportFraction: 0.25);
    currentDateIndex = now.day - 1;
    currentTimeIndex = 5;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Image.asset(
                  "assets/images/doctor_strange.png",
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                flex:2,
                  child: Container(
                color: AppColors.primary,
              ))
            ],
          ),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment : MainAxisAlignment.end,
                    children: [
                      ShowUpList(
                          direction: Direction.horizontal,
                          delayBetween: const Duration(milliseconds: 400),
                          children: const [
                        Text("Doctor Strange",style: TextStyle(fontSize: 20,color: AppColors.white,fontWeight: FontWeight.w700),),
                        Padding(
                          padding: EdgeInsets.only(top:8.0),
                          child: Text("in the Multiverse of Madness",style: TextStyle(fontSize: 17,color: AppColors.white,fontWeight: FontWeight.w400),),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                              "Dr. Stephen Strange casts a forbidden spell that opens the doorway to the multiverse, including alternate versions of himself, whose threat to humanity is too great for the combined forces of Strange, Wong, and Wanda Maximoff.",
                            style: TextStyle(fontSize: 15,color: AppColors.white,fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                        ),

                      ]),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    //mainAxisAlignment : MainAxisAlignment.center,
                    children: [
                      const Text("Select date and time",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17,color: AppColors.white,fontWeight: FontWeight.w500),),
                      const SizedBox(
                        height: 15,
                      ),
                      selectDateWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                      selectTimeWidget(),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 350,
                          height: 60,
                          decoration:
                           BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                              gradient:  const LinearGradient(colors: [AppColors.reservationLightGradient, AppColors.reservationDarkGradient])),

                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> const SeatSelectionScreen()));
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(17.0),
                                child: Text("Reservation",
                          style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17,color: AppColors.white),),
                              )),
                        ),
                      )
                    ],
                  ),
                )

              ],
            )

            )
      ],
    );
  }

  Widget selectDateWidget() {
    return SizedBox(
      height: 120,
      child: PageView.builder(
          controller: dateViewController,
          itemCount: lastDayOfMonth.day,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          onPageChanged: (index) {
            setState(() {
              currentDateIndex = index;
            });
          },
          itemBuilder: (context, index) {
            var _scale = currentDateIndex == index ? 0.9 : 0.6;
            return Transform.scale (
              scale: _scale,
              child: Padding(
                padding: const EdgeInsets.only(top:5),
                child: Container(
                  decoration: currentDateIndex==index?
                  BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.reservationLightGradient,
                      AppColors.reservationDarkGradient
                    ]
                  ),
                    borderRadius: BorderRadius.circular(10.0),)
                      :BoxDecoration(
                    color: AppColors.dateTimeCardColor,
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.gradientColor,
                      blurRadius: 1.0,
                      spreadRadius: 1,
                      offset: Offset(
                        -2, //left
                        -3, // upward
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10.0),),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      () {
                        final currentDate =
                            lastDayOfMonth.add(Duration(days: index + 1));

                        final dateName = DateFormat('E').format(currentDate);
                        return Text(dateName,style:const TextStyle(fontSize: 15,color: AppColors.white,fontWeight:FontWeight.w400),);
                      }(),
                      const SizedBox(height: 3,),
                      Text(
                        "${index + 1}",
                        style: const TextStyle(fontSize: 15,color: AppColors.white,fontWeight:FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget selectTimeWidget() {
    return SizedBox(
      height: 70,
      child: PageView.builder(
          controller: timeViewController,
          itemCount: 24,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          onPageChanged: (index) {
            setState(() {
              currentTimeIndex = index;
            });
          },
          itemBuilder: (context, index) {
            var _scale = currentTimeIndex == index ? 0.9 : 0.7;
            return Transform.scale(
              scale: _scale,
              child: Padding(
                padding: const EdgeInsets.only(top:5),
                child: Container(
                  alignment: Alignment.center,
                  height: 20,
                  decoration: currentTimeIndex==index? BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [
                          AppColors.reservationLightGradient,
                          AppColors.reservationDarkGradient
                        ]
                    ),
                    borderRadius: BorderRadius.circular(10.0)):BoxDecoration(
                    color: AppColors.dateTimeCardColor,
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.gradientColor,
                        blurRadius: 1.0,
                        spreadRadius: 1,
                        offset: Offset(
                          -2, //left
                          -3, // upward
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10.0),),
                  child: Text(
                    "${index + 1} : 00",
                      textAlign: TextAlign.center,
                      style:const TextStyle(fontSize: 15,color: AppColors.white,fontWeight:FontWeight.w400)
                  ),
                ),
              ),
            );
          }),
    );
  }
}
