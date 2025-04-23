# .NET 8.0 ASP.NET Core image'ını kullanarak çalışma ortamını oluşturuyoruz
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80

# .NET 8.0 SDK image'ını kullanarak uygulamanın derleme aşaması için ortamı oluşturuyoruz
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["ResumeSite/ResumeSite.csproj", "ResumeSite/"]
RUN dotnet restore "ResumeSite/ResumeSite.csproj"
COPY . .
WORKDIR "/src/ResumeSite"
RUN dotnet build "ResumeSite.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "ResumeSite.csproj" -c Release -o /app/publish

# Son aşamada uygulamayı çalıştırmak için uygun ortamı oluşturuyoruz
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "ResumeSite.dll"]
