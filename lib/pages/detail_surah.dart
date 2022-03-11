import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../models/detail_surah_model.dart';
import '../shared/themes.dart';

class DetailSurah extends StatefulWidget {
  final int nomor;
  DetailSurah({Key? key, required this.nomor}) : super(key: key);

  @override
  State<DetailSurah> createState() => _DetailSurahState();
}

class _DetailSurahState extends State<DetailSurah> {
  Future<Seasons>? ayat;
  @override
  void initState() {
    ayat = fetchDetailSurah(widget.nomor);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBgColor,
        body: FutureBuilder<Seasons>(
          future: ayat,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              return SingleChildScrollView(
                child: Center(
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
                              icon: Icon(Icons.arrow_back),
                            ),
                            Expanded(
                              child: Text(
                                snapshot.data!.namaLatin,
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
                      SizedBox(
                        height: 24,
                      ),
                      Center(
                        child: Container(
                          height: 265,
                          width: 327,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/cover_two.png'),
                            ),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 28.0),
                                  child: Text(
                                    snapshot.data!.namaLatin,
                                    style: kMediumTextStyle.copyWith(
                                        fontSize: 26, color: Colors.white),
                                  ),
                                ),
                                Text(
                                  'The Opening',
                                  style: kMediumTextStyle.copyWith(
                                      fontSize: 16, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      snapshot.data!.tempatTurun.toUpperCase(),
                                      style: kMediumTextStyle.copyWith(
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      '•',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      snapshot.data!.jumlahAyat.toString() +
                                          ' VERSES',
                                      style: kMediumTextStyle.copyWith(
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 30),
                        height: 400,
                        child: ListView.separated(
                            itemBuilder: ((context, index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  backgroundImage:
                                      AssetImage('assets/ayah.png'),
                                  child: Text(
                                    '${snapshot.data!.ayat[index].nomor}',
                                    style: kMediumTextStyle.copyWith(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ),
                                title: Text(
                                  snapshot.data!.ayat[index].ar,
                                  textAlign: TextAlign.right,
                                  style: kMediumTextStyle.copyWith(
                                      color: Colors.white, fontSize: 24),
                                ),
                                subtitle: Text(
                                  snapshot.data!.ayat[index].idn,
                                  style: kMediumTextStyle.copyWith(
                                      color: kGreyColor, fontSize: 16),
                                ),
                              );
                            }),
                            separatorBuilder: ((context, index) {
                              return Divider(
                                color: Colors.white,
                              );
                            }),
                            itemCount: snapshot.data!.ayat.length),
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

Future<Seasons> fetchDetailSurah(int nomor) async {
  String api = 'https://equran.id/api/surat/$nomor';
  final response = await http.get(
    Uri.parse(api),
  );

  if (response.statusCode == 200) {
    print(response.body);
    return Seasons.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load shows');
  }
}
