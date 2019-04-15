require "rails_helper"

RSpec.describe User, type: :model do
  context "account を指定しているとき" do
    let(:user) { create(:user) }

    it "ユーザーが作られる" do
      expect(user).to be_valid
    end
  end

  context "account を指定していないとき" do
    let(:user) { build(:user, account: nil) }

    it "エラーする" do
      user.valid?
      expect(user.errors.messages[:account]).to include "can't be blank"
    end
  end

  context "同名の account が存在するとき" do
    let(:user1) { create(:user, account: "account") }
    let(:user2) { build(:user, account: user1.account) }

    it "エラーする" do
      user2.valid?
      expect(user2.errors.messages[:account]).to include "has already been taken"
    end
  end
end
