
import 'package:flutter_huellitas_lm/infrastructure/datasources/pet_datasource_impl.dart';
import 'package:flutter_huellitas_lm/infrastructure/repositories/pet_repository_impl.dart';
import 'package:riverpod/riverpod.dart';

final petRepositoryProvider = Provider((ref) {
  return PetRepositoryImpl(PetDatasourceImpl());
});