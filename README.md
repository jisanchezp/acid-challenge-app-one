# Acid Challenge App One

This application is the client side from a whole (basic) system. The complete
system has a client/server architecture, interconnected by a REST proxy API.
In this app, you will find a simple form to submit a request (email + image in
base64 encoding format), and receive a request (status codes 200 & 401 only,
plus a message).

**IMPORTANT:**

The followings steps, with the exception of **Prerequisites** and
**Running the tests**, are just for **Acid Challenge App One**, for the other
applications you must follow their own steps specified in their Github pages.

### Prerequisites

Follow the steps of **1 Guide Assumptions** in [Ruby on Rails - Getting Started](http://guides.rubyonrails.org/getting_started.html) to install ruby on rails environment.

### Installing

To deploy the whole system, you have to clone these three applications.

* [acid-challenge-app-one](https://github.com/jisanchezp/acid-challenge-app-one) - Client app (this one)
* [acid-challenge-app-two](https://github.com/jisanchezp/acid-challenge-app-two) - Server app (instructions on it's GitHub Page)
* [acid-challenge-app-three](https://github.com/jisanchezp/acid-challenge-app-three) - Proxy app (instructions on it's GitHub Page)

1) Clone the project's repository to your local machine:

```
$ git clone https://github.com/jisanchezp/acid-challenge-app-one
```

2) Install all gems executing the following command inside project's main folder:

```
$ bundle install --without production
```

3) Create the following environment variable:

This project has Figaro gem installed.

Run this command, and it will create **config/application.yml** and will add it to git ignore.

```
$ bundle exec figaro install
create  config/application.yml
append  .gitignore
```

After this, copy/paste the following to the recently created **config/application.yml**.

```
development:
  api_host: 'http://localhost:3002' # Choose any port you want, but it must
                                    # be an unused port and the same one used in
                                    # the acid-challenge-app-three application

production:
  api_host: '<your-app-three-heroku-url>'
```

4) Start Rails server:

```
$ rails s
```

4.1) If you don't have as your default Rails port, port '3000', execute the
Rails server like this.

```
$ rails s -p 3000
```

5) Open the [app](http://localhost:3000).

(For the next steps, is recommended to add some users in the server app,
acid-challenge-app-two](https://github.com/jisanchezp/acid-challenge-app-two))

6) Enter an email and select an image (only PNG format is allowed).

7) Submit form and watch results.

## Running the tests

To run automated tests follow the following steps:

Pre-requisites: You should have followed the "Installing" steps for all three applications first.

1) Step into the main folder and run a command console, and type:

```
$ rails t
```

This will run ALL application tests. You want to test controllers, or models alone, use:

```
$ rails test:controllers
```

```
$ rails test:models
```

After executing the choosing command, the test results will be displayed in the command console.

## Deployment

A live version of these app has already been deployed at [heroku](https://login-form-jisanchez.herokuapp.com/)

If you want to deploy in your own account, follow this steps:

1) Install [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli) in your local machine (if you don't have it already installed)

2) In the application root folder, open a command console and type the next commands to login on Heroku and add your SSH key

```
$ heroku login
$ heroku keys:add
```

3) Create the Heroku app:

```
$ heroku create
```

3.1) Optional step, rename your Heroku App with the following command (replace **best-name-ever** with the desired name:

```
$ heroku rename best-name-ever
```

After this, update you api_host key in **config/application.yml** points to the heroku deployed [acid-challenge-app-three](https://github.com/jisanchezp/acid-challenge-app-three)

```
production:
  api_host: '<your-app-two-heroku-domain>' # e.g. 'https//proxy-app-herokuapp.com'
```

And then execute the following to set all the environment variables to Heroku at once:

```
$ figaro heroku:set -e production
```

4) Push the repository master branch to Heroku repository master branch:

```
$ git push heroku master
```

4) Finally, execute the next command to open your heroku application on the browser:

```
$ heroku open
```

## Authors

* **Juan Ignacio Sánchez** - *Initial work* - [jisanchezp](https://github.com/jisanchezp)
