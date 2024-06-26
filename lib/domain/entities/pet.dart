

class Pet {

  final int id;
  final String fecha;
  final String hora;
  final String photo;

  Pet({
    required this.id,
    required this.fecha,
    required this.hora,
    required this.photo
  });

  static Pet fromJson(Map<String, dynamic> json) {
    return Pet(
      id: json['id'],
      fecha: json['fecha'],
      hora: json['hora'],
      photo: json['photo'],
    );
  }

}