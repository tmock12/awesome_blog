require 'spec_helper'

describe User do

  TWITTER_RESPONSE = {"provider"=>"twitter",
                      "uid"=>"54321",
                      "info"=> {"nickname"=>"Tmock12"},
                      "credentials" => { "token" => "1234", "secret" => "4321" },
                      "extra" => { "raw_info" => { "time_zone" => "Bucharest" } }
                      }

  describe '.create_from_omniauth' do
    it "creates a new user from omniauth hash" do
      new_user = User.create_from_omniauth(TWITTER_RESPONSE)
      new_user.name.should == "Tmock12"
    end
  end

  describe '.from_omniauth' do

    context 'user exists in the database' do
      let!(:user) { Fabricate(:user, uid: "54321", name: "dingle") }

      it "returns an existing user" do
        found_user = User.from_omniauth(TWITTER_RESPONSE)
        found_user.name.should == user.name
      end
    end

    context 'user does not exit in database' do

      it "creates a new user" do
        expect {
          User.from_omniauth(TWITTER_RESPONSE)
        }.to change(User, :count).by(1)
      end
    end

  end

  describe "time zone" do

    it "defaults to eastern time" do
      Time.zone.name.should == "Eastern Time (US & Canada)"
    end

    it "stores a users time zone" do
      user_from_bucharest = User.create_from_omniauth(TWITTER_RESPONSE)
      user_from_bucharest.time_zone.should == "Bucharest"
    end

  end
end
