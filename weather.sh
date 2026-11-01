#!/bin/bash
# Температура и влажность на сегодня в городе, переданном первым параметром
# Пример: ./weather.sh Perm

city=${1:-Perm}

data=$(curl -s "wttr.in/$city?format=j2")
temp=$(echo "$data" | jq -r '.current_condition[0].temp_C')
humidity=$(echo "$data" | jq -r '.current_condition[0].humidity')

echo "<meta charset=\"utf-8\">"
echo "<h1>Погода: $city</h1>"
echo "<p>Температура: $temp &deg;C</p>"
echo "<p>Влажность: $humidity %</p>"
echo "<p>Обновлено: $(date '+%d.%m.%Y %H:%M')</p>"
