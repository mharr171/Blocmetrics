require 'faker'

Faker::Internet.unique.clear
Faker::Pokemon.unique.clear

# Create My Account
my_account = User.new(
  first_name: 'Matthew',
  last_name:  'Harris',
  email:      'mharr171.z@gmail.com',
  password:   'asdf123'
)
my_account.skip_confirmation!
my_account.save!
print 'My account (mharr171.z@gmail.com) created.'

# Create My Account
my_other_account = User.new(
  first_name: 'Matt',
  last_name:  'Harris',
  email:      'matt@livefullstack.com',
  password:   'asdf123'
)
my_other_account.skip_confirmation!
my_other_account.save!
print 'My account (matt@livefullstack.com) created.'

users = User.all

users.each do |user|
  5.times do
    n = Faker::Internet.unique.domain_word
    application = Application.new(
      name: n.capitalize,
      url: Faker::Internet.url(n+".com")
    )
    application.user = user
    puts '.' if application.save
  end
end

applications = Application.all

events = []
5.times do
   events << Faker::Pokemon.unique.name
end

applications.each do |application|
  25.times do
    e = events.sample
    event = Event.new(
      name: e
    )
    event.application = application
    event.created_at = (rand*10).days.ago
    puts '.' if event.save
  end
end
