import 'package:flutter/material.dart';
import 'package:plant_app/service/plant_service.dart';

class AddPlant extends StatefulWidget {
  const AddPlant({super.key});

  @override
  State<AddPlant> createState() => _AddPlantState();
}

class _AddPlantState extends State<AddPlant> {
  TextEditingController name1= new TextEditingController();
  TextEditingController type1= new TextEditingController();
  TextEditingController qty1= new TextEditingController();
  TextEditingController price1= new TextEditingController();


  void SendValuesToApi() async {

    final response = await PlantApiService().sendData(name1.text, type1.text, qty1.text, price1.text);
    if(response["status"]=="success")
    {
      print("successfully added");
    }
    else
    {
      print("Error");
    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){Navigator.pop(context);},
              icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
          title: Text("ADD PLANT",style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.cyan.shade800,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 10,),
                TextField(
                  controller: name1,
                  decoration: InputDecoration(
                      labelText: "Plant Name",
                      hintText: "Enter plant name",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: type1,
                  decoration: InputDecoration(
                      labelText: "Plant Type",
                      hintText: "Enter plant type",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: qty1,
                  decoration: InputDecoration(
                      labelText: "Quantity",
                      hintText: "Enter quantity",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: price1,
                  decoration: InputDecoration(
                      labelText: "Price",
                      hintText: "Enter price",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                    height: 45,
                    width: 250,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.cyan.shade800,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                        onPressed: SendValuesToApi, child: Text("ADD"))),

              ],
            ),
          ),
        ),

      ),
    );
  }
}
