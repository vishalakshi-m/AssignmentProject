import SwiftUI

struct WeatherView: View {
    let weatherAppService = WeatherDataService()
    @ObservedObject var viewModel = weatherManager((weatherService: weatherAppService)
    @State var cityName: String = ""

    var body: some View {
            VStack(spacing: 20) {
                TextField("Enter city name", text: $cityName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Button(action: {
                    viewModel.loadWeatherForecast(for: cityName)
                }) {
                    Text("Fetch Weather")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal)

                // Display Weather Info 
                if let weatherInfo = viewModel.currentWeatherData {
                    VStack(spacing: 10) {
                        Text(cityName)
                            .font(.largeTitle)
                            .bold()

                        Text(weatherInfo.temperature ?? "")
                            .font(.system(size: 40))
                            .bold()

                        Text(weatherInfo.description ?? "")
                            .font(.system(size: 20))

                        Text(weatherInfo.humidity ?? "")
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                    }
                    .padding()
                }
                Spacer()
            }
            .padding()
    }
}
