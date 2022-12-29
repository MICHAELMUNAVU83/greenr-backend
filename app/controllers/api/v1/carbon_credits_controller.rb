class Api::V1::CarbonCreditsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        render json: CarbonCredit.all, status: :ok
    end

    def create
        carbon_credit = CarbonCredit.new(carbon_credit_params)
        carbon_credit.assign_attributes(user_id: decoded_token[0]['user_id'])
        carbon_credit.save
        render json: carbon_credit, status: :created
    end

    def update
        carbon_credit = CarbonCredit.find(params[:id])
        carbon_credit.update(carbon_credit_params)
        render json: carbon_credit, status: :accepted
    end

    private

    def carbon_credit_params
        params.require(:carbon_credit).permit(:amount, :price, :source, :image)
    end

    def render_record_not_found_response
        render json: {errors: "Carbon credit does not exist"}, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

end
