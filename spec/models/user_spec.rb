require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    describe '#create' do

      describe 'presence_true' do

        it "is valid with a nickname, email, password, password_confirmation" do
          user = build(:user)
          expect(user).to be_valid
        end

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

        it "is invalid with a password that has less than 5 characters " do
          user = build(:user, password: "00000", password_confirmation: "00000")
          user.valid?
          expect(user.errors[:password]).to include("は6文字以上で入力してください")
        end

      end


      describe 'password' do

        it "is invalid with a password less than 6 in length" do
          user = build(:user, password: "a1234")
          user.valid?
          expect(user.errors[:password]).to include("は6文字以上で入力してください")
        end

        it "is invalid without a password_confirmation although with a password" do
          user = build(:user, password_confirmation: "")
          user.valid?
          expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
        end

      end


      describe 'email' do

        it "is invalid with a duplicate email address" do
          user = create(:user)
          another_user = build(:user)
          another_user.valid?
          expect(another_user.errors[:email]).to include("はすでに存在します")
        end

      end


    end
  end
end
