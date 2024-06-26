

import 'package:dio/dio.dart';
import 'package:flutter_huellitas_lm/domain/datasources/pet_datasource.dart';
import 'package:flutter_huellitas_lm/domain/entities/pet.dart';

class PetDatasourceImpl extends PetDatasource {

  final dio = Dio(BaseOptions(
    baseUrl: 'http://192.168.0.143:8000/get_photos/'
  ));
  
  @override
  Future<List<Pet>> getPets() async {

    final response = await dio.get('');
    List<dynamic> data = response.data;

    List<Pet> petsMapeados = data.map((pet) {
      return Pet.fromJson(pet);
    }).toList();

    return petsMapeados;

  }     

}