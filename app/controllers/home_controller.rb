class HomeController < ApplicationController

  def index

   render json: {version: '1.0.0'}
  end

  def create
    Rails.logger.info params
  end

  private
  def check_signature?(signature=nil,timestamp=nil,nonce=nil)
    return false if !signature && !timestamp && !nonce
    Digest::SHA1.hexdigest([timestamp,nonce,ENV['token']].sort.join) == signature
  end
end
