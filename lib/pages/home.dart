import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40, left: 20, right:20),
            decoration: BoxDecoration(
              boxShadow: [
                 BoxShadow(

                color: Color(0xff101617).withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0
              )
              ]
            ),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(15),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset('assets/icons/search.svg'),
                ),

                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/filter.svg'),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:BorderSide.none
                )
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        "Weather",
        style: TextStyle(
          color: Colors.black,
          fontSize:18,
          fontWeight: FontWeight.bold

        ),
      ),
      backgroundColor: Colors.white,
      elevation:0.0,
      leading: GestureDetector(
        onTap: () {
          
        },
        child: Container(
           margin:EdgeInsets.all(10) ,
         alignment: Alignment.center,
         child: SvgPicture.asset(
          'assets/icons/right.svg',
          height: 25,
          width: 25,
         ),
        decoration: BoxDecoration(
          color: Color(0xffF7F8F8),
          borderRadius: BorderRadius.circular(10)
        ),
      )  
    ),
    actions: [
        GestureDetector(
          onTap: () {
            
          },
          child: Container(
         margin:EdgeInsets.all(10) ,
         alignment: Alignment.center,
         child: SvgPicture.asset(
          'assets/icons/more.svg',
          height: 30,
          width: 30,
         ),
        decoration: BoxDecoration(
          color: Color(0xffF7F8F8),
          borderRadius: BorderRadius.circular(10)
        ),
          ),
          
        ),
    ],
    );
}
}
