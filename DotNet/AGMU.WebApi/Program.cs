using Microsoft.EntityFrameworkCore;
using AGMU.WebApi.Data;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddDbContext<AgmuContext>(
            options => options
            .UseSqlServer(builder.Configuration["DbConnectionString"])
);
builder.Services.AddCors(options =>
{
  options.AddPolicy("all", policy =>
  {
    _ = policy
      .AllowAnyHeader()
      .AllowAnyMethod()
      .AllowAnyOrigin();
  });
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
  _ = app.UseSwagger();
  _ = app.UseSwaggerUI();
}

app.UseAuthorization();

app.MapControllers();
app.UseCors("all");

app.Run();
