require 'rails_helper'

RSpec.describe Article, type: :model do
  subject do
    mock_user = User.new(
      name: 'John Doe',
      email: 'johndoe@gmail.com',
      password: '123456'
    )

    Article.new(
      title: 'Article title',
      description: Faker::Lorem.paragraph_by_chars(number: 256),
      user: mock_user
    )
  end

  before do
    subject.save
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a title shorter than 5 characters' do
    subject.title = Faker::Lorem.characters(number: 4)
    expect(subject).to_not be_valid
  end

  it 'is not valid with a title longer than 100 characters' do
    subject.title = Faker::Lorem.characters(number: 101)
    expect(subject).to_not be_valid
  end

  it 'is not valid without a description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a description shorter than 10 characters' do
    subject.description = Faker::Lorem.characters(number: 9)
    expect(subject).to_not be_valid
  end

  it 'is not valid with a description longer than 500 characters' do
    subject.description = Faker::Lorem.characters(number: 501)
    expect(subject).to_not be_valid
  end

end
