require 'selenium-webdriver'
require 'test/unit'
require 'pry'

#This is a Page Object Model which will defines each element in the site to use for the test case
class Test_Sample < Test::Unit::TestCase
  def initialize(url)
    #This is to startup the window
    @driver = Selenium::WebDriver.for :firefox
    @driver.manage.window.maximize
    @driver.navigate.to url
  end

  def setup(url)
    @driver.navigate.to url
  end

  def teardown
    @driver.quit
    # return @show_prompt_window = false
  end

  def login_username
    return @driver.find_element(:id, 'login_login_username')
  end

  def login_password
    return @driver.find_element(:id, 'login_login_password')
  end

  def submit_button
    return @driver.find_element(:id, 'login_submit')
  end

  def check_home_page
    return @driver.find_element(:css, 'h3.panel-heading.profile-block')
  end

  def search
    return @driver.find_element(:name, 'query')
  end

  def search_submit_button
    return @driver.find_element(:id, 'usf_submit')
  end

  def check_results_page
    return @driver.find_element(:id, 'universalsearchresult')
  end

  def peek_article
    return @driver.find_element(:link_text, 'Steering committee meeting in January')
  end

  def displayed?(locator)
    locator.displayed?
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end

  def test_fail
    element = @driver.find_element(:css, 'alert alert-danger').find_element(:css, 'div').text
    # puts element
    element.displayed?
    false
  rescue Selenium::WebDriver::Error::NoSuchElementError
    true
  end

  def wait_for(seconds=10)
    Selenium::WebDriver::Wait.new(:timeout => seconds)
  end

end