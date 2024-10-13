// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../components/custom_navbar.dart';
import '../../components/custom_text_form_field.dart';
import '../../constants/apis.dart';
import '../../models/city.dart';
import '../../utils/database_manager.dart';
import '../../utils/size_config.dart';
import 'components/city_card.dart';

class CityDialog extends StatefulWidget {
  const CityDialog({
    super.key,
  });

  @override
  State<CityDialog> createState() => _CityDialogState();
}

class _CityDialogState extends State<CityDialog> {
  List<CityModel> cities = [];
  List<CityModel> selectedCities = [];
  String? search;
  // List<CityModel> searchCities = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Ajout d'une ville",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.5,
                ),
              ),
              const HorizontalSpacing(),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.close,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
          const VerticalSpacing(of: 16),
          CustomTextFormField(
            hintText: 'Recherche',
            fillColor: Colors.white,
            onChanged: (value) {
              search = value;
              if (search?.isNotEmpty == true) {
                searchCities();
              }
              return null;
            },
            // borderColor: Colors,
          ),
          const VerticalSpacing(of: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: cities.isEmpty
                    ? [
                        const Center(
                            child: Text("Aucun résultat n'a été trouvé"))
                      ]
                    : cities
                        .map(
                          (e) => CityCard(
                            city: e,
                            isSelected:
                                selectedCities.map((_) => _.id).contains(e.id),
                            select: () {
                              selectCity(e);
                            },
                          ),
                        )
                        .toList(),
              ),
            ),
          ),
          const VerticalSpacing(of: 16),
          CustomNavbar(
            flex: 3,
            accept: confirm,
          ),
        ],
      ),
    );
  }

  void confirm() async {
    String? error;
    List<bool> inserts = [];
    try {
      for (CityModel city in selectedCities) {
        bool exist = (await dbManager.getCities(
          name: city.name,
          country: city.country,
          countryCode: city.countryCode,
          longitude: city.longitude,
          latitude: city.latitude,
        ))
            .isNotEmpty;

        if (!exist) {
          inserts.add(await dbManager.insertCity(city));
        }
      }
      if (!inserts.contains(false)) {
        Navigator.pop(context, true);
      } else {
        error = "Une erreur est survenue lors de l'ajout des villes";
      }
    } catch (e) {
      error = "$e";
    }
    if (error != null) {
      print("ERROR : $error");
    }
    // Navigator.pop(context, selectedCities);
  }

  void selectCity(CityModel city) {
    if (selectedCities.map((e) => e.id).contains(city.id)) {
      selectedCities.removeWhere((element) => element.id == city.id);
    } else {
      selectedCities.add(city);
    }
    setState(() {});
  }

  Future searchCities() async {
    try {
      print("SEARCH CITIES");
      cities = await cityApi.getCities(search: search!);
      print(cities.length);
    } catch (e) {
      print("ERREUR DANS LE CHARGEMENT DES DONNÉES");
    }
    if (mounted) {
      setState(() {});
    }
  }
}
