#!/bin/bash

require 'open-uri'
require 'uri'
require 'fileutils'

# 1. Arqumentlərin sayını yoxlayırıq. 2 dənə deyilsə, istifadə qaydasını göstəririk.
if ARGV.length != 2
  puts "Usage: 9-download_file.rb URL LOCAL_FILE_PATH"
  exit
end

url = ARGV[0]
local_path = ARGV[1]

# 2. Yükləmə mesajını nümunədəki formatda ekrana çıxarırıq
puts "Downloading file from #{url}..."

begin
  # 3. open-uri vasitəsilə URL-i açırıq və kontenti oxuyuruq
  # URI.open köhnə Ruby versiyalarında Kernel.open kimidir və təhlükəsiz şəkildə linki açır
  URI.open(url) do |remote_file|
    # Faylın qeyd olunacağı qovluğun mövcudluğunu təmin edirik (məs: ./ olduqda)
    dir = File.dirname(local_path)
    FileUtils.mkdir_p(dir) unless Dir.exist?(dir)

    # Lokal faylı yazma ('wb' - write binary) modunda açırıq və məlumatı içinə köçürürük
    File.open(local_path, 'wb') do |local_file|
      local_file.write(remote_file.read)
    end
  end

  # 4. Uğurlu bitmə mesajı
  puts "File downloaded and saved to #{local_path}."

rescue StandardError => e
  # Hər hansı bir şəbəkə və ya fayl xətası olarsa, bura düşəcək
  puts "An error occurred: #{e.message}"
end
