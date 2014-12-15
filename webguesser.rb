require 'sinatra'
require 'sinatra/reloader'

secret_number = rand(101)

get '/' do
  @guess_count = 0
  user_guess = params[:guess].to_i
  message = feedback(user_guess, secret_number)
  erb :index, locals: { :secret_number => secret_number,
                        :message       => message }
end

def feedback(user_guess, secret_number)
  if user_guess == 0
    "Take a Guess!"
  elsif user_guess > secret_number + 5
    "Your guess of #{user_guess} is too damn high!"
  elsif user_guess > secret_number
    "Your guess of #{user_guess} is too high"
  elsif secret_number > user_guess + 5
    "Your guess of #{user_guess} is too damn low!"
  elsif user_guess > secret_number
    "Your guess of #{user_guess} is too low!"
  else
    "Correct! You guessed #{secret_number} and it was right"
  end
end
