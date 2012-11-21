require 'spec_helper'

describe Post do

  describe "#set_published_attribute" do

    context "for a post set to be published in the future" do
      let!(:post) { Fabricate(:post, publish_time: (Time.now + 1.day)) }

      it "sets the published attribute to false" do
        post.published.should be_false
      end
    end

    context "for a post set to be published now" do
      let!(:post) { Fabricate(:post, publish_time: Time.now) }

      it "sets the published attribute to true" do
        post.published.should be_true
      end
    end

    describe "#user_twitter_account" do
      let(:user) { Fabricate(:user, oauth_token: '12345', oauth_token_secret: '54321') }
      let(:post) { Fabricate(:post, publish_time: Time.now, user: user) }

      it "returns a new twitter client" do
        post.user_twitter_account.kind_of?(Twitter::Client).should be_true
      end
    end

  end

end
