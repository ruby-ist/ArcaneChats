require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    User.create(name: "Joe", password: "password123")
  end

  subject { User.first }

  it "has encryption" do
    expect(subject.password).to be_nil
  end

  it "has authentication" do
    expect(subject.authenticate "password123" ).not_to be_falsey
  end
end
