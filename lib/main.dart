import "dart:math";

import "package:flutter/material.dart";

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainApp(),
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  var dig="";
  int dis= 0; 
  var note=[500,100,50,20,10,5,2,1];
  var count=["0","0","0","0","0","0","0","0" ];
  var dirs=["500tk.jpg","100tk.jpg","50tk.jpg","20tk.jpg","10tk.jpg","5tk.jpg","2tk.jpg","1tku.jpg"];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vangti chai"),
      ),
      backgroundColor: Color.fromARGB(255, 1, 37, 92),
      body: Column(
        children: [
          Expanded(
              child: Row(
                children: [
                  cell(clr:205,val:dirs[0],cnt:count[0]),
                  cell(clr:180,val:dirs[1],cnt:count[1]),
                  cell(clr:245,val:dirs[2],cnt:count[2]),
                  cell(clr:230,val:dirs[3],cnt:count[3]),
                ],
              ),
              
          ),
          Expanded(
              child: Row(
                children: [
                  cell(clr:180,val:dirs[4],cnt:count[4]),
                  cell(clr:205,val:dirs[5],cnt:count[5]),
                  cell(clr:230,val:dirs[6],cnt:count[6]),
                  cell(clr:245,val:dirs[7],cnt:count[7]),
                ],
              ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Taka : "+dig,
                    style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),
                    ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              button(digit: "1"),button(digit: "2"),button(digit: "3"),
            ],
          ),
          Row(
            children: [
              button(digit: "4"),button(digit: "5"),button(digit: "6"),
            ],
          ),
          Row(
            children: [
              button(digit: "7"),button(digit: "8"),button(digit: "9"),
            ],
          ),
          Row(
            children: [
              button(digit: "<-"),button(digit: "0"),button(digit: "Calculate"),
            ],
          ),
        ],
      ),

    );
  }
Widget cell({clr,val,cnt}){
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(17,5,17,0),
        child: Container(
          height: 80,
          width: 90,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                val
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(20,0,20,5),
        child: Text(cnt,style:TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),),
      ),
    ],
  );
}
Widget button({digit,buttoncolor=Colors.black}){
  return Expanded(
    child: ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 40,
        maxWidth: 40,
      ),
      child: Container(
        margin: EdgeInsets.all(4),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttoncolor,
            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(8.0)),
            padding: EdgeInsets.all(5),
          ),
          onPressed: (){
            setState(() {
              if(digit=="<-"){
                if(dig.length==0)return;
                dig = dig.substring(0,dig.length-1);
              }
              else if(digit=="Calculate"){
                  if(dig.length==0)return;
                  calculate(n:dig);
              }
              else dig += digit;
            });
          }, 
          child: Text(digit,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28),),
          ),
        ),
    ),
    );
}

void calculate({n}){
  count=["","","","","","","","" ];

  int x = int.parse(dig);

  for(int i=0;i<8;i++){
    count[i] += ((x/note[i]).toInt()).toString();
    x = x%note[i];
  }
  if(int.parse(count[0]) > 99999){
        AlertDialog(title: Text("Sample Alert Dialog"),);
  }
}
}