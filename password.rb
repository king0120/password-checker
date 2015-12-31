require 'io/console'

puts "Hello, please enter your password."

password = STDIN.noecho(&:gets).chomp

def has_digits (str)
  str.count("0-9")
end

def has_upper(str)
  str.count("A-Z")
end

def has_lower(str)
  str.count("a-z")
end

def has_special(str)
  str.scan(/\!|\@|\#|\$|\^|\&|\?|\<|\>/).length
end

errors = 0

if password.length < 8 || password.length > 16
  errors += 1
  puts "Please enter a password between 8 and 16 characters."
end

if has_digits(password) < 2
  errors += 1
  puts "Please make sure your password has at least 2 numbers."
end

if has_upper(password) < 2
  errors += 1
  puts "Please include at least 2 upper case letters."
end

if has_lower(password) < 2
  errors += 1
  puts "Please include at least 2 lower case letters."
end

if has_special(password) < 1
  errors += 1
  puts "Please include at least one of the following characters: !, @, #, $, ^, &, ?, <, >."
end

puts "You have #{errors} errors in your password."
