REM "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\Common7\Tools\VsDevCmd.bat"
REM cd /d E:\Repos\Andreas0xffff\XamarinCommunityToolkit

msbuild.exe samples/XCT.Sample.sln /t:Clean

msbuild.exe src/CommunityToolkit/Xamarin.CommunityToolkit/Xamarin.CommunityToolkit.csproj /p:Configuration=Release /restore /t:Build /p:ContinuousIntegrationBuild=true /p:Deterministic=false
msbuild.exe src/CommunityToolkit/Xamarin.CommunityToolkit/Xamarin.CommunityToolkit.csproj /t:Pack /p:PackageVersion=9.0.0 /p:PackageOutputPath=nuget

msbuild.exe src/Markup/Xamarin.CommunityToolkit.Markup/Xamarin.CommunityToolkit.Markup.csproj /p:Configuration=Release /restore /t:Build /p:ContinuousIntegrationBuild=true /p:Deterministic=false
msbuild.exe src/Markup/Xamarin.CommunityToolkit.Markup/Xamarin.CommunityToolkit.Markup.csproj /t:Pack /p:PackageVersion=9.0.0 /p:PackageOutputPath=nuget

REM dotnet test src/Markup/Xamarin.CommunityToolkit.Markup.UnitTests/Xamarin.CommunityToolkit.Markup.UnitTests.csproj -c Release --collect "Code coverage" -p:BuildInParallel=false
REM dotnet test src/CommunityToolkit/Xamarin.CommunityToolkit.UnitTests/Xamarin.CommunityToolkit.UnitTests.csproj -c Release --collect "Code coverage" -p:BuildInParallel=false

copy .\src\CommunityToolkit\Xamarin.CommunityToolkit\nuget\Xamarin.CommunityToolkit.*.nupkg .\nuget\
copy .\src\Markup\Xamarin.CommunityToolkit.Markup\nuget\Xamarin.CommunityToolkit.Markup.*.nupkg .\nuget\
