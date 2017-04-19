require 'open-uri'

class MeteorologistController < ApplicationController
  def street_to_weather_form
    # Nothing to do here.
    render("meteorologist/street_to_weather_form.html.erb")
  end

  def street_to_weather
    @street_address = params[:user_street_address]

    # ==========================================================================
    # Your code goes below.
    #
    # The street address that the user typed is in the variable @street_address.
    # ==========================================================================

    #url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{@street_address}"

    urlds = "https://api.darksky.net/forecast/10332e564fa7992d9a3dc75457a89342/#{@street_address}"

    parsed_data = JSON.parse(open(urlds).read)

    temperature = parsed_data["currently"]["temperature"]
    summarycur = parsed_data["currently"]["summary"]
    summarynsix = parsed_data["minutely"]["summary"]
    summarynsevhr = parsed_data["hourly"]["summary"]
    summarynsd = parsed_data["daily"]["summary"]
    @current_temperature = temperature
    @current_summary = summarycur
    @summary_of_next_sixty_minutes = summarynsix
    @summary_of_next_several_hours = summarynsevhr
    @summary_of_next_several_days = summarynsd
    #@latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
    #@longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

    #@current_temperature =

    #@current_summary = "Replace this string with your answer."

    #@summary_of_next_sixty_minutes = "Replace this string with your answer."

    #@summary_of_next_several_hours = "Replace this string with your answer."

    #@summary_of_next_several_days = "Replace this string with your answer."

    render("meteorologist/street_to_weather.html.erb")
  end
end
