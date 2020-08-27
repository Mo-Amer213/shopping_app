import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/details_screen.dart';
import 'package:shopping_app/models/product.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List<String> categories = [
    'Hand Bags',
    'Footwear',
    'Jewellery',
    'Rings',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/add_to_cart.svg',
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/search.svg',
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Woman',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: SizedBox(
                //making height for sizedBox is essential for this ya_amer..don't forget
                height: 30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    return buildCategory(index);
                  },
                  itemCount: categories.length,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: kDefaultPadding,
                      crossAxisSpacing: kDefaultPadding,
                      childAspectRatio: 0.75,
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, index) =>
                      buildItemCard(index)),
            )
          ],
        ),
      ),
    );
  }

  Widget buildItemCard(int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailsScreen(
            product: products[index],
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),

//            height: 110,
//            width: 110,
              child: Image.asset(
                products[index].image,
                fit: BoxFit.cover,
              ),
              decoration: BoxDecoration(
                color: products[index].color,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
//            decoration: BoxDecoration(
//                borderRadius: BorderRadius.all(Radius.circular(10)),
//                color: products[index].color,
//                image: DecorationImage(
//                    fit: BoxFit.fill,
//                    image: ExactAssetImage(products[index].image))),
            ),
            Text(products[index].title),
            Text(
              '\$ ${products[index].price} ',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontStyle: FontStyle.normal),
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildAllKinds() {
    return Expanded(
      child: Column(
        children: <Widget>[
          GridView.builder(
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.75),
              itemBuilder: (BuildContext context, index) {
                return buildItemCard(index);
              })
        ],
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            categories[index],
            style: TextStyle(
              color: (selectedIndex == index) ? Colors.black : kTextColor,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
          ),
          Container(
            color: (index == selectedIndex) ? Colors.black : Colors.transparent,
            height: 2,
            width: 15,
          ),
        ],
      ),
    );
  }
}
