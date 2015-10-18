$ ./football.sh football.dat
Aston_Villa

$ ./weather.sh weather.dat 
14 2

$ ./football_weather.sh -f football.dat 
Aston_Villa

$ ./football_weather.sh -w weather.dat 
14 2

$ ./football_weather.sh -w weather.dat234
weather.dat234 File not found!

$ ./football_weather.sh -234]
./football_weather.sh: illegal option -- 2
Invalid option: -
Valid options:
	-w file   : weather  file parsing
	-f file   : football file parsing

