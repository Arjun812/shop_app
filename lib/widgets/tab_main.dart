import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/pages/cart/view/cart.dart';
import 'package:shop_app/pages/history/view/history.dart';
import 'package:shop_app/pages/homePage/view/home_page.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int currentIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const History(),
    const Cart()
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController!.animateTo(0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: _buildBottomBar(context),
        body: Center(
          child: _widgetOptions.elementAt(currentIndex),
        )
        // body: pages[currentIndex],
        );
  }

  Container _buildBottomBar(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white30,

        // boxShadow: [
        //   BoxShadow(color: Colors.grey, blurRadius: 1, spreadRadius: 1)
        // ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5, top: 5),
          child: TabBar(
            onTap: (int index) {
              setState(() => currentIndex = index);
            },
            labelPadding: const EdgeInsets.all(0),
            labelColor: Theme.of(context).accentColor,
            unselectedLabelColor: Colors.grey[500],
            indicator: const BoxDecoration(),
            // BoxDecoration(
            //   shape: BoxShape.circle,
            //   //borderRadius: BorderRadius.all(Radius.circular(60.0)),
            //   color: blue2,
            // ),
            controller: _tabController,
            tabs: <Widget>[
              BottomTab(
                icon: Image.asset(
                  'assets/icon/home.png',
                  // 'assets/icons/petsooq icons/Other icons/booking.png',
                  height: currentIndex == 0 ? 22 : 22,
                  color: currentIndex == 0 ? Colors.blue : Colors.grey,
                ),
              ),
              BottomTab(
                icon: Image.asset(
                  'assets/icon/history.png',
                  // 'assets/icons/petsooq icons/Other icons/booking.png',
                  height: currentIndex == 1 ? 22 : 22,
                  color: currentIndex == 1 ? Colors.blue : Colors.grey,
                ),
              ),
              BottomTab(
                icon: Image.asset(
                  'assets/icon/cart.png',
                  // 'assets/icons/petsooq icons/Other icons/booking.png',
                  height: currentIndex == 2 ? 23 : 23,
                  color: currentIndex == 2 ? Colors.blue : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomTab extends StatelessWidget {
  final Image? icon;
  final double? iconSize;

  BottomTab({
    @required this.icon,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Tab(
        iconMargin: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(child: Center(child: icon)),
          ],
        ),
      ),
    );
  }
}
