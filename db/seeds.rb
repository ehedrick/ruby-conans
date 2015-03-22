Question.create language: 'ruby', text: '[0][1]'
Question.create language: 'ruby', text: "%s'%%s's'"
Question.create language: 'ruby', text: "''<<''"
Question.create language: 'ruby', text: "'CONAN'.codepoints.reduce(:+)"
Question.create language: 'ruby', text: "'^\^'.count('^\^')"
Question.create language: 'ruby', text: "'a-e-i-o-u'.delete(*%w'a-i a-e')"
Question.create language: 'ruby', text: "'suck'.succ"
Question.create language: 'ruby', text: "'oct'.oct"
Question.create language: 'ruby', text: "(67.chr*5).scan(/(..)(..)/)"
Question.create language: 'ruby', text: "','.split(',',-1)"
Question.create language: 'ruby', text: "'CONAN'.squeeze('CONAN')"
Question.create language: 'ruby', text: "'cup'.tr(*%w'up p')"

# Seed add you the ability to populate your db.
# We provide you a basic shell for interaction with the end user.
# So try some code like below:
#
#   name = shell.ask("What's your name?")
#   shell.say name
#
email     = shell.ask "Which email do you want use for logging into admin?"
password  = shell.ask "Tell me the password to use:"

shell.say ""

account = Account.create(:email => email, :name => "Foo", :surname => "Bar", :password => password, :password_confirmation => password, :role => "admin")

if account.valid?
  shell.say "================================================================="
  shell.say "Account has been successfully created, now you can login with:"
  shell.say "================================================================="
  shell.say "   email: #{email}"
  shell.say "   password: #{password}"
  shell.say "================================================================="
else
  shell.say "Sorry but some thing went wrong!"
  shell.say ""
  account.errors.full_messages.each { |m| shell.say "   - #{m}" }
end

shell.say ""
