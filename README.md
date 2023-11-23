# Tea Time - API

### Overview and learing goals

    The purpose of this project is to explore back-end data consumption of a simple API for tea subscriptions. There are three main enpoints: create a subscription, modify a subscriptions status, and retrieve subscriptions for a a given customer. 
  

### System dependencies
Gems: 
- Faraday
- bcrypt
- Jsonapi-serialiser
- Factory-bot-rails
- Faker


### Set up this repo
Step: 

1. Fork and clone this repository to your local machine
2. Run bundle install in the root directory of this project on your command line
3. Run rails db:{create, migrate, seed}
  - Note: Make sure to take a look at the seeds file. There are a few pre-populated seeds including one customer with a two subscriptions. Feel free to adjust seeds, and use factorybot/faker as needed to create fake data for testing. 

### Additional notes for consumption

- The current data sets a default price of a subscription to $20/subscription, and is irrelecant of the quantity or individual teas on the sunbscription. A further version of this API will provide a more dynamic approach to adding invidiual teas to a subscription to create customizeable subscriptions. 
- There are two default values using enums that should be noted. For the subscription model, both the status and and frequency are set to a default value of 0. This value respectively represents an "active" subscription, set at a "weekly" frequency. A subscription can only be set to active or cancelled, and frequencies can either be weekly, monthly or yearly. 


### Endpoints

1. POST "/api/v1/subscribe"
  - Takes a parameters of tea_id and customer_id through the request body.

successful response
```
{
    "message": "Subscription created successfully"
}
```

unsuccessful response
```
{
    "message": "Subscription not created, please try again"
}
```
- Note: this sad path response will be returned if either the tea_id is not found, or the customer if is not found

2. PATCH "/api/v1/cancel_subscription"
  - takes parameters in the request body of the subscription_id, and status. the status options are currently only 0 and 1 representing active and cancelled respectively. 
  - Returns a response indication whether the status was updated successfully or not. 

  successful repsonse
  ```
  {
    "message": "Subscription updated successfully"
}
  ```

  unsuccessful response
```
{
    "message": "Subscription not updated, please try again"
}

```
- note: since you are only passing the subscription_id, the unsuccessful response is solely based on that subscription being found the database. Since the subscription is a one-many relationship with customer(subscritpion beind the "many"), a subscription being modified should not need the user_id with this particular endpoint"

3. GET "/api/v1/subscriptions"
- Takes parameters in the request body for just a customer_id
- returns all subscriptions for that customer
  - note: this only return the subscriptions information, which does not include individual teas on that subscription. A subsequent version of this API will address individual teas either on this endpoint, or another endpoint. 

successful response
```
  {
    "data": [
        {
            "id": "1",
            "type": "subscriptions",
            "attributes": {
                "id": 1,
                "title": "Single Tea",
                "price": 20.0,
                "status": "active",
                "frequency": "weekly"
            }
        },
        {
            "id": "2",
            "type": "subscriptions",
            "attributes": {
                "id": 2,
                "title": "Single Tea",
                "price": 20.0,
                "status": "active",
                "frequency": "weekly"
            }
        }
      ]
    }
```

successful responses if a customer has no subscriptions(cancelled or not)

```
  {
    "message": "The customer has no subscriptions"
}
```

unsuccessful response if hte customer does not exist
```
{
    "message": "Customer not found"
}
```