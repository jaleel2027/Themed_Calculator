import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:toggle_switch/toggle_switch.dart';


class HomeCalc extends StatefulWidget {
  const HomeCalc({Key? key}) : super(key: key);

  @override
  State<HomeCalc> createState() => _HomeCalcState();
}

class _HomeCalcState extends State<HomeCalc> {

  List buttons = [
    'AC','DEL','(', ')',
    '7', '8', '9', '+',
    '4', '5', '6', '-',
    '1', '2', '3', '*',
    '0', '.', '/', '=',
  ];

  bool enableDark = false;
  String ans = '';
  String value = '';

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
         backgroundColor: enableDark?
         Theme.of(context).colorScheme.secondary
         :Theme.of(context).primaryColor,

        body: Column(
          children: [
            Container(
              width: w,
              height: w*0.30,
              color: enableDark?
              Theme.of(context).colorScheme.secondary
              :Theme.of(context).primaryColor,
              child: Container(
                padding: EdgeInsets.only(left: 5,top: 10,right: 5),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ToggleSwitch(
                            totalSwitches: 2,
                            iconSize: 30,
                            initialLabelIndex: 0,
                            activeFgColor: enableDark?Color(0xff6b6f77):Theme.of(context).colorScheme.secondary,
                            inactiveFgColor: enableDark?Theme.of(context).primaryColor:Color(0xffdddddd),
                            activeBgColors:[
                              [enableDark?Color(0xff2a2d37):Color(0xfff4f1f2),],
                               [enableDark?Color(0xfff4f1f2):Color(0xff2a2d37),],
                              ],
                            inactiveBgColor: enableDark?Color(0xff2a2d37):Color(0xfff4f1f2),
                            minWidth: 50,
                            minHeight: 40,
                            onToggle: (index){
                              setState(() {
                                if(index==0){
                                  enableDark=false;
                                  //means light:
                                }else
                                  enableDark=true;
                                //means dark:
                              });
                            },
                            icons: [
                              CupertinoIcons.sun_max,
                              CupertinoIcons.moon,
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 35,),
                      Text(value,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: enableDark?
                          Theme.of(context).primaryColor
                              :Theme.of(context).colorScheme.secondary,
                      ),),
                      SizedBox(height: 30,),
                      Text(ans,
                        style: TextStyle(
                          fontSize: 30,
                          color: enableDark?
                          Theme.of(context).primaryColor
                              :Theme.of(context).colorScheme.secondary,
                        ),),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: enableDark?Color(0xff2a2d37):
                        Color(0xfff4f1f2),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                  ),
                  padding: EdgeInsets.all(8),
                  child: GridView.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 20,
                    children: [
                      for(String icon in buttons)
                        GestureDetector(
                          onTap: valueChange(icon),
                          child: Container(
                            width: w*0.05,
                            height: h*0.05,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color: (icon=='AC'|| icon=='DEL')?Colors.red:
                                        (icon=='+' || icon=='-'|| icon=='+'||icon=='/')?
                                        Colors.green:(icon=='(' || icon==')' )?Colors.blueAccent:
                                            enableDark?Theme.of(context).primaryColor:Theme.of(context).colorScheme.secondary,
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(icon,
                              style: TextStyle(
                                fontSize: 22,
                                color: (icon=='AC'|| icon=='DEL')?Colors.red:
                                (icon=='+' || icon=='-'|| icon=='+'||icon=='/')?
                                Colors.greenAccent.shade400:(icon=='(' || icon==')' )?Colors.blueAccent:
                                enableDark?Theme.of(context).primaryColor:Theme.of(context).colorScheme.secondary,
                              ),),
                            ),
                          ),
                        )],
                  ),
                )
            )
          ],
        ),

      ),

    );
  }

  valueChange(String s) {
    if(s=='0')
      value= value+'0';
      if(s=='1')
        value= value+'1';
        if(s=='2')
          value= value+'2';
          if(s=='3')
            value= value+'3';
            if(s=='4')
              value= value+'4';
              if(s=='5')
                value= value+'5';
                if(s=='6')
                  value= value+'6';
                  if(s=='7')
                    value= value+'7';
                    if(s=='8')
                      value= value+'8';
                      if(s=='9')
                        value= value+'9';

                        if(s=='+')
                          value= value+'+';
                          if(s=='-')
                            value= value+'-';
                            if(s=='*')
                              value= value+'*';
                              if(s=='/')
                                value= value+'/';
                                if(s=='AC') {
                                  value = '';
                                  ans = '0';
                                }
                                  if(s=='DEL'){
                                    if(value =='')
                                      value = '';
                                    else {
                                      value=value.substring(0,value.length-1);
                                    }
                                  }

                                  if(s== '(')
                                    value=value+'(';

                                  if(s== ')')
                                    value=value+')';

                                  if(s== '.')
                                    value=value+'.';

                      // if(s== '='){
                      //   {
                      //     ans = calc(value);
                      //     value='';
                      //   }
                      // }
                      setState(() {
                      });
  }

  // String calc(String v){
  //   String modVal=v;
  //   Parser p = Parser();
  //   Expression e =p.parse(modVal);
  //   ContextModel cm = ContextModel();
  //   num eVal = e.evaluate(EvaluationType.REAL, cm);
  //   String a= eVal.toString();
  //   return a.length>20?eVal.toStringAsPrecision(16):a;
  // }

}
