require 'insite'

# https://github.com/jfitisoff/insite/wiki/Defining-a-Site
class AgileMDSite
  include Insite

  def initialize
    super("https://www.agilemd.com/")
  end
end

Dir["./spec/support/**/*.rb"].sort.each { |f| require f }
