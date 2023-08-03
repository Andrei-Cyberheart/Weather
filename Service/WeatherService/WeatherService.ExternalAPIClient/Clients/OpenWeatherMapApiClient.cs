using System;
namespace WeatherService.ExternalAPIClient.Clients
{
    public class OpenWeatherMapApiClient : IWeatherApiClient
    {
        private readonly HttpClient _httpClient;
        private readonly string _apiKey = "YOUR_OPENWEATHERMAP_API_KEY";

        public OpenWeatherMapApiClient()
        {
            _httpClient = new HttpClient();
            _httpClient.BaseAddress = new Uri("https://api.openweathermap.org/data/2.5/");
        }

        public async Task<WeatherService> GetWeatherForecastByCoordinatesAsync(double latitude, double longitude)
        {
            var response = await _httpClient.GetAsync($"weather?lat={latitude}&lon={longitude}&appid={_apiKey}");
            if (!response.IsSuccessStatusCode)
            {
                return null; // or handle the error appropriately
            }

            var content = await response.Content.ReadAsStringAsync();
            var apiResponse = JsonConvert.DeserializeObject<WeatherApiResponse>(content);

            return apiResponse.ToWeatherForecast();
        }
    }
}

