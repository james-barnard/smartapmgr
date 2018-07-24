module LoadsHelper
  def remaining(tap)
    "#{tap[:ounces_remaining].round} / #{tap[:days_remaining].round}"
  end
end
