class Api::V1::CarbonCreditsController < ApplicationController

    def index
        render json: CarbonCredit.all, status: :ok
    end

    def create
        carbon_credit = CarbonCredit.create(carbon_credit_params)
        render json: carbon_credit, status: :created
    end

    private

    def carbon_credit_params
        params.require(:carbon_credit).permit(:amount, :price, :source, :image, :user_id)
    end

end
