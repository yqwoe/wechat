class HomeController < ApplicationController
  @@token = 'jerryishere'
  def index
    if check_signature?(params[:signature],params[:timestamp],params[:nonce])
      render json: params[:echostr]
    end
    render json: 'hello word!'
  end

  private
  def check_signature?(signature=nil,timestamp=nil,nonce=nil)
    return false if !signature && !timestamp && !nonce
    Digest::SHA1.hexdigest([timestamp,nonce,@@token].sort.join) == signature
  end
end
