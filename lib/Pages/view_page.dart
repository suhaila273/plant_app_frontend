import 'package:flutter/material.dart';
import 'package:plant_app/model/plant_model.dart';
import 'package:plant_app/service/plant_service.dart';

class ViewPlant extends StatefulWidget {
  const ViewPlant({super.key});

  @override
  State<ViewPlant> createState() => _ViewPlantState();
}

class _ViewPlantState extends State<ViewPlant> {
  Future<List<Plant>> ? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=PlantApiService().getData();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
          title: Text("VIEW PLANTS",style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.cyan.shade800,
        ),
        body: FutureBuilder(
            future: data,
            builder: (context,snapshot){
              if(snapshot.hasData && snapshot.data!.isNotEmpty)
              {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context,index){
                      return Card(
                        color: Colors.cyan.shade100,
                        child: Column(
                          children: [
                            ListTile(
                              title: Text("Plant Name : "+snapshot.data![index].name),
                              subtitle: Text("Plant Type : "+snapshot.data![index].type + "\n"
                                  +"Quantity : "+ snapshot.data![index].qty+ "\n"
                                  +"Price : "+ snapshot.data![index].price
                              ),
                            ),

                          ],
                        ),
                      );
                    });
              }
              else
              {
                return CircularProgressIndicator();
              }
            }),


      ),
    );
  }
}
