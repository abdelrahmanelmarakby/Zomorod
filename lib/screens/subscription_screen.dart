import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../data/colors.dart';
import '../widgets/recommendations_section.dart';
import 'all_subscription_screen.dart';

class Subscription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgLightGrey,
      appBar: CustomAppBar(),
      body:SafeArea(
        child: SingleChildScrollView(
          primary: false,
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical:7.0),
                child: Container(
                  height: 90.0,
                  width: double.infinity ,
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      ListView.separated(
                          scrollDirection: Axis.horizontal ,
                          itemBuilder: (context, index) => buildSubsList(),
                          separatorBuilder: (context, index) =>SizedBox(width: 4.0,) ,
                          itemCount: 10),
                      MaterialButton(
                        height: 80.0,
                        minWidth: 40.0,
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (context) =>  All_subscription()
                               )
                          ) ;
                        },
                        color: mainComponentsGrey,
                        child: Text('All'),)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 1.0,),
              RecommendationsSection(),
            ],
          ),
        ),
      ) ,
    );
  }
}
Widget buildSubsList(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage('assets/images/profile_screen/avatars/profile.png'),
          ),
        ],
      ),
      SizedBox(height: 5.0,),
      SizedBox(
        width: 70.0,
        child: Text('Mariam Hussien',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: suvaGrey,
              fontWeight:FontWeight.bold,
              fontSize: 12.0),),
      )
    ],
  );
}
