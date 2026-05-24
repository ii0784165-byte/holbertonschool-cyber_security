#!/bin/bash

class CaesarCipher
  # Konstruktor: sürüşmə (shift) dəyərini təyin edir
  def initialize(shift)
    @shift = shift
  end

  # Şifrələmə metodu
  def encrypt(message)
    cipher(message, @shift)
  end

  # Şifrəni açma metodu (sürüşmə dəyərinin mənfisini göndəririk)
  def decrypt(message)
    cipher(message, -@shift)
  end

  # Kənardan birbaşa çağırılmasını əngəlləmək üçün aşağıdakı metodları private edirik
  private

  def cipher(message, shift_value)
    # Hər bir simvolu tək-tək gəzirik və dəyişdiririk
    message.chars.map do |char|
      if char.match?(/[A-Z]/)
        # Böyük hərflər üçün (ASCII 65-90)
        (((char.ord - 65 + shift_value) % 26) + 65).chr
      elsif char.match?(/[a-z]/)
        # Kiçik hərflər üçün (ASCII 97-122)
        (((char.ord - 97 + shift_value) % 26) + 97).chr
      else
        # Hərf olmayan simvollar (boşluq, nida, vergül və s.) olduğu kimi qalır
        char
      end
    end.join # Massivə çevrilmiş hərfləri yenidən tək bir string formatında birləşdiririk
  end
end
