import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_app/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 5, initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
  tabController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            flexibleSpace: Transform.translate(
                offset: Offset(0,100),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text('Woman',style: TextStyle(color: kTextColor,fontWeight: FontWeight.bold,fontSize: 20,),),
                )),
            actions: <Widget>[
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                'assets/icons/add_to_cart.svg',
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/search.svg',
                  color: Colors.black,
                ),
              ),
            ],
            bottom: TabBar(
              labelColor: Colors.black87,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor:Colors.black87,
              tabs: <Widget>[
                Tab(
                  text: 'Hand Bags',
                ),
                Tab(
                  text: 'Jewellery',
                ),
                Tab(
                  text: 'FootWare',
                ),
                Tab(
                  text: 'Rings',
                ),
                Tab(
                  text: 'Hands',
                )
              ],
              controller: tabController,
            ),
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.black87,
            ),
            Container(color: Colors.white70,),
            Container(color: Colors.amber,),
          ],
        ));
  }
}
