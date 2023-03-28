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