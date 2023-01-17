require "rails_helper"

RSpec.describe "Posts", type: :request do

    before do
        users= User.create(
            [
                {username:"seller1", password:"123", email:"seller1@gmail.com", role:"seller"},
                {username:"seller2", password:"123", email:"seller2@gmail.com", role:"seller"}
        
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



    end

    scenario "Sends a delete request to delete a purchase" do

        delete "http://localhost:3000/api/v1/carbon_credits/1"
        expect(response).to have_http_status(:success)
        

        get "http://localhost:3000/api/v1/carbon_credits"

        expect(response).to have_http_status(:success)
        carbon_credits = JSON.parse(response.body)
        expect(carbon_credits.length).to eq(5)

        

    end

end