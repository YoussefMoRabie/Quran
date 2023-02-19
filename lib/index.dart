import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'arabic_sura_number.dart';
import 'mydrawer.dart';
import 'surah_builder.dart';
import 'constant.dart';
class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'اذهب الي الآية المثبة',
        child: const Icon(Icons.bookmark),
        backgroundColor: primaryColor,
        onPressed: () async {
          fabIsClicked = true;
          if (await readBookmark() == true) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SurahBuilder(
                          arabic: quran[0],
                          sura: bookmarkedSura - 1,
                          suraName: arabicName[bookmarkedSura - 1]['name'],
                          ayah: bookmarkedAyah,

                        )));
          }
          else{
            Fluttertoast.showToast(
                msg: "ليس لديك آية مثبة",
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "القرآن",
          textDirection: TextDirection.rtl,
          //"Quran",                          child:const Text(
          //                             'حفظ',
          //                             textDirection: TextDirection.rtl,
          //                             style: TextStyle(
          //                               fontFamily: 'me_quran',
          //                               fontWeight: FontWeight.bold,
          //                               fontSize: 20,
          //
          //                             ),
          //                           ),
          style: TextStyle(
              fontFamily: 'me_quran',
              fontSize: 35,
              // fontWeight: FontWeight.bold,
              // shadows: [
              //   Shadow(
              //     offset: Offset(1, 1),
              //     blurRadius: 2.0,
              //     color: Color.fromARGB(255, 0, 0, 0),
              //   ),
              // ]
              ),
        ),
        backgroundColor: primaryColor,
      ),
      body: FutureBuilder(
        future: readJson(),
        builder: (
          BuildContext context,
          AsyncSnapshot snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return indexCreator(snapshot.data, context);
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
    );
  }

  Container indexCreator(quran, context) {
    return Container(
      color: const Color.fromARGB(255, 221, 250, 236),
      child: ListView(
        children: [
          for (int i = 0; i < 114; i++)
            Container(
              color: i % 2 == 0
                  ? const Color.fromARGB(255, 253, 247, 230)
                  : const Color.fromARGB(255, 253, 251, 240),
              child: TextButton(
                child: Row(
                  children: [
                    ArabicSuraNumber(num: i,),
                    const SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      arabicName[i]['name'],
                      style: const TextStyle(
                          fontSize: 30,
                          color: Colors.black87,
                          fontFamily: 'me_quran',
                          shadows: [
                            Shadow(
                              offset: Offset(.5, .5),
                              blurRadius: 1.0,
                              color: Color.fromARGB(255, 130, 130, 130),
                            )
                          ]),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
                onPressed: () {
                  fabIsClicked = false;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SurahBuilder(
                              arabic: quran[0],
                              sura: i,
                              suraName: arabicName[i]['name'],
                               ayah: 0,
                            )),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }


}





