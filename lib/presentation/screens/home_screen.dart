

import 'dart:convert';
import 'dart:typed_data';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_huellitas_lm/domain/entities/pet.dart';
import 'package:flutter_huellitas_lm/presentation/providers/pet_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends ConsumerStatefulWidget {
  
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  void initState() {
    super.initState();
    ref.read( petsProvider.notifier ).loadPets();
  }  

  @override
  Widget build(BuildContext context) {

    final pets = ref.watch(petsProvider);    

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        title: const Icon(Icons.pets_rounded, size: 38, color : Colors.brown),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: pets.length,
                itemBuilder: (context, index) {
                  final pet = pets[index];
                  return FadeInRight(
                    duration: const Duration(seconds: 1),
                    child: MyPetTile(pet: pet)
                  );
                }
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown,
        child: Icon(Icons.refresh, color: Colors.white),
        onPressed: () {
          ref.read(petsProvider.notifier).loadPets();
        },
      ),
    );
  }
}

class MyPetTile extends StatelessWidget {

  final Pet pet;

  const MyPetTile({
    super.key,
    required this.pet,
  });  

    
      

  @override
  Widget build(BuildContext context) {

    Uint8List photoBytes = base64Decode(pet.photo);

    
    return InkWell(
      onTap: () async {
        Uri googleURL = Uri.parse('https://www.google.com/maps/search/?api=1&query=25.8146408,-108.9798737');
        await canLaunchUrl(googleURL)
          ? await launchUrl(googleURL)
          : throw 'No se pudo abrir Maps';
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 2)
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.memory(
                photoBytes,
                width: double.infinity,
                height: 250,
                fit: BoxFit.fill,              
              ),
            ),
            const SizedBox(height: 10),
            Text(
              pet.fecha.substring(0, 10),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Hora: ${pet.hora}',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}