

import 'package:flutter_huellitas_lm/domain/entities/pet.dart';
import 'package:flutter_huellitas_lm/presentation/providers/pet_repository_provider.dart';
import 'package:riverpod/riverpod.dart';

final petsProvider = StateNotifierProvider<PetsNotifier, List<Pet>>((ref) {
  return PetsNotifier(
    fetchPets: ref.watch(petRepositoryProvider).getPets
  );
});

typedef PetCallback = Future<List<Pet>> Function();

class PetsNotifier extends StateNotifier<List<Pet>> {

  PetCallback fetchPets;

  PetsNotifier({
    required this.fetchPets,
  }): super([]);

  Future<void> loadPets() async {

    final List<Pet> pets = await fetchPets();
    pets.sort((a, b) => b.id.compareTo(a.id));
    state = pets;

  }

}