require_relative 'config/environment'

class App < Sinatra::Base

	get "/" do
		erb :user_input
	end

	post "/piglatinize" do
		pl_instance = PigLatinizer.new
    @piglatin = pl_instance.piglatinize(params[:user_phrase])
		erb :piglatinize
	end
end