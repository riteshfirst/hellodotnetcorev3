FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80

ENV ASPNETCORE_URLS=http://+:80
#ENV ConnectionStrings__default="Server=192.168.0.24;Database=Employee;MultipleActiveResultSets=true;User ID=ritesh;Password=ritesh"
ENV ConnectionStrings__default="Server=tcp:hellodotnetcore.database.windows.net,1433;Initial Catalog=hellodotnetcore;Persist Security Info=False;User ID=riteshtest;Password=admin!234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["hellodotnetcore.csproj", "./"]
RUN dotnet restore "hellodotnetcore.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "hellodotnetcore.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "hellodotnetcore.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "hellodotnetcore.dll"]
