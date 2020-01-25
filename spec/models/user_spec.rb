require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    describe '#create' do

      describe 'presence_true' do

        it "is invalid without a nickname" do
          user = build(:user, nickname: "")
          user.valid?
          expect(user.errors[:nickname]).to include("を入力してください")
        end

        it "is invalid without an email" do
          user = build(:user, email: "")
          user.valid?
          expect(user.errors[:email]).to include("を入力してください")
        end

        it "is invalid without a password" do
          user = build(:user, password: nil)
          user.valid?
          expect(user.errors[:password]).to include("を入力してください")
        end

      end


      describe 'password' do

        it "is invalid with a password less than 6 in length" do
          user = build(:user, password: "a1234")
          user.valid?
          expect(user.errors[:password]).to include("は6文字以上で入力してください")
        end

      end

    end
  end
end
