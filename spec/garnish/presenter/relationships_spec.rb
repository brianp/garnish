require 'spec_helper'

describe "A Presenter Relationship" do

  let(:test_class) { TestClass.new }
  before { TestClass.send :include, Garnish::Presenter::Relationships }

  it "should respond to the original method name of the relationships" do
    test_class.stub(:template => nil)
    test_class.users
  end

  it "should call convert on the records of the relationship" do
    test_class.should_receive(:convert)
    test_class.users
  end

  it "should alias the relationship methods" do
    test_class.respond_to?(:users_orig).should be_true
  end

end
