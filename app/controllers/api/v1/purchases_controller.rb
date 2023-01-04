class Api::V1::PurchasesController < ApplicationController
    skip_before_action :authorized
    rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
        def index
            all_purchases = Purchase.all.includes(:user)
            render json: all_purchases ,include: [:carbon_credit, :user], status: :ok
          
        end


        def my_purchases
            my_purchases = Purchase.where(user_id: params[:user_id])
            render json: my_purchases, include: [:carbon_credit, :user], status: :ok
          
        end
    
        def create
            purchase = Purchase.create(purchase_params)
            render json: purchase, status: :created
        end
    
        def show
            render json: Purchase.find(params[:id]), include: [:carbon_credit, :user], status: :ok
        end
    
        private
    
        def purchase_params
            params.require(:purchase).permit(:buyer_phone_number, :buyer_location, :carbon_credit_id, :user_id)
        end
    
        def render_record_not_found_response
            render json: {errors: "Transaction does not exist"}, status: :not_found
        end
    
        def render_unprocessable_entity_response(invalid)
            render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
        end

end
