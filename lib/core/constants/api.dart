class Api {
  static String weather({
    required String latitude,
    required String longitude,
  }) {
    return "https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current_weather=true&forecast_days=1&hourly=temperature_2m,relativehumidity_2m,windspeed_10m,precipitation_probability";
  }
}
