# decode_session_cookie.rb
# ------------------------
# The purpose of this script is to show that if I have the secret_key_base
# and a cookie to an active Rails session, I can decrypt it and gain access
# to key information about the user's session.

require 'rubygems'
require 'bundler/setup'
require 'cgi'
require 'active_support'
require 'action_controller'
require 'pry'


def decrypt_session_cookie(cookie, key)
  cookie = CGI::unescape(cookie)
  
  # Default values for Rails 4 apps
  key_iter_num = 1000
  key_size     = 64
  salt         = "encrypted cookie"         
  signed_salt  = "signed encrypted cookie"  

  key_generator = ActiveSupport::KeyGenerator.new(key, iterations: key_iter_num)
  secret = key_generator.generate_key(salt)
  sign_secret = key_generator.generate_key(signed_salt)

  encryptor = ActiveSupport::MessageEncryptor.new(secret, sign_secret, serializer: ActiveSupport::MessageEncryptor::NullSerializer)
  encryptor.decrypt_and_verify(cookie)
end

## Default values
session_cookie = "NUZHbkJKSCsyM3FOL2p2Qld6VUtMWkMwRERFa1R6UUZvU2F5RDJzSlZQYzlWQUtrWjRQTXBTbVExaHkrQ05TTytBNlViQWNWdDRrNjRtV2FxbWkzL2pncUt1ZlBIYitvMFA5SFB6MDVsUzZTK1o1TjV6SkdXbHJNVTlLa1BubDNNM1NnT3lCY3JiRzZuR0JEUHh6RkhRelg4VVlUTlFsRXJlOWxQd0FHR3BLbUViS2FBSWEzTVhmV1lOcU5EZkdLL1cvYXhKNzgvbHJnVzZJbmM2SjJiZE82dHpBMkNRT3VacDZDeVRiaFdQbz0tLXNhT1VkQis3VnJzVWRGVjNidUQxdVE9PQ%3D%3D--bf19b413465acc54352c23db37fc8d501c5c83ae"

secret_key_base = "6f3eded16f0d7899c767e05d22dfda620a6ab665438d35320dadf001e7d0505995bf2e4fd8b5b3c7086131cbbfb37739a81f627148f227a06dcced9e223b09dc"


puts "Encrypted Session Cookie?"
input_cookie = gets.chomp
session_cookie = input_cookie unless input_cookie.empty?

puts "Secrete Key Base?"
input_key = gets.chomp
secret_key_base = input_key unless input_key.empty?

puts decrypt_session_cookie(session_cookie, secret_key_base)

