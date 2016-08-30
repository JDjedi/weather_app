require 'open-uri'
require 'json'
require 'erb'

class WeatherController < ApplicationController
	def index
		open('http://api.wunderground.com/api/bb60b5fbf63bb327/geolookup/conditions/q/TX/Austin.json') do |f|
			json_string = f.read
			parsed_json = JSON.parse(json_string)
			@location = parsed_json['location']['city']
			@temp_f = parsed_json['current_observation']['temp_f']
			@wind_dir = parsed_json['current_observation']['wind_dir']
			@weather = parsed_json['current_observation']['weather']
		end
	end
end
