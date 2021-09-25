import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';


enum SingingCharacter { lafayette, jefferson ,Male,Female}
class Settings  extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings > {

  SingingCharacter? _character = SingingCharacter.lafayette;
  bool isSwitched = false;
  var textValue = 'off';
  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'on';
      });
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'off';
      });
    }
  }

  int _currentIntValueKg = 0;
  int _currentIntValueCm = 0;

  void callBack(int kg){
    setState((){
      kg = _currentIntValueKg.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF641549),
          title: Text(
            "Settings",
          ),
        ),
        body: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 65),
                child: ListTile(
                  title: Text(
                    "Profile",
                    style: TextStyle(
                        color: Colors.amber, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 65),
                child: ListTile(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return AlertDialog(
                              title: Text("Unit System",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    title: const Text('Metric -kg,cm'),
                                    leading: Radio<SingingCharacter>(
                                      activeColor: Colors.amber,
                                      value: SingingCharacter.lafayette,
                                      groupValue: _character,
                                      onChanged: (SingingCharacter? value) {
                                        setState(() {
                                          _character = value;
                                        });
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    title: const Text('imperial -mile,ft-in'),
                                    leading: Radio<SingingCharacter>(
                                      activeColor: Colors.amber,
                                      value: SingingCharacter.jefferson,
                                      groupValue: _character,
                                      onChanged: (SingingCharacter? value) {
                                        setState(() {
                                          _character = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  title: Text("Unit System"),
                  subtitle: Text("Metric-kg,cm"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 65),
                child: ListTile(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return AlertDialog(
                              title: Text("Gender",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    title: const Text('Male'),
                                    leading: Radio<SingingCharacter>(
                                      activeColor: Colors.amber,
                                      value: SingingCharacter.Male,
                                      groupValue: _character,
                                      onChanged: (SingingCharacter? value) {
                                        setState(() {
                                          _character = value;
                                        });
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    title: const Text('Female'),
                                    leading: Radio<SingingCharacter>(
                                      activeColor: Colors.amber,
                                      value: SingingCharacter.Female,
                                      groupValue: _character,
                                      onChanged: (SingingCharacter? value) {
                                        setState(() {
                                          _character = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  title: Text("Gender"),
                  subtitle: Text("Female"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 65),
                child: ListTile(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return AlertDialog(
                              title: Text("Weight",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),

                              content:  Row(
                                children: [
                                  SizedBox(height: 16),
                                  NumberPicker(
                                    value: _currentIntValueKg,
                                    minValue: 0,
                                    maxValue: 150,
                                    step: 1,
                                    haptics: true,
                                    selectedTextStyle:TextStyle(color: Color(0xFF641549)) ,
                                    onChanged: (value) => setState(() => _currentIntValueKg = value),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Text("Kg",style: TextStyle(color: Color(0xFF641549),)),
                                    ),
                                  ),
                                ],
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text("CANCLE",style: TextStyle(color:Color(0xFf4A0737),fontWeight: FontWeight.w700,letterSpacing: 1)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                FlatButton(
                                  child: Text("OK",style: TextStyle(color:Color(0xFf4A0737),fontWeight: FontWeight.w700,letterSpacing: 1)),
                                  onPressed: () {
                                    setState((){

                                    });
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                  title: Text("Weight"),
                  subtitle: Text("Calories Calculations needs it"),
                  trailing: Text('$_currentIntValueKg'" kg",style: TextStyle(color:Color(0xFF641549),fontWeight: FontWeight.w600),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 65),
                child: ListTile(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return AlertDialog(
                              title: Text("Height",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
                              content:  Row(
                                children: [
                                  SizedBox(height: 16),
                                  NumberPicker(
                                    value: _currentIntValueCm,
                                    minValue: 0,
                                    maxValue: 225,
                                    step: 1,
                                    haptics: true,
                                    selectedTextStyle:TextStyle(color: Color(0xFF641549)) ,
                                    onChanged: (value) => setState(() => _currentIntValueCm = value),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Text("cm",style: TextStyle(color: Color(0xFF641549),)),
                                    ),
                                  ),
                                ],
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text("CANCLE",style: TextStyle(color:Color(0xFf4A0737),fontWeight: FontWeight.w700,letterSpacing: 1)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                FlatButton(
                                  child: Text("OK",style: TextStyle(color:Color(0xFf4A0737),fontWeight: FontWeight.w700,letterSpacing: 1),),
                                  onPressed: () {
                                    setState((){

                                    });
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                  title: Text("Height"),
                  subtitle: Text("Distance Speed Calculation needs it"),
                  trailing: Text('$_currentIntValueCm'"cm",style: TextStyle(color:Color(0xFF641549),fontWeight: FontWeight.w600),),

                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 65),
                child: ListTile(
                  title:  Text(
                    "Notifications",
                    style: TextStyle(
                        color: Colors.amber, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 65),
                child: ListTile(
                  title:   Text("Push Notifications",),
                  subtitle: Text('$textValue'),
                  trailing: Transform.scale(
                    scale: 1,
                    child: Switch(
                      onChanged: (value) {
                        setState(() {
                          return toggleSwitch(value);
                        });
                      },
                      value: isSwitched,
                      activeColor: Colors.orange,
                      activeTrackColor: Colors.orange.shade200,
                    ),
                  ),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 65),
                child: ListTile(
                  title: Text("App Version"),
                  subtitle: Text("1.9"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 65),
                child: ListTile(
                  title: Text("Send Feedback"),
                  subtitle: Text("Got any queries? We are happy to help!"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 65),
                child: ListTile(
                  title: Text("Privacy Policy"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 65),
                child: ListTile(
                  title: Text("Terms & Conditions"),
                ),
              ),
            ],
          ),
        ));
  }
}