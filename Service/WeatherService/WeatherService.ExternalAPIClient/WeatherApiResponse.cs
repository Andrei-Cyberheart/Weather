using System;
namespace WeatherService.ExternalAPIClient
{
    public class WeatherApiResponse
    {
        public double Lat { get; set; }
        public double Lon { get; set; }
        public string Name { get; set; }
        public long Dt { get; set; }
        public Main Main { get; set; }
        public List<Weather> Weather { get; set; }

        public WeatherService ToWeatherForecast()
        {
            return new WeatherService
            {
                Latitude = Lat,
                Longitude = Lon,
                Location = Name,
                Date = DateTimeOffset.FromUnixTimeSeconds(Dt).DateTime,
                Temperature = Main.Temp,
                Description = Weather?.FirstOrDefault()?.Description
            };
        }
    }
}

