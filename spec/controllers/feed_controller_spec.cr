require "./spec_helper"

def feed_hash
  {}
end

def feed_params
  params = [] of String
  params.join("&")
end

def create_feed
  model = Feed.new(feed_hash)
  model.save
  model
end

class FeedControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe FeedControllerTest do
  subject = FeedControllerTest.new

  it "renders feed index template" do
    Feed.clear
    response = subject.get "/feeds"

    response.status_code.should eq(200)
    response.body.should contain("feeds")
  end

  it "renders feed show template" do
    Feed.clear
    model = create_feed
    location = "/feeds/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Feed")
  end

  it "renders feed new template" do
    Feed.clear
    location = "/feeds/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Feed")
  end

  it "renders feed edit template" do
    Feed.clear
    model = create_feed
    location = "/feeds/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Feed")
  end

  it "creates a feed" do
    Feed.clear
    response = subject.post "/feeds", body: feed_params

    response.headers["Location"].should eq "/feeds"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a feed" do
    Feed.clear
    model = create_feed
    response = subject.patch "/feeds/#{model.id}", body: feed_params

    response.headers["Location"].should eq "/feeds"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a feed" do
    Feed.clear
    model = create_feed
    response = subject.delete "/feeds/#{model.id}"

    response.headers["Location"].should eq "/feeds"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
