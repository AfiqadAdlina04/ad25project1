import 'package:flutter/material.dart';

class PizzaMenuPage extends StatefulWidget {
  const PizzaMenuPage({super.key});

  @override
  State<PizzaMenuPage> createState() => _PizzaMenuPageState();
}


class _PizzaMenuPageState extends State<PizzaMenuPage> {

  final List <Map<String, String>> pizzas = [
    {
      'name':'Margherita',
      'description':'Classic cheese and tomato base',
      'Price': 'RM13',
      'Image': 'https://static.vecteezy.com/system/resources/previews/026/850/474/non_2x/margherita-pizza-transparent-png.png'
    },
    {
      'name':'Pepperoni',
      'description':'Loaded with spicy pepperoni slices',
      'Price': 'RM10',
      'Image': 'https://static.vecteezy.com/system/resources/previews/036/497/986/non_2x/ai-generated-delicious-pepperoni-pizza-on-transparent-background-free-png.png'
    },
    {
      'name':'Viggie Delight',
      'description':'Topped with all your favourite fresh vege',
      'Price': 'RM25',
      'Image': 'https://cheezibite.com/wp-content/uploads/2024/02/248-2486809_transparent-vegetable-pizza-png-png-download-removebg-preview-1.png'
    },
    {
      'name':'BBQ Chicken',
      'description':'Topped with Chicken grilled with bbq sauce',
      'Price': 'RM16',
      'Image': 'https://static.vecteezy.com/system/resources/previews/036/497/987/non_2x/ai-generated-savoring-the-flavorful-layers-of-bbq-chicken-pizza-on-transparent-background-free-png.png'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'LePizza',
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Text('Explore Our TASTY Pizza! Pick your FAV Slice')

            ],
          ),
        ),
      ),
    );
  }
}
