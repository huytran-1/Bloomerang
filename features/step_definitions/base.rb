require 'selenium/webdriver'
require 'webdrivers'
require 'json'

$driver = Selenium::WebDriver.for :chrome
$property = JSON.parse(File.read("testData/properties.json"))

def wait_until
  Selenium::WebDriver::Wait.new(timeout: 20).until {yield}
rescue => e
  puts "Timeout waiting for element #{e.inspect}"
  puts e.backtrace.join("\n")
  raise
end

def launch(url)
  $driver.get(url)
end

def find_el(css)
  loc = get_css(css)
  element = nil
  wait_until do
    element = $driver.find_element(:css, loc)
  end
  element
end

def click_state(state)
  loc = get_css("state") % state
  element = nil
  wait_until do
    element = $driver.find_element(:css, loc)
  end
  element.click
end

def el_visible(css)
  element = nil
  element_displayed = nil
  wait_until do
    begin
      element = find_el(css)
      element_displayed = element.displayed?
      element_displayed
    rescue
      false
    end
  end
  raise 'Element not found' unless element
  raise 'Element not visible' unless element_displayed
  element
end

def el_visible?(css)
  el_visible(css)
  true
rescue
  false
end

def el_not_visible(css)
  element = nil
  element_displayed = nil
  wait_until do
    begin
      element = find_el(css)
      element_displayed = element.displayed?
      !element_displayed
    rescue
      false
    end
  end
  raise 'Element is visible' if element && element_displayed
  element
end

def el_not_visible?(css)
  el_not_visible(css)
  true
rescue
  false
end

def send_text(text, css)
  ele = find_el(css)
  ele.send_keys(text)
end

def click_el(css)
  ele = find_el(css)
  ele.click
end

def get_css(string)
  css = $property[string]
  css
end
