class ApiController < ApplicationController
  respond_to :json

  before_filter :set_default_response_format
  before_filter :set_default_response_headers

  before_filter :authenticate!

  def current_user
    @current_user ||= begin
      token = request.headers["x-jvsr-authorization"] || params[:_token]
      if token.blank?
        raise ::JbovlastereError::ApiKeyNotSupplied
      end
      key = ApiKey.where(token: token).first
      if (key.nil?)
        raise JbovlastereError::ApiKeyNotFound
      end
      key
    end
    @current_user
  end

  def authenticate!
    # for starters, just having a valid user is all that matters
    # we can worry about rate-limiting and such later.
    current_user
  end

  def set_default_response_format
    request.format = :json if params[:format].blank?
  end

  def set_default_response_headers
    {
      "Access-Control-Allow-Origin" => "*", 
      "Access-Control-Allow-Methods" => "OPTIONS, GET, POST, PUT, DELETE",
      "Access-Control-Max-Age" => '1000', 
      "Access-Control-Allow-Credentials" => "true",
      'Access-Control-Allow-Headers' => 'x-jvsr-authorization, Content-Type'
    }.each do |key, value|
      response.headers[key] = value
    end
  end

end
