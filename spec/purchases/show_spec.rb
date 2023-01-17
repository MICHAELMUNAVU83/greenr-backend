require "rails_helper"

RSpec.describe "Posts", type: :request do

    before do

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
                amount: "1 ton", price: 100, source: "trees",location:"Nairobi", image: "https://www.carbonfund.org/wp-content/uploads/2019/10/Carbon-Fund-Logo-1.png", approved: false, user_id: 1 },
                {   
                    amount: "1 ton", price: 100, source: "trees", location:"Nairobi", image: "https://www.carbonfund.org/wp-content/uploads/2019/10/Carbon-Fund-Logo-1.png", approved: false, user_id: 1 },
                    {   
                        amount: "1 ton", price: 100, source: "trees", location:"Nairobi", image: "https://www.carbonfund.org/wp-content/uploads/2019/10/Carbon-Fund-Logo-1.png", approved: false, user_id: 1 },
            {
                 amount: "2 tonnes", price: 200, source: "trees", location:"Nairobi", image: "https://www.carbonfund.org/wp-content/uploads/2019/10/Carbon-Fund-Logo-1.png", approved: false, user_id: 2 },
                 {
                    amount: "2 tonnes", price: 200, source: "trees", location:"Nairobi", image: "https://www.carbonfund.org/wp-content/uploads/2019/10/Carbon-Fund-Logo-1.png", approved: false, user_id: 2 },
                    {
                        amount: "23 tonnes", price: 200, source: "trees",location:"Nairobi", image: "https://www.carbonfund.org/wp-content/uploads/2019/10/Carbon-Fund-Logo-1.png", approved: false, user_id: 2 }
        
        
        
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
        
              
        
        
        
            



    end

    scenario "gets the first purchase" do

        get "http://localhost:3000/api/v1/purchases/1"  

        expect(response).to have_http_status(:success)
        purchase= JSON.parse(response.body)
        expect(purchase["buyer_location"]).to eq("Nairobi")
      

    end

    scenario "gets the second purchase" do

        get "http://localhost:3000/api/v1/purchases/2"

        expect(response).to have_http_status(:success)
        purchase= JSON.parse(response.body)
        expect(purchase["buyer_location"]).to eq("Juja")
    end
end