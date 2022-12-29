class Api::V1::CarbonCreditsController < ApplicationController
skip_before_action :authorized
rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        render json: CarbonCredit.all, include: [:user, :purchase], status: :ok
    end

    def create
        carbon_credit = CarbonCredit.create(carbon_credit_params)
        render json: carbon_credit, status: :created
    end

    def show
        render json: CarbonCredit.find(params[:id]), include: [:user], status: :ok
    end

    def update
        carbon_credit = CarbonCredit.find(params[:id])
        carbon_credit.update(carbon_credit_params)
        render json: carbon_credit, status: :accepted
    end

    def destroy
        carbon_credit = CarbonCredit.find(params[:id])
        carbon_credit.destroy
        head :no_content
    end

    private

    def carbon_credit_params
        params.require(:carbon_credit).permit(:amount, :price, :source, :image, :approved, :user_id)
    end

    def render_record_not_found_response
        render json: {errors: "Carbon credit does not exist"}, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

end
