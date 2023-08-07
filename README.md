<h1>Lunch and learn</h1>

<h3>Getting started</h3>

- Ruby Version: 3.2.2

- Rails Version: 7.0.6

- Run `bundle install`
- Run `rails db:{drop,create,migrate,seed}`

<h3>Gems</h3>

- Authentication
  - bcrypt

- Testing
  - capybara
    - https://github.com/teamcapybara/capybara
  - launchy
    - https://www.rubydoc.info/gems/launchy/2.2.0 
  - simplecov
    - https://github.com/simplecov-ruby/simplecov 
  - vcr
    - https://github.com/vcr/vcr   
    
- General
  - faraday
    - https://lostisland.github.io/faraday/#/
  - figaro
    - used to hide API keys and store them in a git ignored file under config/application.yml   
    - https://github.com/laserlemon/figaro
  - jsonapi-serializer   
    - https://github.com/jsonapi-serializer/jsonapi-serializer

  <h3>APIs</h3>
- Running this locally requires you to have API keys
- Make sure to add `/config/application.yml` to your .gitignore
  - API ninja/ air quality
    - requires an api ninja account for api key
    - https://api-ninjas.com/api/airquality
    - store your API key as `air_quality: [API_KEY]` inside your application.yml file
  - Rest countries (retrieve country info)
    - does not require an api key
    - Documentation can be found here: https://restcountries.com/
  - Youtube API (search list)
    - requires an API key
    - Get started here: https://developers.google.com/youtube/v3/getting-started
    - search list api documentation can be found here https://developers.google.com/youtube/v3/docs/search/list
    - store your API key as `key: [API_KEY]` inside your application.yml file
  - Unsplash (photos)
    - requires an unsplash account and API key
    - You can register for an account here: https://unsplash.com/developers
    - store your unsplash API key as `unsplash_access: [API_KEY]` inside your application.yml file
  - Edamam API (recipes)
    - requires an account for API keys (application_id and application_key)
    - You can register for a API key here: https://developer.edamam.com/edamam-recipe-api
    - store application_id as `app_id: [APP_ID]` and application_key as `app_key: [APP_KEY]` inside your application.yml file
