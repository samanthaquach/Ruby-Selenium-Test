require '/Users/sammiae/RubymineProjects/RubyTest/Test_Sample.rb'
require 'test/unit'
require 'pry'

#this is the test class for implementing the test case
class Test_Login < Test::Unit::TestCase
  browser = Test_Sample.new("http://demo.mahara.org")
  browser.setup("http://demo.mahara.org")
  browser.login_username.send_keys('samanthaquach1')
  browser.login_password.send_keys('StudentWorks')
  browser.submit_button.click
  browser.wait_for(10).until do
    browser.test_fail
  end


  wait until the Logout link displays, timeout in 10 seconds
  wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
  browser.wait_for(10).until do
    browser.check_home_page
  end

  browser.search.send_keys('People')
  browser.search_submit_button.click
  
  browser.wait_for(10).until do
    element = browser.check_results_page
    element if browser.displayed?(element)
  end
  
  browser.peek_article.click
  binding.pry
  browser.wait_for(5).until do
    browser.teardown
  end

end