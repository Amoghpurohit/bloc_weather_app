// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';


// class WeatherModel {
//   final double temp;
//   final int humidity;
//   final String sky;
//   final int pressure;
//   final double windSpeed;

//   WeatherModel({
//     required this.temp,
//     required this.humidity,
//     required this.sky,
//     required this.pressure,
//     required this.windSpeed,
//   });

//   WeatherModel copyWith({
//     double? temp,
//     int? humidity,
//     String? sky,
//     int? pressure,
//     double? windSpeed,
//   }) {
//     return WeatherModel(
//       temp: temp ?? this.temp,
//       humidity: humidity ?? this.humidity,
//       sky: sky ?? this.sky,
//       pressure: pressure ?? this.pressure,
//       windSpeed: windSpeed ?? this.windSpeed,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'temp': temp,
//       'humidity': humidity,
//       'sky': sky,
//       'pressure': pressure,
//       'windSpeed': windSpeed,
//     };
//   }

//   factory WeatherModel.fromMap(Map<String, dynamic> map) {

//     final data = map['list'][0];

//     return WeatherModel(
//       temp: data['main']['temp'] ?? 0.0,
//       humidity: data['main']['humidity'] ?? 0,
//       sky: data['weather'][0]['main'] ?? '',
//       pressure:  data['main']['pressure'] ?? 0,
//       windSpeed: data['wind']['speed'] ?? 0.0,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory WeatherModel.fromJson(String source) => WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'WeatherModel(temp: $temp, humidity: $humidity, sky: $sky, pressure: $pressure, windSpeed: $windSpeed)';
//   }

//   @override
//   bool operator ==(covariant WeatherModel other) {
//     if (identical(this, other)) return true;
  
//     return 
//       other.temp == temp &&
//       other.humidity == humidity &&
//       other.sky == sky &&
//       other.pressure == pressure &&
//       other.windSpeed == windSpeed;
//   }

//   @override
//   int get hashCode {
//     return temp.hashCode ^
//       humidity.hashCode ^
//       sky.hashCode ^
//       pressure.hashCode ^
//       windSpeed.hashCode;
//   }
// }
