require 'selenium/webdriver'


Given('I launch the Form page') do
  launch("https://jenkins-bloomerang.github.io/qa4.bloomerang.co/qa4bloomautomation01/volunteer/31759.html")
end

Then('I enter {string} in the {string} field') do |text, css|
  send_text(text, css)
end

And('I wait for {int} seconds') do |sec|
  sleep sec
end

And('I select state {string}') do |st|
  click_state(st)
end

And('I click submit') do
  click_el("submit_button")
end

And('I check if {string} is visible') do |string|
  el_visible?(string)
end

And('I check if {string} is not visible') do |string|
  el_not_visible?(string)
end