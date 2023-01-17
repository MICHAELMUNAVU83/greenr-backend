require "rails_helper"

RSpec.describe "Posts", type: :request do

    before do
     @user = User.create({username:"seller1", password:"123", email:"seller1@gmail.com", role:"seller"})
     @carbon_credit = CarbonCredit.create({amount: "1 ton", price: 100, source: "trees",location:"Nairobi", image: "https://www.carbonfund.org/wp-content/uploads/2019/10/Carbon-Fund-Logo-1.png", approved: false, user_id: @user.id})



    end

    scenario "Sends a post request to create a purchase" do

        purchase_params = {
            purchase: {
                carbon_credit_id: @carbon_credit.id, user_id: @user.id
            }
        }


        post "/api/v1/purchases", params: purchase_params

        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(purchase_params[:purchase][:carbon_credit_id]).to eq(@carbon_credit.id)

        


    

    end
end