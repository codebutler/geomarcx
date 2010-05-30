require 'rubygems'
require 'geocoder/us'
require 'json'
require 'haml'

get '/' do
  address = params[:address]
  if address
    @db = Geocoder::US::Database.new('geocoder.db')
    @result = @db.geocode(params[:address])
    haml :index
  else
    haml :index
  end
end
