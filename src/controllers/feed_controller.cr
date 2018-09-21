class FeedController < ApplicationController
  getter feed = Feed.new

  before_action do
    only [:destroy] { set_feed }
  end

  def index
    feeds = Feed.all
    render "index.slang"
  end

  def create
    feed = Feed.new feed_params.validate!
    return redirect_to action: :index, flash: {"success" => "Created feed successfully."} if feed.save
    flash["danger"] = "Could not create Feed!"
    render "new.slang"
  end

  def destroy
    feed.destroy
    redirect_to action: :index, flash: {"success" => "Deleted feed successfully."}
  end

  private def feed_params
    params.validation do
      required(:user_id) { |f| !f.nil? }
    end
  end

  private def set_feed
    @feed = Feed.find! params[:id]
  end
end
