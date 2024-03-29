import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class detailshowing extends StatefulWidget {
  const detailshowing({super.key});

  @override
  State<detailshowing> createState() => _detailshowingState();
}

class _detailshowingState extends State<detailshowing> with SingleTickerProviderStateMixin {
  late TabController controller ;
  int color_index = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                    ),
                    child: AnotherCarousel(
                      images: List.generate(2, (index) {
                        return Image.network(
                          "https://i.pinimg.com/564x/ac/30/49/ac30499143047da2dd8cc5f8793402d6.jpg",
                          fit: BoxFit.cover,
                        );
                      }),
                      dotSize: 5,
                      boxFit: BoxFit.cover,
                      animationCurve: Curves.linear,
                      indicatorBgPadding: 20,
                      autoplay: true,
                      dotBgColor: Colors.transparent,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Apple earphone  this very good product in the apple",
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.bold),
                              maxLines: null,
                              // textAlign: TextAlign.justify
                          ),
                          Text("₹ 1300",style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),),
                          Row(
                            children: [
                              Container(
                                margin:EdgeInsets.only(right: 5),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.orange,
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.star,color: Colors.white,),
                                    Text("4.8",style: TextStyle(fontSize: 16,color: Colors.white),),
                                  ],
                                ),
                              ),
                              Text("(302 Review)"),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Text("Color",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
                          SizedBox(height: 5,),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(10, (index){
                                return GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      color_index = index;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 3),
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                        width: 2,
                                        color: index == color_index ? Colors.redAccent : Colors.transparent,
                                      )
                                    ),
                                    child: const CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.red,
                                    ),
                                  ),
                                );
                              })
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 50,
                    child: TabBar(
                      dividerColor: Colors.transparent,
                      controller: controller,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade200,
                        ),labelColor: Colors.black,
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: const [
                          Tab(child: Text("discription"),),
                          Tab(child: Text("specification"),),
                          Tab(child: Text("Review"),),
                        ]
                    ),
                  ),
                  Container(
                    height: 200,
                    child: TabBarView(
                      controller: controller,
                        children: const [
                          Flexible(
                              child: Text("yash",textAlign: TextAlign.justify,)
                          ),
                          Text("is",textAlign: TextAlign.justify,),
                          Text("very",textAlign: TextAlign.justify,),
                        ]
                    ),
                  ),
                ],
              ),
              //nav top back arrow with share and favorite
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.share,
                              size: 25,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.favorite_border,
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12),
        child :Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
                border: Border.all(color: Colors.black)
              ),
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.minus,size: 25,),
                  SizedBox(width: 10,),
                  Text("1"),
                  SizedBox(width: 10,),
                  Icon(Icons.add,size: 25,)
                ],
              ),
            ),
            ElevatedButton(
              onPressed: (){},
              child: Text("Add Cart",
                softWrap: true,
                style: TextStyle(color: Colors.white,fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              ),
            ),
          ],
        )
      ),
    );
  }
}
class tab_bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 0,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade200,
              ),labelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs:[
                Tab(child: Text("discription"),),
                Tab(child: Text("specification"),),
                Tab(child: Text("Review"),),
              ]
          ),
        ),
        extendBodyBehindAppBar: true,
        body:TabBarView(
            children: [
              Text("yash"),
              Text("is"),
              Text("very",),
            ]
        ),
      ),
    );
  }
}


