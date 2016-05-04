require 'test_helper'

class WeatherWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:weather)
  end
  
  test "display" do
    render_widget :weather
    #assert_select "div"
  end
end
