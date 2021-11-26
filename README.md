# README
Access the live site here: [Burger Hunt](https://burger-hunt.herokuapp.com/)

To enable sound on Safari:
 - Autoplay must be enabled - Safari -> Settings for this Website -> Autoplay: Allow All Auto-Play

# App startup
## Installing all gems
Run:
```
bundle install
```
## Database setup commands
When using the app for the first time the databases will need configuring. The simplist command to run is:
```
bin/rails db:schema:load
```
If you have added a new migration and want to update the schema, run:
```
bin/rails db:migrate
```
if migrations are not working or a table you just added needs completely changing, run
```
rails db:reset -> drops and recreates all databases found in config/database.yml
db:schema:load -> uses the schema found in db/schema.rb to repopulate all tables in the database from a single source
```
To start the app up, simply run
```
bin/rails server
```

## Troubleshooting
If you don't have Node.js installed yet, you might run into this error when running rspec:
```
ExecJS::RuntimeUnavailable:
  Could not find a JavaScript runtime. See https://github.com/rails/execjs for a list of available runtimes.
 ```
Rails requires a Javascript runtime to work. The easiest way is to install Node by running `brew install node` - and then run `bundle exec rspec` again

You may also need to run if webpacker is not installed on your machine:
```
bundle exec rake webpacker:install
```

