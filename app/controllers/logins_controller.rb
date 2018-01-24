class LoginsController < ApplicationController
  require 'httparty'
  include Base64Helper

  def new
    @login = Login.new
  end

  def create
    #login_params[:image] =  file_to_url_safe_base64(login_params[:image])
    @login = Login.new(login_params)
    respond_to do |format|
        if @login.valid?
          @response = HTTParty.post(
            "#{API_HOST}/rest/login",
            :body => { email: @login.email, image: file_to_url_safe_base64(@login.image) }.to_json,
            :headers => {
              'Content-Type' => 'application/json',
              'User-Agent' => request.user_agent
            }
          )
          format.html { render status: @response.code }
        else
            format.html { render :new }
        end
    end
  end

  private
    def login_params
     params.require(:login).permit(:email, :image)
    end
end
