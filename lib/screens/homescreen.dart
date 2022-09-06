import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List haberler = [
    {
      "image":
          "https://krtknadmn.karatekin.edu.tr/files/karatekin/Benadir_rektor/1.JPG",
      "title":
          "Somali Benadir Üniversitesi Heyetinden ÇAKÜ’ye İş Birliği Ziyareti",
      "date": "06 EYLÜL SALI",
      "type": "Haber"
    },
    {
      "image": "https://krtknadmn.karatekin.edu.tr/files/karatekin/ulus/1.JPG",
      "title":
          "1. Uluslararası Karatekin Bilim ve Teknoloji Kongresi Üniversitemizde gerçekleşti",
      "date": "05 EYLÜL PAZARTESI",
      "type": "Haber"
    },
    {
      "image":
          "https://krtknadmn.karatekin.edu.tr/files/karatekin/egiticiegitimi/1.jpg",
      "title":
          "“Eğiticilerin Eğitimi-2022” Programı “Eğitimde Ölçme ve Değerlendirme” Konusu ile Sona Erdi.",
      "date": "01 EYLÜL PERŞEMBE",
      "type": "Haber"
    },
    {
      "image":
          "https://krtknadmn.karatekin.edu.tr/files/karatekin/Egiticilerinegitimi/1.jpg",
      "title":
          "“Eğiticilerin Eğitimi-2022” Programı “Uzaktan Eğitim Sürecinde Etkileşim ve Web Araçları” Eğitimleri ile Devam Ediyor",
      "date": "29 AĞUSTOS PAZARTESI",
      "type": "Haber"
    }
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final controller = PageController(viewportFraction: 0.8, keepPage: true);

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "Examples",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 360,
              child: PageView.builder(
                padEnds: false,
                allowImplicitScrolling: false,
                itemCount: haberler.length,
                controller: controller,
                pageSnapping: false,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: 360,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            haberler[index]["image"],
                            fit: BoxFit.cover,
                            height: 240,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text(
                                haberler[index]["title"],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(fontSize: 18),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '6 EYLÜL SALI',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(fontSize: 14),
                                    ),
                                  ),
                                  Text(
                                    'Haber',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: haberler.length,
              effect: CustomizableEffect(
                activeDotDecoration: DotDecoration(
                  width: 32,
                  height: 12,
                  color: Colors.indigo,
                  rotationAngle: 180,
                  verticalOffset: -10,
                  borderRadius: BorderRadius.circular(24),
                  // dotBorder: DotBorder(
                  //   padding: 2,
                  //   width: 2,
                  //   color: Colors.indigo,
                  // ),
                ),
                dotDecoration: DotDecoration(
                  width: 24,
                  height: 12,
                  color: Colors.grey,
                  // dotBorder: DotBorder(
                  //   padding: 2,
                  //   width: 2,
                  //   color: Colors.grey,
                  // ),
                  // borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(2),
                  //     topRight: Radius.circular(16),
                  //     bottomLeft: Radius.circular(16),
                  //     bottomRight: Radius.circular(2)),
                  borderRadius: BorderRadius.circular(16),
                  verticalOffset: 0,
                ),
                spacing: 6.0,
                // activeColorOverride: (i) => colors[i],
                inActiveColorOverride: (i) => colors[i],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const colors = [
  Colors.red,
  Colors.green,
  Colors.greenAccent,
  Colors.amberAccent,
  Colors.blue,
  Colors.amber,
];
