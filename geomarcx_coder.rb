require 'rubygems'
require 'geocoder/us'
require 'json'
require 'haml'

$db = Geocoder::US::Database.new('geocoder.db')

get '/' do
  address = params[:address]
  if address
    @result = $db.geocode(params[:address])
    haml :index
  else
    haml :index
  end
end

get '/json' do
  address = params[:address]
  if address
    @result = $db.geocode(params[:address])
    @result.to_json
  end
end
