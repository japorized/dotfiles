#!/usr/bin/env ruby
# TODO: figure out how to handle cases with {}
# The problem is that it may be multiline

require 'colorize'

File.foreach('sxhkdrc').with_index do |line, i|
  if line.start_with? "# Category: "
    category = line[12..]
    puts ""
    puts "#{category}".bold.blue
  elsif line.start_with? "# Desc: "
    description = line[8..]
    print " #{description}".green
  elsif line.start_with? "# ---"
    puts ""
    puts "   ----------".light_white
    puts ""
  elsif line.start_with? "# "
    # do nothing and skip
  elsif ! line.to_s.strip.empty?
    if line.start_with?('\n', '\r\n', '\t', '  ')
    else
      puts "#{line}"
    end
  end
end
