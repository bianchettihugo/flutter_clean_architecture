import 'package:flutter_clean_architecture/modules/location/data/models/location_model.dart';
import 'package:flutter_clean_architecture/modules/location/domain/entities/location_entity.dart';
import 'package:flutter_clean_architecture/modules/weather/data/models/weather_model.dart';
import 'package:flutter_clean_architecture/modules/weather/domain/entities/weather_entity.dart';

final humidity = <double>[
  70,
  73,
  74,
  70,
  70,
  75,
  79,
  85,
  85,
  80,
  71,
  65,
  61,
  62,
  57,
  52,
  53,
  63,
  76,
  81,
  80,
  75,
  82,
  84
];

final rain = <double>[
  0,
  3,
  7,
  10,
  16,
  23,
  29,
  37,
  44,
  52,
  63,
  73,
  84,
  85,
  86,
  87,
  83,
  78,
  74,
  56,
  37,
  19,
  19,
  19
];

const weatherModel = WeatherModel(
  temperature: 10,
  windSpeed: 10,
  humidity: 10,
  rain: 10,
);

final weatherEntity = WeatherEntity(
  temperature: 10,
  windSpeed: 10,
  humidity: 10,
  rain: 10,
);

const locationModel = LocationModel(
  latitude: 10,
  longitude: 10,
);

final locationEnity = LocationEntity(
  latitude: 10,
  longitude: 10,
);
