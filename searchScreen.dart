// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ieee_tasks/food_model.dart';
import 'package:google_fonts/google_fonts.dart';


void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
    const MyApp({Key?key}) : super (key:key);
    @override
    Widget build(BuildContext context)
    {
      return MaterialApp(
        home: SearchPage(),
      );
    }
}

class SearchPage extends StatefulWidget{
  const SearchPage ({Key?key}) : super (key:key);
    @override
    State<SearchPage>createState()=>_SearchPageState();
}

class _SearchPageState extends State<SearchPage>{

  // dummy food
  static List<FoodModel> main_food_list = [
    FoodModel("aVegan-Stir-Fry",21 ,2.5 ,"assets/Vegan-Stir-Fry-006.webp"),
    FoodModel("aCheesy-Skillet-Chicken-Parm-Meatballs",10 ,4 ,"assets/Cheesy-Skillet-Chicken-Parm-Meatballs_012-tight-cropped.webp"),
    FoodModel("Steak",33 ,5 ,"assets/easy-dinner-recipes-f768402675e04452b1531360736da8b5.jpg"),
    FoodModel("Chicken and Rice ",16 ,1.5 ,"assets/sub-buzz-1009-1646440684-8.jpg"),
    FoodModel("Creamy-Cajun-Chicken",35 ,2 ,"assets/Creamy-Cajun-Chicken-6.webp"),
    FoodModel("Beef Burger",17 ,1 ,"assets/wp7029319.webp"),
    FoodModel("Pizza",34 ,3.7 ,"assets/1050377.jpg"),
        FoodModel("Koshary",1 ,5 ,"assets/Egyptian-Koshari-square-768x768.jpg"),



  ];

  // list will display and filter
  List<FoodModel>display_list= List.from(main_food_list);
  void updateList(String value)
  {
    // filter data
    setState(() {
      display_list=main_food_list.where((element) => element.food_title!.toLowerCase().contains(value.toLowerCase()))
      .toList();
    });
  }
  @override
  Widget build (BuildContext context)
  {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 156, 58, 1),
        elevation: 0.0,
      ),
      body: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
              Center(
                child: Text(
                  "Find Food",
                style: GoogleFonts.abel(
                  textStyle: TextStyle(
                    color: Color.fromARGB(255, 156, 58, 1),
                    fontSize: 22.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                ),
              ),
          SizedBox(
            height:20.0 ,
          ),
          TextField(
            onChanged: (value) => updateList(value),
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 156, 58, 1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
              hintText: "eg: Koshry",
              prefixIcon: Icon(Icons.search), // Change this line
              prefixIconColor: Colors.white,
            ),
          ),
            SizedBox(height: 20.0,),
            Expanded(
              // if search result empty
              child:display_list.length==0?Center(child: Text("No Result Found",style: TextStyle(color: Colors.black,fontSize:22.0,fontWeight: FontWeight.bold),),)
              :ListView.builder(
                itemCount:display_list.length,
                itemBuilder: (context,index)=>ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title: Text(display_list[index].food_title!,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight:FontWeight.bold,
                    ),
                  ),
                    subtitle: Text('${display_list[index].food_price!}\$',
                    style: TextStyle(
                    color: Colors.black,
                    fontWeight:FontWeight.bold,
                    ),
                  ),
                  trailing: Text("${display_list[index].rating}",
                    style: TextStyle(
                    color: Color.fromARGB(255, 131, 101, 18),
                    fontWeight:FontWeight.bold,
                    fontSize: 13.0,
                    ),
                  ),
                  leading: SizedBox(
                    width: 100, // specify the desired width
                    height: 100, // specify the desired height
                    child: Image.asset(
                      display_list[index].food_poster_url!,
                      fit: BoxFit.cover, // adjust the fit of the image within the SizedBox
                    ),
                  ),             ),
              ), 
            ),
          ],
        ),
      ),
    );
  }
}
