class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
  get '/gossips/new' do
    erb :new_gossip
  end 
  get '/gossips/:id' do
    all_gossips = Gossip.all
    gossip_id = params['id'].to_i
    if gossip_id <= all_gossips.length && gossip_id > 0
      gossip = all_gossips[gossip_id-1]
      erb :show_gossip, locals: { gossip: gossip }
    else
      "Gossip not found"
    end
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"],params["gossip_content"]).save
    redirect '/'
  end  
end