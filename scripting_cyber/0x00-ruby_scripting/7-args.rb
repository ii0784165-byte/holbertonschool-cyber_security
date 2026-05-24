#!/bin/bash

def print_arguments
  # 1. ARGV massivinin boş olub-olmadığını yoxlayırıq
  if ARGV.empty?
    puts "No arguments provided."
  else
    # 2. Hər bir arqumenti indeksi ilə bərabər dövrə salırıq
    # index 0-dan başladığı üçün ekrana çıxaranda üzərinə 1 gəlirik
    ARGV.each_with_index do |arg, index|
      puts "#{index + 1}. #{arg}"
    end
  end
end
