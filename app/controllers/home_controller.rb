class HomeController < ApplicationController

  def index
    p params
    if check_signature?(params[:signature],params[:timestamp],params[:nonce])
      return render json: params[:echostr]
    end
    # render json: {version: '1.0.0',name: '嘻唰唰'}
  end

  def create
    p params
  end

  private
  def check_signature?(signature=nil,timestamp=nil,nonce=nil)
    return false if !signature && !timestamp && !nonce
    Digest::SHA1.hexdigest([timestamp,nonce,ENV['token']].sort.join) == signature
  end
end
