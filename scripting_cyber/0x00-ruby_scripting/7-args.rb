#!/bin/bash

def print_arguments
  if ARGV.empty?
    puts "No arguments provided."
  else
    puts "Arguments:"
    ARGV.each do |arg|
      puts arg
    end
    # Checker-in gözlədiyi o son boş sətri (newline) bura əlavə edirik:
    puts ""
  end
end
