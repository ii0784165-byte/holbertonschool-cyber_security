#!/usr/bin/env ruby
require 'digest'

# 1. Arqumentlərin sayını yoxlayırıq. Dəqiq 2 dənə olmalıdır.
if ARGV.length != 2
  puts "Usage: 10-password_cracked.rb HASHED_PASSWORD DICTIONARY_FILE"
  exit 1
end

target_hash = ARGV[0].downcase.strip
dictionary_file = ARGV[1]

# Əgər göstərilən lüğət faylı mövcud deyilsə, xəta verməməsi üçün yoxlama qoyuruq
unless File.exist?(dictionary_file)
  puts "Password not found in dictionary."
  exit 1
end

password_found = nil

# 2. Lüğət faylını sətir-sətir oxuyuruq
File.foreach(dictionary_file) do |line|
  # Sətrin sonundakı boşluqları və enter (\n) simvollarını təmizləyirik
  word = line.strip
  next if word.empty?

  # Sözün SHA-256 heş dəyərini hesablayırıq
  current_hash = Digest::SHA256.hexdigest(word)

  # Hədəf heş ilə üst-üstə düşürsə, dövrü dayandırırıq
  if current_hash == target_hash
    password_found = word
    break
  end
end

# 3. Nəticəni ekrana çıxarırıq
if password_found
  puts "Password found: #{password_found}"
else
  puts "Password not found in dictionary."
end
