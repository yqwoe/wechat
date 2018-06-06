class HomeController < ApplicationController
  @@token = 'jerryishere'
  def index
    if check_signature?(params[:signature],params[:timestamp],params[:nonce])
      render text: params[:echostr]
    end
  end

  private
  def check_signature?(signature,timestamp,nonce)
    return false if !signature && !timestamp && !nonce
    Digest::SHA1.hexdigest([timestamp,nonce,@@token].sort.join) == signature
  end
end
