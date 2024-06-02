import 'package:flutter/material.dart';

class PropertiesCard extends StatelessWidget {
  const PropertiesCard({
    super.key,
    required this.bedrooms,
    required this.location,
    required this.price,
    required this.society,
    required this.constructionStatus,
  });

  final String bedrooms;
  final String location;
  final String price;
  final String society;
  final String constructionStatus;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      shadowColor: Theme.of(context).colorScheme.primary,
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            '$bedrooms BHK at $location',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 12,
          ),
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  "https://images.unsplash.com/photo-1560518883-ce09059eeffa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1973&q=80",
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: Text(price)))
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Society - $society',
            style: const TextStyle(fontSize: 18),
          ),
          Text(
            'Status - $constructionStatus',
            style: const TextStyle(fontSize: 18),
          )
        ]),
      ),
    );
  }
}
