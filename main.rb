require 'sinatra'
require_relative 'cipher'
get '/' do
	code = params["code"]
	shiftnumber = params["shiftnumber"].to_i
	if code && shiftnumber
		cipher = Cipher.new(code, shiftnumber)
		result = cipher.show
	end
	erb :index, :locals => {:text => result}
end