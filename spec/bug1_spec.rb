require 'bug_1'

RSpec.describe "say_hello method" do
  it "should return hello kay" do
    expect(say_hello("kay")).to eq "hello kay"
  end
end