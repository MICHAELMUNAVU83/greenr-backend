require "rails_helper"

RSpec.describe "Posts", type: :request do

    before do
     @user = User.create({username:"seller1", password:"123", email:"seller1@gmail.com", role:"seller"})



    end

    scenario "Sends a post request to create a carbon credit" do

        carbon_credit_params = {
            carbon_credit: {
                amount: "1 ton", price: 100, source: "trees",location:"Nairobi", image: "https://www.carbonfund.org/wp-content/uploads/2019/10/Carbon-Fund-Logo-1.png", approved: false, user_id: @user.id
            }
        }

        post "/api/v1/carbon_credits", params: carbon_credit_params

        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(carbon_credit_params[:carbon_credit][:amount]).to eq("1 ton")

        


    

    end
end