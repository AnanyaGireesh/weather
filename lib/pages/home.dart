import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});

  State<HomePage> createState()=>_HomePageState();
  List<weathermodels> categories= [];
  void _getCategories() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appBar(),
      backgroundColor: Colors.grey, 
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // _searchfield(),
          SizedBox(height: 40, ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left:20),
              
              child:Text(
                'Category',
                // style: TextStyle(
                //   color:Colors.black,
                //   fontSize: 18,
                //   fontWeight:FontWeight.w600
                // ),
              ),
            ),
            SizedBox(height:15),
            Container(
              height: 150,
              color: Color(0xFF43A047),
              child: ListView.builder(
                itemBuilder: (context, index){
                  return Container();
                },
                itemCount:5,
              ),
             
            )
          ],
        ),
      ],
    )
  );
}
              
      

  Container _searchfield() {
    return Container(
          margin: EdgeInsets.only(top: 40, left: 20, right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xff101617).withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0,
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(15),
              hintText: 'Search Recipes',
              hintStyle: TextStyle(
                color: Color(0xffDDDADA),
                fontSize: 14
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  'assets/icons/search.svg',
                   height:18,
                   width: 18,
                  ),
              ),
              suffixIcon: Container(
                width:100 ,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      VerticalDivider(
                        color: Colors.black,
                        indent:10,
                        endIndent: 10,
                        thickness: 0.1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'assets/icons/filter.svg',
                           height: 18,
                           width: 18,
                           
                          ),
                      ),
                    ],
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
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
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/icons/right.svg',
            height: 18,
            width: 18,
          ),
          decoration: BoxDecoration(
            color: Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/icons/more.svg',
              height: 22,
              width: 22,
            ),
            decoration: BoxDecoration(
              color: Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
}
}
