require 'rails_helper'

RSpec.describe Search, type: :model do
  subject do
    mock_user = User.new(
      name: 'John Doe',
      email: 'johndoe@gmail.com',
      password: '123456'
    )

    Search.new(
      query: 'Book',
      user: mock_user
    )

  end

  before do
    subject.save
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a query' do
    subject.query = nil
    expect(subject).to_not be_valid
  end
end
