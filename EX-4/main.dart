import 'package:flutter/material.dart';

enum WeatherType {
  sunny(
    iconPath: 'lib/assets/sunny.png',
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFFE57B95), Color(0xFFD96B85)],
    ),
  ),
  cloudy(
    iconPath: 'lib/assets/cloudy.png',
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFFB47FF5), Color(0xFF9D6FE6)],
    ),
  ),
  sunnyCloudy(
    iconPath: 'lib/assets/sunnyCloudy.png',
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF6FD5C5), Color(0xFF5BC4B4)],
    ),
  ),
  veryCloudy(
    iconPath: 'lib/assets/veryCloudy.png',
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFFE5A97B), Color(0xFFD99A6B)],
    ),
  );

  const WeatherType({required this.iconPath, required this.gradient});

  final String iconPath;
  final LinearGradient gradient;
}

enum CityWeather {
  phnomPenh(
    cityName: 'Phnom Penh',
    minTemp: 10.0,
    maxTemp: 30.0,
    currentTemp: 12.2,
    weatherType: WeatherType.cloudy,
  ),
  paris(
    cityName: 'Paris',
    minTemp: 10.0,
    maxTemp: 40.0,
    currentTemp: 22.2,
    weatherType: WeatherType.sunnyCloudy,
  ),
  roma(
    cityName: 'Rome',
    minTemp: 10.0,
    maxTemp: 40.0,
    currentTemp: 45.2,
    weatherType: WeatherType.sunny,
  ),
  toulouse(
    cityName: 'Toulouse',
    minTemp: 10.0,
    maxTemp: 40.0,
    currentTemp: 45.2,
    weatherType: WeatherType.veryCloudy,
  );

  const CityWeather({
    required this.cityName,
    required this.minTemp,
    required this.maxTemp,
    required this.currentTemp,
    required this.weatherType,
  });

  final String cityName;
  final double minTemp;
  final double maxTemp;
  final double currentTemp;
  final WeatherType weatherType;
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: Text('Weather Forecast'),
        ),
        endDrawer: Drawer(),
        body: Container(
          color: Colors.grey[100],
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              WeatherCard(weather: CityWeather.phnomPenh),
              const SizedBox(height: 16.0),
              WeatherCard(weather: CityWeather.paris),
              const SizedBox(height: 16.0),
              WeatherCard(weather: CityWeather.roma),
              const SizedBox(height: 16.0),
              WeatherCard(weather: CityWeather.toulouse),
            ],
          ),
        ),
      ),
    ),
  );
}

class WeatherCard extends StatelessWidget {
  final CityWeather weather;

  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 8.0,
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: weather.weatherType.gradient,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Positioned(
                right: -40.0,
                bottom: -40.0,
                child: Container(
                  width: 180.0,
                  height: 180.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 40.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.white.withValues(alpha: 0.3),
                      backgroundImage: AssetImage(weather.weatherType.iconPath),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            weather.cityName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            'Min ${weather.minTemp}°C',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 14.0,
                            ),
                          ),
                          Text(
                            'Max ${weather.maxTemp}°C',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '${weather.currentTemp}°C',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
