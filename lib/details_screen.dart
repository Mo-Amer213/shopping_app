import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_app/models/product.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;

  DetailsScreen({Key key, @required this.product}) : super(key: key);
  int itemsCounter = 1;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.product.color,
      appBar: buildDetailsAppBar(context),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Colors'),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: <Widget>[
                                  _buildDotContainer(Colors.black),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  _buildDotContainer(Colors.yellow),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  _buildDotContainer(Colors.grey),
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 100),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Size',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(" ${widget.product.size.toString()} CM"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18, bottom: 18),
                        child: Text(
                          '${widget.product.description}',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, wordSpacing: 1.5),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              buildSingleOutlineBtn(() {
                                setState(() {
                                  if (widget.itemsCounter > 0)
                                    widget.itemsCounter--;
                                });
                              }, Icon(Icons.remove)),
                              Text(
                                ' ${widget.itemsCounter.toString().padLeft(2, '0')} ',
                                style: TextStyle(fontSize: 20),
                              ),
                              buildSingleOutlineBtn(() {
                                setState(() {
                                  widget.itemsCounter++;
                                });
                              }, Icon(Icons.add)),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            child: SvgPicture.asset('assets/icons/heart.svg',
                                fit: BoxFit.cover),
                            decoration: BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            child: SvgPicture.asset(
                              'assets/icons/add_to_cart.svg',
                              fit: BoxFit.fill,color: widget.product.color,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color:widget.product.color),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: 200,
                            child: FlatButton(
                              color: widget.product.color,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                              child: Text('Buy Now'.toUpperCase()),
                              onPressed: (){},
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Some description about the App',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    widget.product.title,
                    style: Theme.of(context).textTheme.headline5.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Price\n',
                                style: TextStyle(fontSize: 18)),
                            TextSpan(
                              text: "${widget.product.price.toString()}  \$",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: ExactAssetImage(widget.product.image),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox buildSingleOutlineBtn(Function press, Icon icon) {
    return SizedBox(
      height: 30,
      width: 30,
      child: OutlineButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        padding: EdgeInsets.zero,
        //this tip is very import as you override the default padding for this item /or widget
        onPressed: press,
        child: icon,
      ),
    );
  }

  Row buildItemNumbersRow() {
    return Row(
      children: <Widget>[
        OutlineButton(
          shape: CircleBorder(),
//                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          borderSide: BorderSide(
            color: Colors.black,
            style: BorderStyle.solid,
            width: 0.75,
          ),
          onPressed: () {},
          child: Icon(
            Icons.remove,
            color: Colors.black,
          ),
        ),
        Text(
          '01',
          style: TextStyle(fontSize: 18),
        ),
        OutlineButton(
          shape: CircleBorder(),
//                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          borderSide: BorderSide(
            color: Colors.black,
            style: BorderStyle.solid,
            width: 0.75,
          ),
          onPressed: () {},
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Container _buildDotContainer(Color color) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 2),
          shape: BoxShape.circle,
          color: color),
    );
  }

  AppBar buildDetailsAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            'assets/icons/search.svg',
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            'assets/icons/add_to_cart.svg',
            color: Colors.white,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}

/*
* All methods needed for detailScreen ua_amer solved hackers found there
*
*   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: buildDetailsAppBar(context),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Colors'),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: <Widget>[
                                  _buildDotContainer(Colors.black),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  _buildDotContainer(Colors.yellow),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  _buildDotContainer(Colors.grey),
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 100),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Size',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(" ${product.size.toString()} CM"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18, bottom: 18),
                        child: Text(
                          '${product.description}',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, wordSpacing: 1.5),
                        ),
                      ),
                      Row(
                        children: <Widget>[

                          Text(' ${itemsCounter.toString().padLeft(
                              2, '0')} ', style: TextStyle(fontSize: 20),),


                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Some description about the App',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    product.title,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline5
                        .copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Price\n',
                                style: TextStyle(fontSize: 18)),
                            TextSpan(
                              text: "${product.price.toString()}  \$",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: ExactAssetImage(product.image),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox buildSingleOutlineBtn() {
    return SizedBox(
      height: 30,
      width: 30,
      child: OutlineButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        padding: EdgeInsets.zero,
        //this tip is very import as you override the default padding for this item /or widget
        onPressed:(){},
        child:Icon(Icons.add),
      ),
    );
  }
  Row buildItemNumbersRow() {
    return Row(
      children: <Widget>[
        OutlineButton(
          shape: CircleBorder(),
//                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          borderSide: BorderSide(
            color: Colors.black,
            style: BorderStyle.solid,
            width: 0.75,
          ),
          onPressed: () {},
          child: Icon(
            Icons.remove,
            color: Colors.black,
          ),
        ),
        Text(
          '01',
          style: TextStyle(fontSize: 18),
        ),
        OutlineButton(
          shape: CircleBorder(),
//                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          borderSide: BorderSide(
            color: Colors.black,
            style: BorderStyle.solid,
            width: 0.75,
          ),
          onPressed: () {},
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Container _buildDotContainer(Color color) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 2),
          shape: BoxShape.circle,
          color: color),
    );
  }

  AppBar buildDetailsAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            'assets/icons/search.svg',
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            'assets/icons/add_to_cart.svg',
            color: Colors.white,
          ),
          onPressed: () {},
        )
      ],
    );
  }
* */
