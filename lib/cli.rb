class CLI

  def start
    puts "Welcome"
    API.fetch_drinks
  end

end
