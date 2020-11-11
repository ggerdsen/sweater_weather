class RoadTrip
  attr_reader :type,
              :id,
              :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(start_city, destination_info, travel_time, destination_weather)
    @id = nil
    @type = "roadtrip"
    @start_city = start_city
    @end_city = destination_info[:results].first[:providedLocation][:location]
    @travel_time = route_time(travel_time)
    @weather_at_eta = route_possible(travel_time, destination_weather)
  end
  
  def route_time(travel_time)
    if travel_time.nil?
      "impossible route"
    else
      "#{travel_time.to_time.hour} hours, #{travel_time.to_time.min} minutes"
    end
  end
  
  def route_possible(travel_time, destination_weather)
    if travel_time.nil?
      ""
    else
      {"temperature": destination_weather[:hourly][(travel_time.to_time.hour)-1][:temp],
       "conditions": destination_weather[:hourly][(travel_time.to_time.hour)-1][:weather].first[:description]}
    end
  end
  
end