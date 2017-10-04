require 'sinatra'
require_relative 'cipher'
require_relative 'code/master'
enable :sessions
@@m = MasterMind.new("huyanh")
def resetgame
	@@m.generateColor
	@@result = []
	@@ketqua = []
	@@turn = 12
	@@win = false
end
resetgame
# cipher code
get '/' do
	erb :menu
end
get '/cipher' do
	code = params["code"]
	shiftnumber = params["shiftnumber"].to_i
	if code && shiftnumber
		cipher = Cipher.new(code, shiftnumber)
		result = cipher.show
	end
	erb :cipher, :locals => {:text => result}
end
get '/reset' do
	resetgame
	erb :master, :locals => {:status => @@m.code, :result => @@result, :message => "New Game", :win => @@win, :turn => @@turn}
end
# post turn and get the result
post '/master' do
	a = []
	a[0] = params["pos1"]
	a[1] = params["pos2"]
	a[2] = params["pos3"]
	a[3] = params["pos4"]
	@@result << a
	@@turn -= 1
	temp = @@m.process2(a)
	@@ketqua << temp
	session["data"] = @@result
	session["result"] = @@result
	if (temp.count("+") == 4) 
		message = "You Win !"
		@@win = true
	elsif (@@turn == 0)
		message = "You lose!"
	else
		message = ""
	end
	erb :master, :locals => {:status => @@m.code, :result => @@result, :ketqua => @@ketqua, :message => message, :win => @@win, :turn => @@turn}
end
