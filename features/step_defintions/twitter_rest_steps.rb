Given(/^a (\w+) user whose screen name is (\w+)$/) do |service, screen_name|
  @user = User.new ({:service => service, :screen_name => screen_name})
end

When(/^I get their user info$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^it should include their ([\w\s]+) and (\d+)$/) do |full_name, user_id|
  pending # Write code here that turns the phrase above into concrete actions
end
