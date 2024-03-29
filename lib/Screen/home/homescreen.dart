import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/Screen/auth/phone/phone.dart';
import 'package:e_commerce/Screen/home/cart.dart';
import 'package:e_commerce/Screen/home/datashowing.dart';
import 'package:e_commerce/Screen/home/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  var carsoulslider = [
    "https://i.pinimg.com/564x/69/35/2e/69352e36b46fcffe5a033b0881460872.jpg",
    "https://i.pinimg.com/236x/dc/f6/23/dcf6239bbf6a973c7b06908f8fe03409.jpg",
    "https://i.pinimg.com/564x/ac/30/49/ac30499143047da2dd8cc5f8793402d6.jpg",
    "https://i.pinimg.com/564x/ec/bd/c6/ecbdc6dd6fae8a81f47cfa2b932bc5c6.jpg",
    "https://i.pinimg.com/236x/2a/54/06/2a540620d1869473e59f5ab40cddc0b7.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context,orientation){
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>const Cart()));
                          },
                          child: Icon(
                            Symbols.shopping_cart,
                            size: 30,
                          ),
                        ),
                        Text(
                          "E-Commerce",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                        ),
                        GestureDetector(
                          onTap: (){
                            // Navigator.push(context, MaterialPageRoute(builder: (_)=>Notification_icon()));
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>Notification_icon()));
                          },
                          child: Icon(
                            Icons.notifications_none_outlined,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  /* Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextField(
                            autocorrect: true,
                            style: TextStyle(fontSize: 12),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 0),
                              border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                              filled: true,
                              fillColor: Colors.transparent,
                              hintText: "Search....",
                              // hintStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(
                                Icons.search,
                                size: 20,
                                // color: Colors.black,
                              ),
                            ),
                            // style: TextStyle(color: Colors.black),
                          ),
                        ),
                        VerticalDivider(
                          thickness: 2,
                          // color: Colors.grey,
                          indent: 10,
                          endIndent: 10,
                        ),
                        Icon(Symbols.filter_1,
                          size: 20,
                          // color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),*/
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      autocorrect: true,
                      style: TextStyle(fontSize: 10),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        border:
                        OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(12)),
                        filled: true,
                        fillColor: Colors.black26,
                        hintText: "Search....",
                        // hintStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 20,
                          // color: Colors.black,
                        ),
                      ),
                      // style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  /*Container(
                  width: double.maxFinite,
                  // margin: EdgeInsets.symmetric(horizontal: 25),
                  height: 200,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      animateToClosest: true,
                      aspectRatio: 4 / 7,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve:Curves.linear,
                    ),
                    items: carsoulslider.map((index) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              width: double.infinity,
                              height: double.infinity,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Image.network(index, fit: BoxFit.fitWidth));
                        },
                      );
                    }).toList(),
                  ),
                ),*/
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    height: orientation == Orientation.portrait ? 200 : 400,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow:[
                          BoxShadow(color: Colors.black87,blurRadius: 5.0),
                        ]
                    ),
                    child: AnotherCarousel(
                      images: List.generate(carsoulslider.length, (index) {
                        return Image.network(
                          carsoulslider[index],
                          fit: BoxFit.cover,
                        );
                      }),
                      dotSize: 5,
                      boxFit: BoxFit.cover,
                      animationCurve: Curves.linear,
                      indicatorBgPadding: 5,
                      autoplay: true,
                      dotBgColor: Colors.transparent,
                      showIndicator: true,
                    ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    height:80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder:(context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                backgroundColor : Colors.blue,
                                radius: 25,
                              ),
                              Text("hiii"),
                            ],
                          ),
                        );
                      },
                      itemCount: 15,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Special For You",style:  TextStyle(fontSize: 25,fontWeight:FontWeight.bold),),
                        Text("See More",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                      ],
                    ),
                  ),
                  GridView.extent(
                    shrinkWrap: true,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    clipBehavior: Clip.antiAlias,
                    physics: NeverScrollableScrollPhysics(),
                    maxCrossAxisExtent: orientation == Orientation.portrait ? 200.h : 250.h,
                    children: List.generate(20, (index){
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>detailshowing()));
                        },
                        child: Card(
                          elevation: 5,
                          clipBehavior: Clip.antiAlias,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                Container(
                                  child: Image.network("https://i.pinimg.com/564x/ac/30/49/ac30499143047da2dd8cc5f8793402d6.jpg",fit: BoxFit.cover,),
                                  height: 90.h,
                                  width: double.infinity,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius
                                          .all(Radius.circular(10))
                                  ),
                                ),
                                Align(
                                    alignment:Alignment.centerLeft,
                                    child: Text("yash ahfhafhjka ahskdfhajhf hajahifhaihfja fhajhfjh ",style: TextStyle(fontSize: 16.h,fontWeight: FontWeight.w600),maxLines: 1,overflow: TextOverflow.ellipsis,)
                                ),
                                Align(
                                    alignment:Alignment.centerLeft,
                                    child: Text("yash afkdhafdoiahf ahsfdhsasdjfhkjadsf ahsifduhaui ",style: TextStyle(fontSize: 12.h),overflow: TextOverflow.ellipsis,)
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(" Rs. 300",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.h),),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
/*class manager extends StatelessWidget {
  const manager({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context,orientation){
          if(orientation == Orientation.portrait)
          {
            return
          }
          else{
            return
          }
        }
    );
  }
}
class grid_protrait extends StatelessWidget {
  const grid_protrait({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
class grid_landscape extends StatelessWidget {
  const grid_landscape({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}*/


