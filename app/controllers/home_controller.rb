class HomeController < ApplicationController

  def index
    if check_signature?(params[:signature],params[:timestamp],params[:nonce])
      return render json: params[:echostr]
    end
  end

  private
  def check_signature?(signature=nil,timestamp=nil,nonce=nil)
    return false if !signature && !timestamp && !nonce
    Digest::SHA1.hexdigest([timestamp,nonce,ENV['token']].sort.join) == signature
  end
end
