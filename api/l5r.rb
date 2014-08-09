#!/usr/bin/env ruby

require 'highline/import'

loop do
  begin
    cmd = ask "<%= color('L5R> ', :green) %>"
    case cmd
    when /l (.*+)/
      say $1
    when 'exit', 'quit'
      say "Goodbye"
      exit
    end
  rescue Interrupt
    say "\nGoodbye"
    exit
  end
end
