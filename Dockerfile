# build stage
FROM microsoft/aspnetcore-build:2 AS build-env

WORKDIR /app

# restore
COPY api/api.csproj ./api/
RUN dotnet restore api/api.csproj

COPY tests/tests.csproj ./tests/
RUN dotnet restore tests/tests.csproj

# copy src
COPY . .

# test
ENV TEAMCITY_PROJECT_NAME=fake
RUN dotnet test tests/tests.csproj

# publish
RUN dotnet publish api/api.csproj -c Release -o /publish

# runtime stage
FROM microsoft/aspnetcore:2.0.3
WORKDIR /publish
COPY --from=build-env /publish /publish
ENTRYPOINT [ "dotnet", "api.dll" ]