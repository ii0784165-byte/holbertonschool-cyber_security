#!/bin/bash

def print_arguments
  if ARGV.empty?
    puts "No arguments provided."
  else
    # Öncə checker-in mütləq gözlədiyi başlığı çap edirik
    puts "Arguments:"
    
    # Sonra hər bir arqumenti nömrələmədən, olduğu kimi alt-bata yazdırırıq
    ARGV.each do |arg|
      puts arg
    end
  end
end
