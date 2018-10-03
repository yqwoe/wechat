class WechatsController < ApplicationController
  before_action :set_wechat, only: [:show, :update, :destroy]

  # GET /wechats
  def index
    if check_signature?(params[:signature],params[:timestamp],params[:nonce])
      return render json: params[:echostr]
    end
  end

  # GET /wechats/1
  def show
    render json: @wechat
  end

  # POST /wechats
  def create
    @wechat = Wechat.new(wechat_params)

    if @wechat.save
      render json: @wechat, status: :created, location: @wechat
    else
      render json: @wechat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wechats/1
  def update
    if @wechat.update(wechat_params)
      render json: @wechat
    else
      render json: @wechat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /wechats/1
  def destroy
    @wechat.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wechat
      @wechat = Wechat.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def wechat_params
      params.fetch(:wechat, {})
    end

  def check_signature?(signature=nil,timestamp=nil,nonce=nil)
    return false if !signature && !timestamp && !nonce
    Digest::SHA1.hexdigest([timestamp,nonce,ENV['token']].sort.join) == signature
  end
end
