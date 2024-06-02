import 'package:acres/model/property.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PropertyNotifier extends StateNotifier<List<Property>> {
  PropertyNotifier() : super([]);

  List<Property> fetchProperties(data) {
    state = data;

    return data;
  }
}

final propertyProvider =
    StateNotifierProvider<PropertyNotifier, List<Property>>(
        (ref) => PropertyNotifier());
