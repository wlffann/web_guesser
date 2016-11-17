require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do 
  guess = params['guess'].to_i
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end

def check_guess(guess)
  return too_high(guess) if guess > SECRET_NUMBER
  return too_low(guess) if guess < SECRET_NUMBER
  "You got it right!"
end

def too_high(guess)
  return "Way too high!" if guess - 5 > SECRET_NUMBER
  "Too high!"
end

def too_low(guess)
  return "Way too low!" if guess + 5 < SECRET_NUMBER
  "Too low!" 
end