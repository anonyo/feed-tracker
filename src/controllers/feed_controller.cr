class FeedController < ApplicationController
  getter feed = Feed.new

  before_action do
    only [:destroy] { set_feed }
  end

  def index
    return unless (current_user = context.current_user) && current_user.feeds
    user_feeds = current_user.feeds.all
    render "index.slang"
  end

  def create
    feed = Feed.new feed_params.validate!
    if feed.save
      NotifcationJob.new(feed: feed).enqueue(in: 1.minute)
      redirect_to action: :index, flash: {"success" => "Created feed successfully."}
    else
      flash["danger"] = "Could not create Feed!"
      render "new.slang"
    end
  end

  def destroy
    feed.destroy
    redirect_to action: :index, flash: {"success" => "Deleted feed successfully."}
  end

  private def feed_params
    params.validation do
      required(:user_id) { |f| !f.empty? }
    end
  end

  private def set_feed
    @feed = Feed.find! params[:id]
  end
end
