## CREATE A USER (SIGN UP)

To create a user, you need to send a POST request to the api/v1/users endpoint with the following parameters:

`
{
    "user":
    {"username":"joshhhhh",
          "email":"joshuaaa",
          "role":"buyer",
          "password":"123456"
 }
}`

## LOGIN IN A USER (SIGN IN)

To login a user you need to send a POST request to the api/v1/login endpoint with the following parameters:

`{
"user":
{"username":"joshhhhh",

          "password":"123456"

}
}

`

## TO GET THE CURRENT USER

send a get to /api/v1/profile to get the current user with the token in the body

This is the response you get

`{
    "user": {
        "username": "joshhhhh",
        "email": "joshuaaa",
        "role": "buyer",
        "carbon_credits": [],
        "purchases": []
    }
}`

## Carbon Credits

To create a carbon credit, you need to send a POST request to the api/v1/carbon_credits endpoint with the following parameters:

`
{
"amount":"456789",
"price":100,
"source":"trees",
"image":"image1",
"user_id":2

}
`

To update a carbon credit to be approved, you need to send a PATCH request to the api/v1/carbon_credits/:id endpoint with the following parameters:

`{
    "approved":true
}`

To get all carbon credits, you need to send a GET request to the api/v1/carbon_credits endpoint

To get a carbon credit, you need to send a GET request to the api/v1/carbon_credits/:id endpoint

To delete a carbon credit, you need to send a DELETE request to the api/v1/carbon_credits/:id endpoint

## Purchases

To create a purchase, you need to send a POST request to the api/v1/purchases endpoint with the following parameters:

`
{
"buyer_phone_number":"074546577",
"buyer_location":"Nairobi",
"user_id":2,
"carbon_credit_id":1

}
`

To get your purchases, you need to send a GET request to the api/v1/purchases/:id endpoint

For the admin to get all purchases, you need to send a GET request to the api/v1/all_purchases endpoint
