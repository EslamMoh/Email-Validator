  class EmailsController < ApplicationController
    def new
    end
    def create
    	@response = MailValidator.validate_email(params[:validate_email][:email])
    end
  end