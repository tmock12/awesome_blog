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


  end

  describe "validations" do

    let(:post) { Post.new(publish_time: 1.day.ago) }

    it "validates presence of title" do
      post.should have(1).errors_on(:title)
    end

    it "validates presence of content" do
      post.should have(1).errors_on(:content)
    end

    it "validates publish time is in the future" do
      post.should have(1).errors_on(:publish_time)
    end

    it "validates presence of user" do
      post.should have(1).errors_on(:user)
    end

  end

end
