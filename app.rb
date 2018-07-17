require_relative 'config/environment'
require_relative 'models/piglatinizer'
require 'pry'

class App < Sinatra::Base

  get '/' do
    erb :user_input
  end

  post '/piglatinize' do
    # binding.pry 
    phrase = PigLatinizer.new
    @piglatinized_text = phrase.piglatinize(params[:user_phrase])
    erb :piglatinized
  end

end
