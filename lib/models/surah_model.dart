class SurahModel {
  final int number;
  final String name;
  final String englishName;
  final String revelationType;
  final int numberOfAyahs;

  SurahModel({
    required this.number,
    required this.name,
    required this.englishName,
    required this.revelationType,
    required this.numberOfAyahs,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return SurahModel(
      number: json['nomor'],
      name: json['nama'],
      englishName: json['nama_latin'],
      revelationType: json['tempat_turun'],
      numberOfAyahs: json['jumlah_ayat'],
    );
  }
}
