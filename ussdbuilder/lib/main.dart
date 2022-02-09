

// ignore_for_file: camel_case_types, use_key_in_widget_constructors, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ussdbuilder/menu_node.dart';
import 'package:ussdbuilder/ussd_database.dart';



List<MenuNode>? MenuNodes;
void main() {
  
  runApp(MaterialApp(
    
    home: setupInitGui()
    
    
  ));
  refreshNodes();
  MenuNode testNode = MenuNode(parentID: '1', USSDText: 'Text');
  MenuDatabase.instance.update(testNode);
  
  
}

Future refreshNodes() async {
  MenuNodes = await MenuDatabase.instance.readAllNodes();
  print(MenuNodes);
}
class setupInitGui extends StatefulWidget {


  @override
  State<setupInitGui> createState() => _setupInitGuiState();
}

class _setupInitGuiState extends State<setupInitGui> {
  String? dropdownvalue;
  String? dropdownvalue2;
  String branchLogic = 'THis is where the logic goes';
  String USSDText = 'Text';
  @override
  
  Widget build(BuildContext context) {
    
    MediaQueryData queryData = MediaQuery.of(context);
    double mediaWidth = queryData.size.width;
    final double spacing = mediaWidth*0.15;
    List<String> items = [
      'option 1',
      'option2',
      'option 3',
    ];
     
    //String menuType = 'Menu Type';
    return Scaffold(
      appBar: AppBar(
        title: Text('USSD Menu Builder 2.0'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Text('Text 1'),
            Text('Text2'),
            ListTile(
              title: Text('tile1'),
              onTap: (){
              },
            ),            
          ],
        ) 
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0,0.0),
      child: Column(
        
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0,40.0,20.0,10.0),
            child: Row(
              
        
              children: [
                Padding(
                  padding:  EdgeInsets.fromLTRB(spacing,10.0,0.0,10.0),
                  child: SizedBox(
                    width: 100,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Menu Caption',
                      ),
                      ),
                  ),
                ),
                
                Padding(
                  padding:  EdgeInsets.fromLTRB(spacing,10.0,0.0,10.0),
                  child: SizedBox(
                    width: 100,
                    child: TextField(
                      enabled: false,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Menu ID',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.fromLTRB(spacing,10.0,0.0,10.0),
                  child: SizedBox(
                    width: 100,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Parent ID',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding:EdgeInsets.fromLTRB(spacing, 10.0, 10.0, 10.0),
                child: Text('Menu Type:'), 
                ),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0,10.0,10.0,10.0),
                  
                  child: DropdownButton<String>(
                    value: dropdownvalue,
                    items: items.map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    hint: Text('Menu Type'),
                    
                    onChanged: ( value){
                      setState(() {
                        dropdownvalue=value!;
                        print('Clicked');
                      });
                    },
                  ),
                    
                
              ),

          ],),
          Row(children: [
            Padding(
              padding: EdgeInsets.fromLTRB(spacing, 10.0, 10.0, 10.0),
              child: Text('input type:'),
              ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: DropdownButton<String>(
                    value: dropdownvalue2,
                    items: items.map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    hint: Text('Input Type'),
                    onChanged: ( value){
                      setState(() {
                        dropdownvalue2=value!;
                      });
                    },
                  ),

              ),
          

          ],),
          Row(children:[
            Padding(
              padding: EdgeInsets.fromLTRB(spacing, 10.0, 10.0, 10.0),
              child: Text('Branch Logic:'),
              ),
              
            
          Padding(
            padding: EdgeInsets.fromLTRB(10.0,10.0,10.0,10.0),
            child: SizedBox(
              width: 200,
              child: TextField(
                decoration: InputDecoration(
                hintText: branchLogic,
                enabled: false,
              ),
            ),
            ),
          ),
          ],),
          Row(children:[
            Padding(
              padding: EdgeInsets.fromLTRB(spacing, 10.0, 10.0, 10.0),
              child: Text('USSD Text:'),
              ),
              
            
          Padding(
            padding: EdgeInsets.fromLTRB(10.0,10.0,10.0,10.0),
            child: SizedBox(
              width: 200,
              child: TextField(
                decoration: InputDecoration(
                hintText: USSDText,
                enabled: false,
              ),
            ),
            ),
          ),
          ],),
          


        ],

      ),

      ),
      
    );
  }

 
}


