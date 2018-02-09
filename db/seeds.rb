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
my_account = User.new(
  first_name: 'Matt',
  last_name:  'Harris',
  email:      'matt@livefullstack.com',
  password:   'asdf123'
)
my_account.skip_confirmation!
my_account.save!
print 'My account (matt@livefullstack.com) created.'
