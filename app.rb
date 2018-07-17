require_relative 'config/environment'

class App < Sinatra::Base

  get '/' do
    erb :user_input
  end

  post '/piglatinize' do
    string = params[:user_phrase]
    @to_pig_latin = PigLatinizer.new
    @to_pig_latin.piglatinize(string)
  end
end
