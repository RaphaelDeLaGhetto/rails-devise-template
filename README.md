rails-devise-template
=====================


# Setup

## Download

```
git clone https://github.com/RaphaelDeLaGhetto/rails-devise-template.git
```

## Install dependencies

```
cd rails-devise-template
bundle install
```

## Configure

`config/application.yml` is where [figaro](https://github.com/laserlemon/figaro)
stores all your secret configuration details, so you need to create it manually:

```
vim config/application.yml
```

Paste this and save:

```
# General
app_name: 'rails_devise_template'
app_title: 'Rails and Devise, ready to go'

# Email
default_from: 'noreply@example.com'
#gmail_username: "noreply@example.com"
#gmail_password: "secretp@ssword"

# Production
#host: "example.com"
#secret_key_base: "SomeRakeSecretHexKey"
#provider_database_password: 'secretp@ssword'
```


## Database

```
rake db:create
rake db:migrate
```
