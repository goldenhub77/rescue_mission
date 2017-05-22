require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.create' do
    it 'user fails to commit' do
      user = User.create()
      expect(user.valid?).to eq(false)
      expect(user.errors.full_messages).to eq(["Provider can't be blank", "Uid can't be blank", "Nickname can't be blank", "Name can't be blank", "Avatar url can't be blank", "Avatar url is invalid", "Token can't be blank"])
    end

    it 'user commits successfully' do
      user = User.create(provider: "github", uid: "1234", nickname: "shipyard25", name: "John", email: "wowo88@yo.com", avatar_url: "http://www.testurl.com", token: "secret1234")
      expect(user.valid?).to eq(true)
    end
  end
end
