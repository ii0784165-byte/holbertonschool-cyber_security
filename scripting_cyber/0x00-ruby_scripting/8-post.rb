#!/bin/bash

require 'net/http'
require 'uri'
require 'json'

def post_request(url, body_params)
  # 1. URL-i URI obyektinə çeviririk
  uri = URI.parse(url)

  # 2. POST istəyi üçün obyekt yaradırıq
  request = Net::HTTP::Post.new(uri)

  # 3. Parametrləri (Heş obyektini) form data şəklində istəyə əlavə edirik
  request.set_form_data(body_params)

  # 4. HTTP bağlantısını başladırıq və istəyi göndəririk
  response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
    http.request(request)
  end

  # 5. Status kodunu və mesajını ekrana çıxarırıq (Məsələn: 201 Created)
  puts "Response status: #{response.code} #{response.message}"
  puts "Response body:"

  # 6. Gələn cavabı parse edib səliqəli (pretty JSON) formatda çap edirik
  begin
    parsed_body = JSON.parse(response.body)
    puts JSON.pretty_generate(parsed_body)
  rescue
    puts response.body
  end
end
