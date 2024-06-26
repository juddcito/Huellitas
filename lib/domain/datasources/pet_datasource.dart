

import 'package:flutter_huellitas_lm/domain/entities/pet.dart';

abstract class PetDatasource {
  Future<List<Pet>> getPets();
}