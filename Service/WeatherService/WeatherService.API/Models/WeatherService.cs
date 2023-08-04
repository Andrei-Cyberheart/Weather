using System;
namespace WeatherService.API.Models
{
    public class WeatherService
    {
        public int Id { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }
        public string Location { get; set; }
        public DateTime Date { get; set; }
        public double Temperature { get; set; }
        public string Description { get; set; }
    }
}

