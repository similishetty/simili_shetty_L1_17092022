import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:simili_shetty_l1_17092022/model/ticket_details.dart';
import 'package:simili_shetty_l1_17092022/screens/app_bar_action_buttons.dart';
import 'package:simili_shetty_l1_17092022/screens/bottom_navigation_screen.dart';
import 'package:simili_shetty_l1_17092022/utils/custom_app_data.dart';
import 'package:simili_shetty_l1_17092022/utils/listeners.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../utils/app_colors.dart';

class TicketDetailsScreen extends StatefulWidget {
  const TicketDetailsScreen({Key? key}) : super(key: key);

  @override
  _TicketDetailsScreenState createState() => _TicketDetailsScreenState();
}

class _TicketDetailsScreenState extends State<TicketDetailsScreen> implements OnBackListeners {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  late TicketDetails ticketDetails;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ticketDetails = TicketDetails.fromJson(AppData.ticketDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: AppColors.primary,
        appBar: AppBar(
          leading: kIsWeb?Container():CustomBackButton(onBackListeners: this),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            "Mobile Tickets",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          actions: const [
           MenuButton()
          ],
          elevation: 0.0,
        ),
        body: WillPopScope(
        onWillPop:  () async => true,
          child: SingleChildScrollView(child: Column(children:
           [
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Text("Once you buy a movie ticket simply scan the barcode to acces to your movie.",
              textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: AppColors.white),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CarouselSlider.builder(
                itemCount: ticketDetails.ticketDetails.length,
                itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                    sliderItem(ticketDetails.ticketDetails[itemIndex]),
                options: CarouselOptions(
                  height: 450,
                   viewportFraction: 0.7,
                    initialPage: 0,
                   enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }

                ),

              ),
            ),
             const SizedBox(height: 10,)
,           Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: ticketDetails.ticketDetails.asMap().entries.map((entry) {
                 return GestureDetector(
                   onTap: () => _controller.animateToPage(entry.key),
                   child: Container(
                     width: 10.0,
                     height: 10.0,
                     margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                     decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         color:AppColors.indicatorColor.withOpacity(_current == entry.key ? 0.9 : 0.3)),
                   ),
                 );
               }).toList(),
             ),




           ],),),
        )
    );

  }
  Widget sliderItem(TicketDetail ticketDetail){
    return Center(
      child: Stack(alignment: Alignment.bottomCenter, children: <Widget>[
        Image.asset(
          ticketDetail.moviePath,
          fit: BoxFit.contain,
        ),
        ClipPath(
          clipper: TicketClipper(),
          child: Container(
            height: 140,
            width: 250,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                AppColors.ticketDetailLightGradient,
                AppColors.ticketDetailDarkGradient,
                AppColors.ticketDetailLightGradient,
              ]),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column
              (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:  [
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(text: 'Date :  ',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: AppColors.tickerDetailsTitle)),
                          TextSpan(
                            text: ticketDetail.date,
                            style: const TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(text: 'Time : ',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: AppColors.tickerDetailsTitle)),
                          TextSpan(
                            text: ticketDetail.time,
                            style: const TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 13),
                          ),
                        ],
                      ),
                    )
                  ],),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:  [
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(text: 'Row :  ',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: AppColors.tickerDetailsTitle)),
                            TextSpan(
                              text: ticketDetail.row,
                              style: const TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(text: 'Seats : ',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: AppColors.tickerDetailsTitle)),
                            TextSpan(
                              text: ticketDetail.seats,
                              style: const TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 13),
                            ),
                          ],
                        ),
                      )
                    ],),
                ),
                Image.asset("assets/images/barcode.png",height: 60,width: 200,fit: BoxFit.fitWidth,)
              ],),
          ),
        ),
      ]),
    );
  }

  @override
  onBackPressed() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const BottomNavigationScreen(selectedIndex: 0),), (route) => false);

  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(Rect.fromCircle(center: const Offset(0.0, 0.0), radius: 25.0));
    path.addOval(
        Rect.fromCircle(center: Offset(size.width, 0.0), radius: 25.0));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
