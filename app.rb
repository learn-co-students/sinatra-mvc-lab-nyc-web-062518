require_relative 'config/environment'
require_relative 'models/piglatinizer.rb'

class App < Sinatra::Base

  get '/' do
    erb :user_input
  end

  get '/piglatinize' do
    erb :piglatinize
  end

  post '/piglatinize' do
    @text = params[:user_phrase]
    @pig = PigLatinizer.new
    @final_text = @pig.piglatinize(@text)
    erb :piglatinize
  end

end
