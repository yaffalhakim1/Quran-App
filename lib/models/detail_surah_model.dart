class Seasons {
  bool status;
  int nomor;
  String nama;
  String namaLatin;
  int jumlahAyat;
  String tempatTurun;
  String arti;
  String deskripsi;
  String audio;
  List<Ayat> ayat;

  Seasons({
    required this.status,
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audio,
    required this.ayat,
  });

  factory Seasons.fromJson(Map<String, dynamic> json) => Seasons(
        status: json['status'],
        nomor: json['nomor'],
        nama: json['nama'],
        namaLatin: json['nama_latin'],
        jumlahAyat: json['jumlah_ayat'],
        tempatTurun: json['tempat_turun'],
        arti: json['arti'],
        deskripsi: json['deskripsi'],
        audio: json['audio'],
        ayat: List<Ayat>.from(json['ayat'].map((x) => Ayat.fromJson(x))),
      );
}

class Ayat {
  Ayat({
    required this.id,
    required this.surah,
    required this.nomor,
    required this.ar,
    required this.tr,
    required this.idn,
  });

  int id;
  int surah;
  int nomor;
  String ar;
  String tr;
  String idn;

  factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
        id: json['id'],
        surah: json['surah'],
        nomor: json['nomor'],
        ar: json['ar'],
        tr: json['tr'],
        idn: json['idn'],
      );
}
