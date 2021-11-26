# README
Access the live site here: [Burger Hunt](https://burger-hunt.herokuapp.com/)

To enable sound on Safari:
 - Autoplay must be enabled - Safari -> Settings for this Website -> Autoplay: Allow All Auto-Play

# App startup
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

