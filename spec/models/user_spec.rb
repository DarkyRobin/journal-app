require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(username: 'john_doe', email: 'john@example.com', password: 'secure_password')
    expect(user).to be_valid
  end

  it 'is not valid without a username' do
    user = User.new(email: 'john@example.com', password: 'secure_password')
    expect(user).to_not be_valid
  end

  it 'is not valid without an email' do
    user = User.new(username: 'john_doe', password: 'secure_password')
    expect(user).to_not be_valid
  end

  it 'is not valid without a password' do
    user = User.new(username: 'john_doe', email: 'john@example.com')
    expect(user).to_not be_valid
  end
end

