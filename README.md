# Tea Subscription Service
[<img src="https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white"/>](https://www.ruby-lang.org/en/) 

[<img src="https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white"/>](https://rubyonrails.org/)

![Postman](https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white)

## Description

Tea Subscription Service is designed as an API to serve a Front End, and is designed to:

 - Create a Tea Subscription for a Customer
 - Cancel a Subscription
 - List all Subscriptions a Customer, whether active or canceled

## Database

The database for this project is included below:

![Screen Shot 2022-09-15 at 8 09 51 PM](https://user-images.githubusercontent.com/99222755/190529825-18f7f9e5-36f4-4e7f-86aa-33cbe2723fca.png)


## Getting Started

### Dependencies

Rails version for this project: Rails 7.0.4
Ruby version for this project: Ruby 2.7.4

Gems used:
- In the development, test block please add/ensure thefollow gems are listed:


  ``gem 'pry'``
  
  ``gem 'shoulda-matchers'``
    
    
- At the top level please ensure inclusion of:
  
  ``gem 'json'``
    
    
- In a test block, please add/ensure inclusion of:


  ``gem 'rspec-rails'``
  
  ``gem 'simplecov'``
    
After adding all the gems listed above please be sure to run:

``
$ bundle install
``

``
$ rails generate rspec:install
``

You will also need to run:
``
$ rails db:{drop,create,migrate,seed}
``
### Installing

In order to use or work on this repo, please clone down the repo from github and follow the gem install instructions above. 



### Executing program

 In order to make happy path api hits on Postman please
 
 * Run ``rails s`` from the root of the project in your terminal.
 * Open Postman
 * Run one of the following:
   - ``POST localhost:3000/api/v1/customers/#{yourcustomerIDhere}/subscriptions``
      + This will subscribe a user to a tea subscription. Please ensure you are sending a JSON body with the Subscription ID your customer is subscribing to.
      
       ![Screen Shot 2022-09-15 at 7 37 21 PM](https://user-images.githubusercontent.com/99222755/190527301-a2973e39-c9f4-43d1-b5c0-78a3754d0f23.png)
      + You can expect a response that looks like this:
      
       ![Screen Shot 2022-09-15 at 7 37 27 PM](https://user-images.githubusercontent.com/99222755/190527479-d2039455-afd5-4554-aad5-e4fdd926c691.png)
   - ``PUT localhost:3000/api/v1/customers/#{yourcustomerIDhere}/subscriptions``
     + This will cancel a users subscription. Please ensure you are sending a JSON body with the CustomerSubscription ID of the subscription you'd like to cancel.
     
      ![Screen Shot 2022-09-15 at 7 35 34 PM](https://user-images.githubusercontent.com/99222755/190527661-9e4ade25-a3e9-4280-9476-134b9084a3a7.png)
     + You can expect a response that looks like this:
     
      ![Screen Shot 2022-09-15 at 7 35 24 PM](https://user-images.githubusercontent.com/99222755/190527747-cc8f06f7-7341-4a36-be96-5d9dd5d0072d.png)

   - ``GET localhost:3000/api/v1/customers/#{yourcustomerIDhere}/subscriptions``
     + This endpoint does not require anything in the JSON body to function.
     + You can expect a response that looks like this:
     
      ![Screen Shot 2022-09-15 at 7 51 06 PM](https://user-images.githubusercontent.com/99222755/190527990-8e97b0fd-747a-438a-a51b-b6fd00d80236.png)


## Future Plans
I would like to add in the ability to resubscribe to a tea, and think this would be a small change to make that would add a lot of flexibility.
Other things I'd like to add in the future:
 - The ability to unsubcribe to all subscriptions at once.
 - The ability to list all teas and all subscription options.
 - The ability to search through tea types and subscriptions.

## Authors

[SaiHall](https://www.linkedin.com/in/sai-hall-503710237/)
