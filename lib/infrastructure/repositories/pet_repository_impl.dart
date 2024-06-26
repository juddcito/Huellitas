
import 'package:flutter_huellitas_lm/domain/datasources/pet_datasource.dart';
import 'package:flutter_huellitas_lm/domain/entities/pet.dart';
import 'package:flutter_huellitas_lm/domain/repositories/pets_repository.dart';

class PetRepositoryImpl extends PetRepository {

  final PetDatasource datasource;

  PetRepositoryImpl(this.datasource);

  @override
  Future<List<Pet>> getPets() {
    return datasource.getPets();
  }

}