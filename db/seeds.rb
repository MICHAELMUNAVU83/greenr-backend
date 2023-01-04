# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Seeding database..."

users= User.create(
    [
        {username:"seller1", password:"123", email:"seller1@gmail.com", role:"seller"},
        {username:"seller2", password:"123", email:"seller2@gmail.com", role:"seller"},
        {username:"buyer1" , password:"123", email:"buyer1@gmail.com", role:"buyer"},
        {username:"buyer2" , password:"123", email:"buyer2@gmail.com", role:"buyer"}

]
     
        
)



carbon_credits = CarbonCredit.create([
    {   
        amount: "1 ton", price: 100, source: "trees", image: "https://www.carbonfund.org/wp-content/uploads/2019/10/Carbon-Fund-Logo-1.png", approved: false, user_id: 1 },
        {   
            amount: "1 ton", price: 100, source: "trees", image: "https://www.carbonfund.org/wp-content/uploads/2019/10/Carbon-Fund-Logo-1.png", approved: false, user_id: 1 },
            {   
                amount: "1 ton", price: 100, source: "trees", image: "https://www.carbonfund.org/wp-content/uploads/2019/10/Carbon-Fund-Logo-1.png", approved: false, user_id: 1 },
    {
         amount: "2 tonnes", price: 200, source: "trees", image: "https://www.carbonfund.org/wp-content/uploads/2019/10/Carbon-Fund-Logo-1.png", approved: false, user_id: 2 },
         {
            amount: "2 tonnes", price: 200, source: "trees", image: "https://www.carbonfund.org/wp-content/uploads/2019/10/Carbon-Fund-Logo-1.png", approved: false, user_id: 2 },
            {
                amount: "23 tonnes", price: 200, source: "trees", image: "https://www.carbonfund.org/wp-content/uploads/2019/10/Carbon-Fund-Logo-1.png", approved: false, user_id: 2 }



])


purchases = Purchase.create([
    {buyer_phone_number: "123456789", buyer_location: "Nairobi", user_id: 3, carbon_credit_id: 1},
    {buyer_phone_number: "123456789", buyer_location: "Juja", user_id: 3, carbon_credit_id: 2},
    {buyer_phone_number: "123456789", buyer_location: "Nairobi", user_id: 3, carbon_credit_id: 1},
    {buyer_phone_number: "123456789", buyer_location: "Juja", user_id: 3, carbon_credit_id: 2},
    {buyer_phone_number: "123456789", buyer_location: "Nairobi", user_id: 4, carbon_credit_id: 3},
    {buyer_phone_number: "123456789", buyer_location: "Juja", user_id: 4, carbon_credit_id: 4},
    {buyer_phone_number: "123456789", buyer_location: "Nairobi", user_id: 4, carbon_credit_id: 3},
    {buyer_phone_number: "123456789", buyer_location: "Juja", user_id: 4, carbon_credit_id: 4},
   

])

puts "Seeding done!"