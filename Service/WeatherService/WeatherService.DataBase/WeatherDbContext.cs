using System;
using Microsoft.EntityFrameworkCore;

namespace WeatherService.DataBase
{
    public class WeatherDbContext : DbContext
    {
        public WeatherDbContext(DbContextOptions<WeatherDbContext> options) : base(options) { }

        public DbSet<WeatherService> WeatherForecasts { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Configure entity properties, relationships, etc. if needed
            // For example, you might want to set a primary key for the WeatherForecast entity.
        }
    }
}

