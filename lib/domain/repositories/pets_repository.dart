

import 'package:flutter_huellitas_lm/domain/entities/pet.dart';


abstract class PetRepository {
  Future<List<Pet>> getPets();

}