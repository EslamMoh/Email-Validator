module Api
  class EmailsController < ApplicationController
    def index
      response = MailValidator.validate_email(params[:email])
      render json: response, status: :ok, location: nil
    end
  end
end
