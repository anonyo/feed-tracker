require "http/client"

class NotifcationJob < Mosquito::QueuedJob
  params feed : Feed | Nil

  def perform
    response = HTTP::Client.post(pushover_url, headers: nil, body: body)
  end

  private def user_token
    feed.user.pushover_token
  end

  private def body
    "token=#{pushover_api_key}&user=#{user_token}&title=Feed tracker&message=Time to feed the baby"
  end

  def pushover_url
    @pushover_url ||= Amber.settings.secrets["pushover_base_url"]
  end

  def pushover_api_key
    @pushover_api_key ||= Amber.settings.secrets["pushover_api_key"]
  end
end
