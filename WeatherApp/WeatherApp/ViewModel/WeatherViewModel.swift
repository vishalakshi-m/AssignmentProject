//ViewModel 
class weatherManager: ObservableObject {
	@published var currentWeatherData: Weather?

	private let weatherService: WeatherDataProtocol

    	init(weatherService: WeatherDataProtocol) {
        	self.weatherService = weatherService
    	}

    	func loadWeatherForecast(currentCity: String) {
		self.weatherService.fetchWeatherFor(currentLocation: currentCity) { result in
		switch result {
			case .success(let weatherData):
			if let data = weatherData.weather {
				self.currentWeatherData = data
			}
			case .failure(let error)
				debugPrint("Loading weather Forecast failed\(error.localizedDescription)")
		}
	    }
        }
}