require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
  User.new(
      name: 'John Doe',
      email: 'johndoe@gmail.com',
      password: '123456'
    )
  end

  before do
    subject.save
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a name longer than 25 characters' do
    subject.name = Faker::Lorem.characters(number: 26)
    expect(subject).to_not be_valid
  end

  it 'is not valid with a name shorter than 3 characters' do
    subject.name = Faker::Lorem.characters(number: 2)
    expect(subject).to_not be_valid
  end

  it 'is not valid with a non-valid email' do
    subject.email = 'johndoe'
    expect(subject).to_not be_valid
  end
end
