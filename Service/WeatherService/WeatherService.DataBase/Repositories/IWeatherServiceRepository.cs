using System;

namespace WeatherService.DataBase.Repositories
{
	public interface IWeatherServiceRepository
	{
        Task<WeatherService> GetWeatherServiceByCoordinates(double latitude, double longitude);
        Task SaveWeatherForecast(WeatherService forecast);
    }
}

