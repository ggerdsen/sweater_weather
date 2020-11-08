class DailyWeather
  
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon
  
  def initialize(data)
    @date = Time.at(data.first[:dt]).strftime("%Y/%d/%m")
    @sunrise = Time.at(data.first[:sunrise])
    @sunset = Time.at(data.first[:sunset])
    @max_temp = data.first[:temp][:max]
    @min_temp = data.first[:temp][:min]
    @conditions = data.first[:weather].first[:description]
    @icon = data.first[:weather].first[:icon]
  end

end