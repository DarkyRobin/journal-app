require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should not save User without Email' do
    user = User.new
    user.username = 'ABigBaby'
    user.password = 'pass!@#'
    expect(user.save).to be_falsey
    expect(user.errors[:email]).to include("can't be blank")
  end
end

