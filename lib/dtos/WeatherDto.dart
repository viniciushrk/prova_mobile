// ignore_for_file: empty_constructor_bodies
// ignore_for_file: file_names

class WeatherDto {
  final int id;
  final String name;
  final double temp;
  final double temp_min;
  final double temp_max;

  WeatherDto({
    required this.id,
    required this.name,
    required this.temp,
    required this.temp_min,
    required this.temp_max,
  });

  factory WeatherDto.fromJson(Map<String, dynamic> json)   {
    var weather = WeatherDto(
        id: json["id"],
        name: json["name"],
        temp: json["main"]["temp"] -273.15,
        temp_min: json["main"]["temp_min"] -273.15,
        temp_max: json["main"]["temp_max"] -273.15
    );

    return weather;
  }
}