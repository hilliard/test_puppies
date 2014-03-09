require_relative 'side_menu_panel'

class HomePage
  include PageObject
  include SideMenuPanel

  page_url "http://puppies.herokuapp.com"

  divs(:name, :class => 'name')
  buttons(:view_detail, :value => 'View Details')

  def select_puppy2(name)
    index = index_for(name)
    view_detail_elements[index].click
  end

  def select_puppy(name = 'Brook')
    index = index_for(name)
    button_element(:value => 'View Details', :index => index).click
  end

  private

  def index_for(name)
    name_elements.find_index { |the_div| the_div.text == name }
  end

  def select_puppy_number(num)
    button_element(:value => 'View Details', :index => num - 1).click
  end
end