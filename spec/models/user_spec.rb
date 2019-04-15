require 'rails_helper'

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
    let!(:user) { create(:user, account: "account") }

    it "エラーする" do
      user = build(:user, account: "account")
      user.valid?
      expect(user.errors.messages[:account]).to include "has already been taken"
    end
  end

end
