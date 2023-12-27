# OneUpADay

#### Simple tool for daily updates from multiple users.

* Users can post 1 update per day
* Users can tag their post with existing tags, or add their own tag
* Sort updates by day, tag, or user

## How to run
### Requirements
* `ruby '3.1.2'`
* `'rails', '~> 7.1.2'`

### Installation
1. Clone this repo:<br>
`git clone https://github.com/kaimunlau/one-up-a-day.git`<br>
OR<br>
`git clone git@github.com:kaimunlau/one-up-a-day.git`<br>
OR<br>
`gh repo clone kaimunlau/one-up-a-day`

2. Bundle all the things:<br>
`bundle install`

3. Setup the database:<br>
`rails db:create db:migrate`

4. [OPTIONAL] Seed the database:<br>
`rails db:seed`<br>
> Note: if you do not seed the database, you will **have to** sign up once the app is running. Use a dummy email for sign up.

### Usage
1. Start the server:<br>
`rails s`

2. In the browser go to `localhost:3000`
