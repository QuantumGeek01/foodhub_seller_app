import 'package:flutter/material.dart';

class FoodItemsScreen extends StatefulWidget {
  const FoodItemsScreen({Key? key}) : super(key: key);

  @override
  State<FoodItemsScreen> createState() => _FoodItemsScreenState();
}

class _FoodItemsScreenState extends State<FoodItemsScreen> {
  final List<Map<String,dynamic>> _footItems = [
    {
      "id":1,
      "name":"Pizza",
      "description":"Sausage, Mushroom, Spice.",
      "price":380,
      "image":
      "https://beyond-meat-cms-production.s3.us-west-2.amazonaws.com/1026c2af-dc2f-4688-bf53-0f33d6070851.jpeg",
    },
    {
      "id":2,
      "name":"Beef Burger",
      "description":"Prepared with 1x single beef patty,secret sauce.",
      "price":250,
      "image":
      "https://www.certifiedirishangus.ie/wp-content/uploads/2019/11/TheUltimateBurgerwBacon_RecipePic.jpg",
    },
    {
      "id":3,
      "name":"Crispy Chicken",
      "description":"Prepared with boneless chicken, breasts, lemon juice & egg",
      "price":80,
      "image":
      "https://www.tbsnews.net/sites/default/files/styles/big_2/public/images/2021/10/22/fried_chicken-1024x536.png",
    },
    {
      "id":4,
      "name":"Corn Soup",
      "description":"Healthy soup simmered with special ingredients, corn & mild spices.",
      "price":130,
      "image":
      "https://static.toiimg.com/thumb/88198991.cms?imgsize=38134&width=800&height=800",
    },
    {
      "id":5,
      "name":"Chicken Chowmein",
      "description":"A classic chinese stir-fry dish with \nshredded chicken & veggies",
      "price":210,
      "image":
      "https://hintofhelen.com/wp-content/uploads/2021/01/Actifry-Chicken-Chow-Mein-Recipe-Hint-of-Helen-2-e1610378434717-735x678.jpg",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _footItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:const EdgeInsets.only(left:5,right:5,top:10),
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              elevation: 5,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.network(
                      _footItems[index]["image"],
                      height: 180,
                      fit: BoxFit.fill,
                    ),
                    Center(child:Text('${ _footItems[index]["name"]}',
                    style:const TextStyle(
                      fontSize:22,
                      fontWeight:FontWeight.bold
                    ))),
                    Text('${_footItems[index]["description"]}',
                    style:const TextStyle(
                      fontSize:17
                    ),),
                    Text('Tk ${_footItems[index]["price"]}'),
                    const SizedBox(height:5)
                  ])),
          );
        });
  }
}
