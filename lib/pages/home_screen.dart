import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:quran_app/models/surah_model.dart';
import 'package:quran_app/pages/detail_surah.dart';
import 'package:quran_app/shared/themes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<SurahModel>>? surah;
  @override
  void initState() {
    surah = fetchSurah();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBgColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  children: [
                    IconButton(
                      iconSize: 30,
                      color: kGreyColor,
                      onPressed: () {},
                      icon: Icon(Icons.menu),
                    ),
                    Expanded(
                      child: Text(
                        'Quran App',
                        style: kTitleTextStyle.copyWith(
                            color: Colors.white, fontSize: 20),
                      ),
                    ),
                    IconButton(
                      iconSize: 30,
                      color: kGreyColor,
                      onPressed: () {},
                      icon: Icon(Icons.search),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Assalamualaikum',
                      style: kMediumTextStyle.copyWith(color: kGreyColor),
                    ),
                    Text(
                      'Muhammad Yafi Alhakim',
                      style: kSemiboldTextStyle.copyWith(
                          color: Colors.white, fontSize: 24),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Center(
                child: Container(
                  width: 326,
                  height: 131,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/cover.png'),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/lastread.png',
                                width: 20, height: 20),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Last Read',
                              style: kMediumTextStyle.copyWith(
                                  fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 8, right: 8),
                child: FutureBuilder<List<SurahModel>>(
                  future: surah,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => DetailSurah(
                                        nomor: snapshot.data![index].number,
                                      )),
                                ),
                              );
                            },
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage('assets/ayah.png'),
                                child: Text(
                                  '${snapshot.data![index].number}',
                                  style: kMediumTextStyle.copyWith(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ),
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    snapshot.data![index].englishName,
                                    style: kMediumTextStyle.copyWith(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  Text(
                                    snapshot.data![index].name,
                                    style: kMediumTextStyle.copyWith(
                                        fontSize: 20, color: kHighlightColor),
                                  ),
                                ],
                              ),
                              subtitle: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    snapshot.data![index].revelationType,
                                    style: kMediumTextStyle.copyWith(
                                        fontSize: 14, color: kGreyColor),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '•',
                                    style: TextStyle(
                                        color: kGreyColor, fontSize: 20),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    snapshot.data![index].numberOfAyahs
                                        .toString(),
                                    style: kMediumTextStyle.copyWith(
                                        fontSize: 14, color: kGreyColor),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text('gagal menampilkan data'));
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<List<SurahModel>> fetchSurah() async {
  String api = 'https://equran.id/api/surat';
  final response = await http.get(
    Uri.parse(api),
  );

  if (response.statusCode == 200) {
    var surahJson = jsonDecode(response.body) as List;

    return surahJson.map((surah) => SurahModel.fromJson(surah)).toList();

    //jika tidak di mapping hanya mendapat instance
    //intance of keynya
  } else {
    throw Exception('Failed to load surah');
  }
}
