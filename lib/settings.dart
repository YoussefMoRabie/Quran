import 'package:flutter/material.dart';
import 'constant.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Settings",
          ),
          backgroundColor: primaryColor,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'حجم الخط العربي :',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontFamily: 'me_quran',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,

                    ),
                  ),
                  Slider(
                           value: arabicFontSize,
                           min: 20,
                           max: 40,
                    onChanged: (value){
                              setState(() {
                                arabicFontSize = value;
                              });
                    },

                  ),

                  Text(
                    "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏ ‏",
                    style: TextStyle(
                        fontFamily: 'quran', fontSize: arabicFontSize),
                    textDirection: TextDirection.rtl,
                  ),

                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Divider(),
                  ),
                  const Text(
                    'حجم الخط المصحف :',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontFamily: 'me_quran',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,

                    ),
                  ),
                  Slider(
                           value: mushafFontSize,
                           min: 20,
               max: 50,
                   onChanged: (value){
                             setState(() {
                               mushafFontSize=value;
                             });
                   },
                      ),

                  Text(
                    "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏ ‏",
                    style: TextStyle(
                        fontFamily: 'quran', fontSize: mushafFontSize),
                    textDirection: TextDirection.rtl,
                  ),

                
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                                  onPressed: (){
                                    setState(() {
                                      arabicFontSize=28;
                                      mushafFontSize=40;
                                    });
                                    saveSettings();
                                  },
                        child:const Text(
                          'اعادة ضبط',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontFamily: 'me_quran',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,

                          ),
                        ),
                      ),
                      ElevatedButton(
                            onPressed: (){
                              saveSettings();
                              Navigator.of(context).pop();
                            },
                          child:const Text(
                            'حفظ',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontFamily: 'me_quran',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,

                            ),
                          ),

                      ),
                    ],
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
