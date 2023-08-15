class WeatherData {
  double? latitude;
  double? longitude;
  double? generationtimeMs;
  int? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  double? elevation;
  DailyUnits? dailyUnits;
  Daily? daily;

  WeatherData(
      {this.latitude,
      this.longitude,
      this.generationtimeMs,
      this.utcOffsetSeconds,
      this.timezone,
      this.timezoneAbbreviation,
      this.elevation,
      this.dailyUnits,
      this.daily});

  WeatherData.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    generationtimeMs = json['generationtime_ms'];
    utcOffsetSeconds = json['utc_offset_seconds'];
    timezone = json['timezone'];
    timezoneAbbreviation = json['timezone_abbreviation'];
    elevation = json['elevation'];
    dailyUnits = json['daily_units'] != null
        ? DailyUnits.fromJson(json['daily_units'])
        : null;
    daily = json['daily'] != null ? Daily.fromJson(json['daily']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['generationtime_ms'] = generationtimeMs;
    data['utc_offset_seconds'] = utcOffsetSeconds;
    data['timezone'] = timezone;
    data['timezone_abbreviation'] = timezoneAbbreviation;
    data['elevation'] = elevation;
    if (dailyUnits != null) {
      data['daily_units'] = dailyUnits!.toJson();
    }
    if (daily != null) {
      data['daily'] = daily!.toJson();
    }
    return data;
  }
}

class DailyUnits {
  String? time;
  String? temperature2mMax;
  String? temperature2mMin;
  String? sunrise;
  String? sunset;
  String? uvIndexMax;
  String? uvIndexClearSkyMax;
  String? precipitationSum;
  String? rainSum;
  String? showersSum;
  String? snowfallSum;
  String? precipitationHours;
  String? precipitationProbabilityMax;
  String? windspeed10mMax;
  String? winddirection10mDominant;

  DailyUnits(
      {this.time,
      this.temperature2mMax,
      this.temperature2mMin,
      this.sunrise,
      this.sunset,
      this.uvIndexMax,
      this.uvIndexClearSkyMax,
      this.precipitationSum,
      this.rainSum,
      this.showersSum,
      this.snowfallSum,
      this.precipitationHours,
      this.precipitationProbabilityMax,
      this.windspeed10mMax,
      this.winddirection10mDominant});

  DailyUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    temperature2mMax = json['temperature_2m_max'];
    temperature2mMin = json['temperature_2m_min'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    uvIndexMax = json['uv_index_max'];
    uvIndexClearSkyMax = json['uv_index_clear_sky_max'];
    precipitationSum = json['precipitation_sum'];
    rainSum = json['rain_sum'];
    showersSum = json['showers_sum'];
    snowfallSum = json['snowfall_sum'];
    precipitationHours = json['precipitation_hours'];
    precipitationProbabilityMax = json['precipitation_probability_max'];
    windspeed10mMax = json['windspeed_10m_max'];
    winddirection10mDominant = json['winddirection_10m_dominant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['temperature_2m_max'] = temperature2mMax;
    data['temperature_2m_min'] = temperature2mMin;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['uv_index_max'] = uvIndexMax;
    data['uv_index_clear_sky_max'] = uvIndexClearSkyMax;
    data['precipitation_sum'] = precipitationSum;
    data['rain_sum'] = rainSum;
    data['showers_sum'] = showersSum;
    data['snowfall_sum'] = snowfallSum;
    data['precipitation_hours'] = precipitationHours;
    data['precipitation_probability_max'] = precipitationProbabilityMax;
    data['windspeed_10m_max'] = windspeed10mMax;
    data['winddirection_10m_dominant'] = winddirection10mDominant;
    return data;
  }
}

class Daily {
  List<double>? time;
  List<double>? temperature2mMax;
  List<double>? temperature2mMin;
  List<double>? sunrise;
  List<double>? sunset;
  List<double>? uvIndexMax;
  List<double>? uvIndexClearSkyMax;
  List<double>? precipitationSum;
  List<double>? rainSum;
  List<double>? showersSum;
  List<double>? snowfallSum;
  List<double>? precipitationHours;
  List<double>? precipitationProbabilityMax;
  List<double>? windspeed10mMax;
  List<double>? winddirection10mDominant;

  Daily(
      {this.time,
      this.temperature2mMax,
      this.temperature2mMin,
      this.sunrise,
      this.sunset,
      this.uvIndexMax,
      this.uvIndexClearSkyMax,
      this.precipitationSum,
      this.rainSum,
      this.showersSum,
      this.snowfallSum,
      this.precipitationHours,
      this.precipitationProbabilityMax,
      this.windspeed10mMax,
      this.winddirection10mDominant});

  Daily.fromJson(Map<String, dynamic> json) {
    time = json['time'].cast<double>();
    temperature2mMax = json['temperature_2m_max'].cast<double>();
    temperature2mMin = json['temperature_2m_min'].cast<double>();
    sunrise = json['sunrise'].cast<double>();
    sunset = json['sunset'].cast<double>();
    uvIndexMax = json['uv_index_max'].cast<double>();
    uvIndexClearSkyMax = json['uv_index_clear_sky_max'].cast<double>();
    precipitationSum = json['precipitation_sum'].cast<double>();
    rainSum = json['rain_sum'].cast<double>();
    showersSum = json['showers_sum'].cast<double>();
    snowfallSum = json['snowfall_sum'].cast<double>();
    precipitationHours = json['precipitation_hours'].cast<double>();
    precipitationProbabilityMax =
        json['precipitation_probability_max'].cast<double>();
    windspeed10mMax = json['windspeed_10m_max'].cast<double>();
    winddirection10mDominant =
        json['winddirection_10m_dominant'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['temperature_2m_max'] = temperature2mMax;
    data['temperature_2m_min'] = temperature2mMin;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['uv_index_max'] = uvIndexMax;
    data['uv_index_clear_sky_max'] = uvIndexClearSkyMax;
    data['precipitation_sum'] = precipitationSum;
    data['rain_sum'] = rainSum;
    data['showers_sum'] = showersSum;
    data['snowfall_sum'] = snowfallSum;
    data['precipitation_hours'] = precipitationHours;
    data['precipitation_probability_max'] = precipitationProbabilityMax;
    data['windspeed_10m_max'] = windspeed10mMax;
    data['winddirection_10m_dominant'] = winddirection10mDominant;
    return data;
  }
}
