= WebSql

This project rocks and uses MIT-LICENSE.

Usage

`gem 'web_db'`

Make a file `config/web_db.yml` with content below:

```
default: &default
  adapter: mysql2
  uncoding: utf8
  pool: 5
  username: root
  password: '123456'
  host: localhost
development: 
  tribe_development:
    <<: *default
    database: tribe_development
  tribe_test:
    <<: *default
    database: tribe_test
```
