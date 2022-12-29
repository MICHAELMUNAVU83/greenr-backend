class Api::V1::CarbonCreditsController < ApplicationController

    def index
        render json: CarbonCredit.all, status: :ok
    end

end
