#!/bin/bash

class HelloWorld
  def initialize
    @message = "Hello, World!"
  end

  def print_hello
    puts @message
  end
end

# KLASSIN XARİCİNDƏ (Faylın sonunda obyekti çağırırıq):
test_obyekt = HelloWorld.new
test_obyekt.print_hello
