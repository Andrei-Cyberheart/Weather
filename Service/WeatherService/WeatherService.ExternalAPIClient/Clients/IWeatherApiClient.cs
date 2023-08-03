using System;
namespace WeatherService.ExternalAPIClient.Clients
{
	public interface IWeatherApiClient
	{
        Task<WeatherService> GetWeatherForecastByCoordinatesAsync(double latitude, double longitude);
    }
}