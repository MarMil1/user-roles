# User roles web app

**Description**: Role base access application using Devise and Rolify
in which admin users can manage regular user's roles.

- Ruby version: 3.3.1
- Rails version: 7.1.3.2
- System dependencies installed:

  - bundle add devise
  - gem "rolify"

- Database creation:
  - rails generate devise user
  - rails g rolify Role User
- Database initialization: rails db:migrate

## Steps to implement application

### Step 1

- Open new folder in terminal andrun **rails new user_roles** to create a new Rails app.
- Run **rails g scaffold post title:text** to create a scaffold for posts.
- Run **rails db:migrate** to migrate created posts.
- In routes.rb, uncomment/add `root "posts#index"`
- Add Simple CSS CDN link to application.html.erb `<link rel="stylesheet" href="https://cdn.simplecss.org/simple.css">`

### Step 2

- Install devise gem by running **bundle add devise** in terminal
- Run generator for devise **rails generate devise:install**
- In developmenr.rb add:
  `config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }`
- Run **rails g devise user**
- Run **rails db:migrate**

### Step 3

- Install rolify gem by adding **gem "rolify"** into Gemfile
- Run **bundle** in console to install rolify
- Run **rails g rolify Role User**
