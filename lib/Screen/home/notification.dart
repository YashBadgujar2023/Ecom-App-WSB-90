import 'package:flutter/material.dart';

class Notification_icon extends StatefulWidget {
  const Notification_icon({super.key});

  @override
  State<Notification_icon> createState() => _Notification_iconState();
}

class _Notification_iconState extends State<Notification_icon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemBuilder: (_,index)
              {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                  child: ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>notification_detail(title: "App Notification",description: "Hii Yash You Have Notification for Your Order asdfkjahdfjahfd hakjsffhljkahfajkhfhajfhjk jahfjkdshah fdjh",)));
                    },
                    leading:CircleAvatar(
                        child: Icon(Icons.person)
                    ),
                    tileColor: Colors.grey.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    title: Text("App Notification",maxLines: 1,),
                    subtitle: Text("Hii Yash You Have Notification for Your Order asdfkjahdfjahfd hakjsffhljkahfajkhfhajfhjk jahfjkdshah fdjh", maxLines: 2,),
                  ),
                );
              },
        itemCount: 10,
      ),
    );
  }
}
class notification_detail extends StatelessWidget {
  const notification_detail({super.key,required this.title,required this.description});
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children:[
              Text(title,maxLines: null,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              Text(description,maxLines: null,textAlign: TextAlign.justify,),
            ],
          ),
        ),
      ),
    );
  }
}

