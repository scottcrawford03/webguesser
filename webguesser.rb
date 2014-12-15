require 'sinatra'
require 'sinatra/reloader'

secret_number = rand(101)

get '/' do
  user_guess = params[:guess].to_i
  message = if user_guess > secret_number
              "Your guess of #{user_guess} is too high!"
            elsif user_guess < secret_number
              "Your guess of #{user_guess} is too low!"
            else
              "Correct!"
            end

  erb :index, locals: { :secret_number => secret_number,
                        :message       => message }
end
