import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cardicon.dart';
import 'newcards.dart';
import 'constvalues.dart';

enum Gender{
  male,female
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

      Gender? selectedGender ;
      int height = 180 ;
      int weight = 55 ;
      int age = 20 ;

                                           //  color changing programm
  //  Color malecolor = activcardColor;
  //  Color femalecolor = activcardColor;
                                                  // MALE COLOR CHANGING FUNCTION
  // void updatcolor(Gender selectgender){
  //   if(selectgender == Gender.male){
  //      if(malecolor == activcardColor){       // Method 1 to change card color on touch
  //        malecolor = inactivardColor ;
  //        femalecolor = activcardColor;
  //      }
  //      else{
  //        malecolor = inactivardColor;
  //      }
  //    }
  //   // FEMALE COLOR CHANGING FUNCTION
  //
  //   if(selectgender == Gender.female){
  //     if(femalecolor == activcardColor){
  //       femalecolor = inactivardColor;
  //       malecolor = activcardColor;
  //     }
  //     else{
  //       femalecolor = inactivardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
         children:  <Widget>[
             Expanded(child: Row(
              children: <Widget> [
                // Expanded(child: NewCard(colour: const Color(0xFF1D1E33), // METHOD 1 TO GIVE COLOR
                Expanded(
                    child: NewCard(
                    onPress: (){
                    setState(() {
                      selectedGender =Gender.male ;
                    });
                  },
                      // colour: malecolor, Method 1
                  colour: selectedGender == Gender.male ? inactivardColor : activcardColor, // method 2
                      cardChild: CardIcon(
                          icon: FontAwesomeIcons.mars,texticn:'MALE'),
                ),

                ),


                Expanded(

                    child: NewCard(
                   onPress: (){
                     setState(() {
                       selectedGender = Gender.female ;
                     });
                   },
                      // colour: malecolor, Method 1
               colour: selectedGender == Gender.female ? inactivardColor : activcardColor, // method 2
                      cardChild:CardIcon(icon: FontAwesomeIcons.venus,texticn: 'FEMALE'),
                ),

                 ),
                    ],
                 ),
                ),
                 Expanded(
                  child: NewCard(
                    colour: activcardColor, // METHOD 2 TO GIVE COLOR
                       cardChild: Column(
                         // crossAxisAlignment: CrossAxisAlignment.stretch,
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[
                                Text('HEIGHT',
                                style: MytextStyle,
                                                   ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.baseline,
                             textBaseline: TextBaseline.alphabetic,
                             children: <Widget>[
                                Text(height.toString(),
                                style: textnumber,
                                ),
                               Text('cm',
                               style: MytextStyle,
                               ),
                             ],
                         ),

                           // Change & modify slider color using theme
                           SliderTheme(data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.cyanAccent,
                              inactiveTrackColor: Colors.black,
                              thumbColor: Colors.pink,
                              overlayColor: Colors.cyanAccent.withOpacity(0.5),
                              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 14),
                              overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                           ),
                               child: Slider(value: height.toDouble(),
                               min: 120.0,
                               max: 220.0,
                               // activeColor: Colors.cyanAccent,   // give default slider color
                               // inactiveColor: Colors.black,
                               onChanged: (double newvalue ){
                               setState(() {
                                 height = newvalue.round();
                               });
                               },
                           ),
                         ),
                         ],
                    ),

                ),
          ),


                Expanded(child: Row(
                  children: <Widget>[
                    Expanded(child: NewCard(
                      colour: activcardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('WEIGHT',
                          style: MytextStyle,
                          ),
                          Text(weight.toString(),
                          style: textnumber,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                child: Icon(FontAwesomeIcons.plus,color: Colors.cyanAccent),
                                  backgroundColor: Colors.pink,
                                  onPressed: (){
                                    setState(() {
                                      weight++ ;
                                    });
                              }
                              ),
                              SizedBox(width: 15),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed:(){
                                    setState(() {
                                      weight--;
                                    });
                                  }
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
              ),

                    Expanded(
                      child: NewCard(
                        colour: activcardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('AGE',style: MytextStyle),
                            Text(age.toString(),style: textnumber),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                setState(() {
                                  age++;
                                });
                                }
                                ),
                            SizedBox(width: 15),
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                 setState(() {
                                   age-- ;
                                 });
                                }
                                ),
                          ],
                    ),
                          ],
                        ),
                    ),
                    ),
                  ],
                ),
                ),

           Container(
             width: double.infinity,
             color: bottomColor,
             height: bottomContainer,
             margin: const EdgeInsets.only(top: 10.0),
           ),

         ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton ({super.key, required this.icon, required this.onPressed});

  final IconData icon ;
  final VoidCallback onPressed ;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon,color: Colors.cyanAccent,),
    onPressed: onPressed ,
    elevation: 6.0,
    fillColor: Colors.pink,
    shape: CircleBorder(),
    constraints: BoxConstraints.tightFor(
    width: 56.0,
    height: 56.0,
),
);;
  }
}



