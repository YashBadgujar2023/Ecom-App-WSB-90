

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            ListView(
              children: [
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
                      Text(
                        "Cart",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
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
                            Icons.share,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index){
                    return  Card(
                      elevation: 3,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        color: Colors.black12,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex:2,
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.all(Radius.circular(12)),
                                ),
                                // child: Image.network("https://i.pinimg.com/564x/ac/30/49/ac30499143047da2dd8cc5f8793402d6.jpg",fit: BoxFit.cover,),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("hiiiii",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                        Icon(Icons.delete,color: Colors.red,)
                                      ],
                                    ),
                                    Text("Hello",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.grey.shade600),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Rs 300",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                                        Container(
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            color: Colors.white54,
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                          ),
                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              FaIcon(FontAwesomeIcons.minus,size: 18,),
                                              SizedBox(width: 5,),
                                              Text("1"),
                                              SizedBox(width: 5,),
                                              Icon(Icons.add,size: 20,)
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },itemCount: 10,
                  ),
                ),
                SizedBox(height: 10,),
              ],
            ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(12,),topRight: Radius.circular(12)),
            boxShadow: [
              BoxShadow(color: Colors.black26,blurStyle: BlurStyle.outer,blurRadius:10 ),
            ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sub Total" ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.grey.shade600),),
                Text(" 300",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
              ],
            ),
            Divider(
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total" ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                Text(" 300",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
              ],
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){},
                child: Text("Checkout",
                  softWrap: true,
                  style: TextStyle(color: Colors.white,fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  padding: EdgeInsets.all(10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
