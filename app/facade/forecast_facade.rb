class ForecastFacade
  def initialize(search_params)
    ForecastService.get_weather(coords)
  end
end