class WechatsController < ApplicationController
  # For details on the DSL available within this file, see https://github.com/Eric-Guo/wechat#wechat_responder---rails-responder-controller-dsl
  wechat_responder

  def index
    p params
    if check_signature?(params[:signature],params[:timestamp],params[:nonce])
      return render json: params[:echostr]
    end
    # render json: {version: '1.0.0',name: '嘻唰唰'}
  end

  on :text do |request, content|
    request.reply.text "echo: #{content}" # Just echo
  end


  private
  def check_signature?(signature=nil,timestamp=nil,nonce=nil)
    return false if !signature && !timestamp && !nonce
    Digest::SHA1.hexdigest([timestamp,nonce,ENV['token']].sort.join) == signature
  end
end
