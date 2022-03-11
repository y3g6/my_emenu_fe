# Rails E-menu app

### E-menu product develop using Rails.

### Development
#### Using docker
You need to have `Docker` install

For first time or ever new migrations
```
docker-compose up -d # start docker in silent mood
docker-compose exec web bundle exec rake db:setup db:migrate
docker-compose down
docker-compose up
```

#### Using your local machine
You need to have `ruby-3.0.2`,  `rails- 7.0.2`, `PostgreSQL 9.5`

- Configure database:
Setup database: Make you already install postgrest - `sudo -i -u postgres` - login to postgrest `psql` - the create user e_menu_user
`CREATE ROLE e_menu_user WITH SUPERUSER CREATEDB LOGIN ENCRYPTED PASSWORD 'AWESOME_PASSWORD';`

- Start server:
```
bundle install
rails db:setup db:migrate
rails s
```

### Common issue
PG error
https://gist.github.com/AtulKsol/4470d377b448e56468baef85af7fd614
