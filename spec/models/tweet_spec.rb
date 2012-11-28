require 'spec_helper'

describe Tweet do

  describe ".tweet" do

    let(:tweet) { Tweet.new(Fabricate(:post, title: 'a new post')) }

    it "returns a tweet message" do
      tweet.tweet.should =~ /a new post published. see it here:/
    end
  end


  describe ".full_post_url" do

    let(:tweet) { Tweet.new(Fabricate(:post, title: 'some title')) }

    it "returns a full url for a given post" do
      tweet.full_post_url.should == "http://localhost:3000.com/posts/some-title"
    end

  end


  describe "#user_twitter_account" do

    let!(:user) { Fabricate(:user, oauth_token: '12345', oauth_token_secret: '54321') }
    let!(:post) { Fabricate(:post, publish_time: Time.now, user: user) }
    let(:tweet) { Tweet.new(post) }

    it "returns a new twitter client" do
      tweet.user_twitter_account.kind_of?(Twitter::Client).should be_true
    end

  end

  describe "user oauth" do

    let!(:user) { Fabricate(:user, oauth_token: '12345', oauth_token_secret: '54321') }
    let!(:post) { Fabricate(:post, publish_time: Time.now, user: user) }
    let(:tweet) { Tweet.new(post) }

    it "returns user oauth token" do
      tweet.user_oauth_token.should == "12345"
    end

    it "returns user oauth secret" do
      tweet.user_oauth_secret.should == "54321"
    end

  end

end
