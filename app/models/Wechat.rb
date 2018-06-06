class Wechat
  attr_reader :access_token
  class << self
    def access_token
      @access_token = $redis.get("access_token")
      puts @access_token
      if @access_token.blank?
        resp = RestClient.get("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=#{ENV['appid']}&secret=#{ENV['secret']}", {accept: :json})
        body = JSON.parse(resp.body)
        @access_token = body["access_token"]
        $redis.set("access_token",@access_token)
        $redis.expire("access_token",body["expires_in"].to_i)
      end
      return @access_token
    end

    def send_message(text)
      body = RestClient.post("https://api.weixin.qq.com/cgi-bin/message/mass/sendall?access_token=#{access_token}",{
          "filter" => {
              "is_to_all" => false,
              "tag_id"=>2
          },
          "text"=>{
              "content" => "CONTENT"
          },
          "msgtype" => "text"
      }.to_json, {content_type: :json, accept: :json})
      puts body
    end
  end
end