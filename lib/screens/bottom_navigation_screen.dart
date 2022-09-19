import 'package:flutter/material.dart';
import 'package:simili_shetty_l1_17092022/screens/choose_movie_screen.dart';
import 'package:simili_shetty_l1_17092022/screens/ticket_details_screen.dart';
import 'package:simili_shetty_l1_17092022/utils/app_colors.dart';
import 'package:simili_shetty_l1_17092022/utils/custom_app_data.dart';

class BottomNavigationScreen extends StatefulWidget {
  final int selectedIndex;
  const BottomNavigationScreen({Key? key, required this.selectedIndex})
      : super(key: key);

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  late int selectedIndex;
  List<Widget> bottomWidget = <Widget>[
    const ChooseMovieScreen(),
    const Text('Coming Soon',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: AppColors.white)),
    const TicketDetailsScreen(),
    const Text('Coming Soon',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: AppColors.white)),
    const Text('Coming Soon',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: AppColors.white)),
  ];

   _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: bottomWidget.elementAt(selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.iconBgColor,AppColors.ticketDetailLightGradient,
              AppColors.reservationLightGradient,],
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (int index){
            _onItemTapped(index);
          },
          showUnselectedLabels: false,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          elevation: 5,
          unselectedItemColor: Colors.white,
          selectedIconTheme: const IconThemeData(color: AppColors.white),
          items:  [
            BottomNavigationBarItem(
              icon: selectedIndex==0?Utils.appBarButtonBg(Icons.home,30):const Icon(Icons.home),
              label: ""

            ),
            BottomNavigationBarItem(
              icon: selectedIndex==1?Utils.appBarButtonBg(Icons.gps_fixed,30):const Icon(Icons.gps_fixed),
                label: ""

            ),
            BottomNavigationBarItem(
                icon: selectedIndex==2?Utils.appBarButtonBg(Icons.event_seat,30):const Icon(Icons.event_seat),
                label: ""

            ),
            BottomNavigationBarItem(
                icon: selectedIndex==3?Utils.appBarButtonBg(Icons.store_sharp,
                    30):const Icon(Icons.store_sharp),
                label: ""

            ),
            BottomNavigationBarItem(
                icon: selectedIndex==4?Utils.appBarButtonBg(Icons.person
                    ,30):const Icon(Icons.person),
                label: ""
            ),
          ],
        ),
      )
    );
  }
}
