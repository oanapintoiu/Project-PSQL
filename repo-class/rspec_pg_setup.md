rvm use ruby

bundle init

bundle add rspec

rspec --init

mkdir lib

# Add the pg gem
bundle add pg

# Create the DatabaseConnection class (see below)
touch lib/database_connection.rb

# Create the SQL seeds (see below)
touch spec/seeds.sql

# Create a "main" app.rb file for the program (see below)
touch app.rb

# And create a repository for your changes
; git init .
; git add .
; git commit -m "Project setup"

# Then go and create a repository on github.com
# On the next screen after you have created the repository,
# follow the "Push an existing repository from the command line" section
# To push your project to your github repository
# It will look something like this...
; git remote add origin YOUR_REMOTE_ADDRESS
; git branch -M main
; git push -u origin main

# in case there's already a main, check main status and remove connection to that main:

git remote show origin    
git remote rm origin 