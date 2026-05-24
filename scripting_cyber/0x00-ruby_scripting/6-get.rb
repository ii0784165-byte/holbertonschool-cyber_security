#!/bin/bash

require 'net/http'
require 'uri'

def get_request(url)
  # 1. String formatındakı URL-i Net::HTTP-nin başa düşəcəyi URI obyektinə çeviririk
  uri = URI.parse(url)

  # 2. HTTP GET istəyini göndəririk və cavabı (response) alırıq
  response = Net::HTTP.get_response(uri)

  # 3. Status kodunu və mesajını ekrana çıxarırıq (Məsələn: 200 OK)
  puts "Response status: #{response.code} #{response.message}"

  # 4. Cavabın gövdəsini (Response Body) ekrana yazdırırıq
  puts "Response body:"
  puts response.body
end
