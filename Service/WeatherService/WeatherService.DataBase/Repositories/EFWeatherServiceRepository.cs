using System;
namespace WeatherService.DataBase.Repositories
{
    public class EFWeatherForecastRepository : IWeatherServiceRepository
    {
        private readonly DbContext _dbContext;

        public EFWeatherForecastRepository(DbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<WeatherService> GetWeatherForecastByCoordinates(double latitude, double longitude)
        {
            return await _dbContext.WeatherForecasts
                .FirstOrDefaultAsync(wf => wf.Latitude == latitude && wf.Longitude == longitude);
        }

        public async Task SaveWeatherForecast(WeatherService forecast)
        {
            _dbContext.WeatherForecasts.Add(forecast);
            await _dbContext.SaveChangesAsync();
        }
    }
}

