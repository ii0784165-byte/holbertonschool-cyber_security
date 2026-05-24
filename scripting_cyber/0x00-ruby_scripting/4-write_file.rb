#!/bin/bash

require 'json'

def merge_json_files(file1_path, file2_path)
  # 1. Hər iki faylın mövcudluğunu yoxlayırıq və məzmununu oxuyuruq
  # Əgər hər hansı biri boşdursa və ya yoxdursa, boş massiv [] götürürük
  data1 = File.exist?(file1_path) ? JSON.parse(File.read(file1_path)) : []
  data2 = File.exist?(file2_path) ? JSON.parse(File.read(file2_path)) : []

  # Faylların daxilindəki JSON strukturu massiv (Array) olmalıdır.
  # Massivləri bir-birinə birləşdiririk (data1 elementlərini data2-nin sonuna əlavə edirik)
  merged_data = data2.concat(data1)

  # 2. Birləşmiş yeni massivi yenidən JSON stringinə çeviririk.
  # JSON.pretty_generate istifadə etmək JSON-un səliqəli (oxunqlu) yazılmasını təmin edir
  File.open(file2_path, 'w') do |f|
    f.write(JSON.pretty_generate(merged_data))
  end
end
