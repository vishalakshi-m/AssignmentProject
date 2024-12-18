// MARK: - WeatherForecast
struct WeatherForecast: Codable {
    let location: Location?
    let weather: Weather?
}

// MARK: - Location
struct Location: Codable {
    let name, country, region, latitude: String
    let longitude: String
    enum CodingKeys: String, CodingKey {
	case latitude = "lat"
	case longitude = "lon"
    }
}

// MARK: - Weather
struct Weather: Codable {
    let temperature: Int?
    let weatherIcons: [String]?
    let weatherDescription: String?
    let humidity: Int?

    enum CodingKeys: String, CodingKey {
        case temperature
        case weatherIcons = "weather_icons"
        case weatherDescription = "weather_description"
        case humidity
    }
}
