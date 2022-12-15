import 'package:flutter/material.dart';
import 'dart:math';


class GuessGameScreen extends StatefulWidget
{
  const GuessGameScreen({Key? key}) : super(key: key);

  @override
  State<GuessGameScreen> createState() => _GuessGameScreenState();
}




class _GuessGameScreenState extends State<GuessGameScreen>
{
  var _message = "Guess the number Between 0-100";
  var _imgPath = "img/Thinking.png";
  var _textColor = Colors.indigo;
  var _randomNum = new Random();
  var _number;
  var _textFildController = TextEditingController();//save the input, :::u should put controller in the TextField
  var _hide = false;


  @override
  //?????????????
  void initState()
  {
    // TODO: implement initState
    super.initState();

    _number = _randomNum.nextInt(100);
  }


  void _checkAnswer()
  {
    var answer = int.parse(_textFildController.text);

    if(answer > _number)
      {
        _message = "Smaller Number";
        _textColor = Colors.red;
        _imgPath = "img/no.png";
      }
    else if (answer < _number)
      {
        _message = "Grater Number";
        _textColor = Colors.red;
        _imgPath = "img/no.png";
      }
    else
      {
        _message = "Correct Answer";
        _imgPath = "img/happy.png";
        _textColor = Colors.green;
        _hide = true;
      }

    //for refresh the page
    setState(()
    {

    });
  }



  void _refresh()
  {
    setState(()
    {
      _message = "Guess the number Between 0-100";
      _imgPath = "img/Thinking.png";
      _textColor = Colors.indigo;
      _number = _randomNum.nextInt(100);
      print(_number);
    });
  }




  @override
  Widget build(BuildContext context)
  {
    //work as render in react.js
    return Scaffold
      (
        appBar: AppBar
          (
            title: const Text("Guess Game"),
            titleTextStyle: TextStyle(color: Colors.indigo, fontSize: 25, fontWeight: FontWeight.bold),
            backgroundColor: Colors.orange,
          ),



        body: Padding
          (
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),//all=all_sides, symmetric=vertical_or_horizontal, onle=pick the side(top,right,down,left)

            child: Column
              (
              mainAxisAlignment: MainAxisAlignment.center, //make all content in the center of the page
              children:
              [
                 Text
                   (
                      _message,
                      style: TextStyle(fontSize: 24, color: _textColor, fontWeight: FontWeight.bold),
                  ),
                //for making space between the up element and down element
                const SizedBox(height: 50,),




                Image.asset
                  (_imgPath, width: 150, height: 150,),
                //for making space between the up element and down element
                const SizedBox(height: 50,),



                TextField
                  (
                      textAlign: TextAlign.center,
                      controller: _textFildController,
                      decoration: InputDecoration(hintText: "numbers",),
                      keyboardType: TextInputType.number,
                  ),
                //for making space between the up element and down element
                const SizedBox(height: 50,),


                if (!_hide)
                  ElevatedButton
                    (
                      onPressed: _checkAnswer,
                      child: Text("Click Me!"),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent),
                    ),


                const SizedBox(height: 50,),



                FloatingActionButton
                  (
                    backgroundColor: Colors.orangeAccent,
                    onPressed: _refresh,
                    tooltip: 'Refresh',
                    child: Icon(Icons.refresh),
                  )
              ],
            ),
        ),
    );
  }
}
