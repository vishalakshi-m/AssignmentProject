protocol WeatherDataProtocol {
	func fetchWeatherFor(currentLocation: String, completionHandler: @escaping (Result<WeatherForecast, Error>)) -> Void)
}

class WeatherDataService: WeatherDataProtocol {
	func fetchWeatherFor(currentLocation: String, completionHandler: @escaping (Result<WeatherForecast, Error>)) {
		let headers = ["access_key": "a94d411b25924bfe26df00a148b0fb35"]
		APIClient.shared.request(url: APIEndpoints.baseURL.getCurrent(location: currentLocation), headers: headers) { result: Result<WeatherForecast, Error>) in
		switch result {
			case .success(let weatherInfo):
				completionHandler(.success(weatherInfo))
			case .failure(let error):
				completionHandler(.failure(error))
		}
  	}
}