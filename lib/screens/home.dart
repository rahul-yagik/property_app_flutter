import 'dart:convert';

import 'package:acres/components/home_header.dart';
import 'package:acres/components/properties_card.dart';
import 'package:acres/model/property.dart';
import 'package:acres/provider/properties_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  Future<List<Property>> fetchProperties() async {
    final url = Uri.parse('http://172.16.73.20:5000/api/v1/properties');

    final response = await http.get(url);

    List<Property> data = json.decode(response.body);

    ref.read(propertyProvider.notifier).fetchProperties(data);
    return data;
  }

  @override
  void initState() {
    super.initState();

    fetchProperties();
  }

  @override
  Widget build(BuildContext context) {
    List<Property> properties = ref.watch(propertyProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        child: Column(
          children: [
            const HomeHeader(),
            Expanded(
              child: ListView.builder(
                  itemCount: properties.length,
                  itemBuilder: (BuildContext build, int index) {
                    return PropertiesCard(
                      bedrooms: properties[index].bedrooms,
                      location: properties[index].location,
                      price: properties[index].price,
                      society: properties[index].society,
                      constructionStatus: properties[index].constructionStatus,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
