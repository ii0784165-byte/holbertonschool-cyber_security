#!/bin/bash
#Bu skript auth.log faylını analiz edərək ən çox istifadə olunan xidmətləri tapır
#Hər sətirdə xidmət adının olduğu hissəni kəsir (adətən 5-ci sütun) ve  Əlifba sırası ilə düzür, sayır və ən çox təkrarlananları göstərir
grep "sshd" "auth.log" | awk '{print $5}' | cut -d'[' -f1 | uniq -c | sort -nr
