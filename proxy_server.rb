require "sinatra"
require 'sinatra/cross_origin'
require "uri"
require "net/http"

configure do
  enable :cross_origin
end

before do
  response.headers['Access-Control-Allow-Origin'] = '*'
end

get "/search" do
  keyword = URI.encode_www_form_component(params[:keyword])
  uri = URI.parse("https://jisho.org/api/v1/search/words?keyword=#{keyword}")
  res = Net::HTTP.get_response(uri)
  return res.body if res.is_a?(Net::HTTPSuccess)
end

options "*" do
  response.headers["Allow"] = "GET, PUT, POST, DELETE, OPTIONS"
  response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
  response.headers["Access-Control-Allow-Origin"] = "*"
  200
end
