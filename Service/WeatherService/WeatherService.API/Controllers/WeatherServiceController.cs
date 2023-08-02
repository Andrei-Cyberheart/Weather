using Microsoft.AspNetCore.Mvc;
using WeatherService.DataBase.Repositories;
using WeatherService.ExternalAPIClient.Clients;

namespace WeatherService.API.Controllers;

[ApiController]
[Route("api/weather")]
public class WeatherServiceController : ControllerBase
{
    private readonly IWeatherServiceRepository _repository;
    private readonly IWeatherApiClient _apiClient;

    public WeatherServiceController(IWeatherServiceRepository repository, IWeatherApiClient apiClient)
    {
        _repository = repository;
        _apiClient = apiClient;
    }

    [HttpGet]
    public async Task<ActionResult<WeatherServiceDto>> GetWeatherForecast(double latitude, double longitude)
    {
        // Check if data exists in the database
        var weatherData = await _repository.GetWeatherServiceByCoordinates(latitude, longitude);
        if (weatherData != null)
        {
            return Ok(weatherData.ToDto());
        }

        // Fetch data from the OpenWeatherMap API
        var apiResponse = await _apiClient.GetWeatherForecastByCoordinatesAsync(latitude, longitude);
        if (apiResponse == null)
        {
            return NotFound(); // or handle the error appropriately
        }

        // Save the API response to the database
        await _repository.SaveWeatherForecast(apiResponse);

        return Ok(apiResponse.ToDto());
    }
}

