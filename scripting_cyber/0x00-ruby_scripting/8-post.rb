#!/bin/bash

require 'net/http'
require 'uri'
require 'json'

def post_request(url, body_params)
  uri = URI.parse(url)

  # 1. POST obyekti yaradırıq
  request = Net::HTTP::Post.new(uri)
  
  # 2. Kritik Hissə: API-ə JSON göndərdiyimizi bildirən Header-ləri daxil edirik
  request['Content-Type'] = 'application/json'
  request['Accept'] = 'application/json'
  
  # 3. Parametrləri String-ə yox, təmiz JSON stringinə çevirib body-yə qoyuruq
  # Bu üsul userId: 11 dəyərinin rəqəm olaraq qalmasını təmin edir
  request.body = body_params.to_json

  # 4. İstəyi göndəririk
  response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
    http.request(request)
  end

  # 5. Nəticələri çap edirik
  puts "Response status: #{response.code} #{response.message}"
  puts "Response body:"

  begin
    parsed_body = JSON.parse(response.body)
    puts JSON.pretty_generate(parsed_body)
  rescue
    puts response.body
  end
end
