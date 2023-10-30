class Conatants{
  static const apiKey='15f958d72a82ae04f2b70568b2a8e082';
  String chooseImageBasedOnWeather(String? weatherCondition) {
    if (weatherCondition == 'clouds') {
      return 'assets/images/cloudy.jpg';
    } else if (weatherCondition == 'rain') {
      return 'assets/images/rainy.jpg';
    } else {
      return 'assets/images/default.jpg';
    }
  }

}