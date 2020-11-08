class DailyWeather
  
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon
  
  def initialize(day)
      @date = Time.at(day[:dt]).strftime("%Y/%m/%d")
      @sunrise = Time.at(day[:sunrise])
      @sunset = Time.at(day[:sunset])
      @max_temp = day[:temp][:max]
      @min_temp = day[:temp][:min]
      @conditions = day[:weather].first[:description]
      @icon = day[:weather].first[:icon]
  end
  
  def self.new_day(data)
    data.first(5).map do |day|
      DailyWeather.new(day)
    end
  end

end