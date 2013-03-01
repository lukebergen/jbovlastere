class ApiController < ApplicationController
  before_filter :authenticate!

  def current_user
    @current_user ||= begin
      token = request.headers["X-Jvsr-Authorization"] || params[:_token]
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
end
