class User {
  int? id;
  String? namaLengkap;
  String? username;
  String? email;
  String? tempatLahir;
  String? tanggalLahir;
  String? jenisKelamin;
  String? noHandphone;
  String? nomorIndukKependudukan;
  String? pekerjaan;
  String? alamat;
  String? rt;
  String? rw;
  String? provinsi;
  String? kotaKabupaten;
  String? kecamatan;
  String? kelurahanDesa;
  String? role;
  String? password;

  User(
      {this.id,
      this.namaLengkap,
      this.username,
      this.email,
      this.tempatLahir,
      this.tanggalLahir,
      this.jenisKelamin,
      this.noHandphone,
      this.nomorIndukKependudukan,
      this.pekerjaan,
      this.alamat,
      this.rt,
      this.rw,
      this.provinsi,
      this.kotaKabupaten,
      this.kecamatan,
      this.kelurahanDesa,
      this.role,
      this.password});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaLengkap = json['nama_lengkap'];
    username = json['username'];
    email = json['email'];
    tempatLahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
    jenisKelamin = json['jenis_kelamin'];
    noHandphone = json['no_handphone'];
    nomorIndukKependudukan = json['nomor_induk_kependudukan'];
    pekerjaan = json['pekerjaan'];
    alamat = json['alamat'];
    rt = json['rt'];
    rw = json['rw'];
    provinsi = json['provinsi'];
    kotaKabupaten = json['kota_kabupaten'];
    kecamatan = json['kecamatan'];
    kelurahanDesa = json['kelurahan_desa'];
    role = json['role'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nama_lengkap'] = namaLengkap;
    data['username'] = username;
    data['email'] = email;
    data['tempat_lahir'] = tempatLahir;
    data['tanggal_lahir'] = tanggalLahir;
    data['jenis_kelamin'] = jenisKelamin;
    data['no_handphone'] = noHandphone;
    data['nomor_induk_kependudukan'] = nomorIndukKependudukan;
    data['pekerjaan'] = pekerjaan;
    data['alamat'] = alamat;
    data['rt'] = rt;
    data['rw'] = rw;
    data['provinsi'] = provinsi;
    data['kota_kabupaten'] = kotaKabupaten;
    data['kecamatan'] = kecamatan;
    data['kelurahan_desa'] = kelurahanDesa;
    data['role'] = role;
    data['password'] = password;
    return data;
  }
}
