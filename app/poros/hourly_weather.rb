class HourlyWeather
  
  attr_reader :time,
              :wind_speed,
              :wind_direction,
              :conditions,
              :icon
  
  def initialize(data)
      @time = Time.at(data[:dt]).strftime("%k:%M:%S")
      @wind_speed = data[:wind_speed]
      @wind_direction = get_cardinal_direction(data[:wind_deg])
      @conditions = data[:weather].first[:description]
      @icon = data[:weather].first[:icon]
      @temperature = data[:temp]
  end
  
  def self.new_hour(data)
    data.first(8).map do |hour|
      HourlyWeather.new(hour)
    end
  end
  
  def get_cardinal_direction(wind_degrees)
    if wind_degrees > 348.75 || wind_degrees < 11.25
      "N"
    elsif wind_degrees > 11.26 && wind_degrees < 33.75
      "NNE"
    elsif wind_degrees > 33.76 && wind_degrees < 56.25
      "NE"
    elsif wind_degrees > 56.26 && wind_degrees < 78.75
      "ENE"
    elsif wind_degrees > 78.76 && wind_degrees < 101.25
      "E"
    elsif wind_degrees > 101.26 && wind_degrees < 123.75
      "ESE"
    elsif wind_degrees > 123.76 && wind_degrees < 146.25
      "SE"
    elsif wind_degrees > 146.26 && wind_degrees < 168.75
      "SSE"
    elsif wind_degrees > 168.76 && wind_degrees < 191.25
      "S"
    elsif wind_degrees > 191.26 && wind_degrees < 213.75
      "SSW"
    elsif wind_degrees > 213.76 && wind_degrees < 236.25
      "SW"
    elsif wind_degrees > 236.26 && wind_degrees < 258.75
      "WSW"
    elsif wind_degrees > 258.76 && wind_degrees < 281.25
      "W"
    elsif wind_degrees > 281.26 && wind_degrees < 303.75
      "WNW"
    elsif wind_degrees > 303.76 && wind_degrees < 326.25
      "NW"
    elsif wind_degrees > 326.26 && wind_degrees < 348.74
      "NNW"
    end
  end
end