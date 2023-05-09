import 'package:flutter/material.dart';



class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child:
          Container(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context,index){
                  return Container(
                    height: 50,
                    color: Colors.green,
                    child: ListTile(
                      leading: Icon(Icons.tag_faces_rounded),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                  );
                }
            ),
          )
        ),
      );

  }
}
