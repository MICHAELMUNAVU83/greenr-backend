class Api::V1::PurchasesController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
        def index
            render json: Purchase.all, status: :ok
        end
    
        def create
            purchase = Purchase.new(purchase_params)
    
            #Add user ID from JWT token to carbon credit record before saving
            purchase.assign_attributes(user_id: decoded_token[0]['user_id'])
            purchase.save
            render json: purchase, status: :created
        end
    
        def show
            render json: Purchase.find(params[:id]), status: :ok
        end
    
        private
    
        def purchase_params
            params.require(:purchase).permit(:buyer_phone_number, :buyer_location, :carbon_credit_id)
        end
    
        def render_record_not_found_response
            render json: {errors: "Transaction does not exist"}, status: :not_found
        end
    
        def render_unprocessable_entity_response(invalid)
            render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
        end

end
