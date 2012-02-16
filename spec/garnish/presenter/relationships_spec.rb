require 'spec_helper'

describe Garnish::Presenter::Relationships do

  let(:test_class) { TestClass.new }
  before { test_class.extend Garnish::Presenter::Relationships }

  it "should respond to the original method name of the relationships" do
    test_class.stub(:template => nil)
    test_class.users
  end

  it "should call convert on the records of the relationship" do
    test_class.stub(:template => stub)
    Garnish::Collection.should_receive(:new)
    test_class.users
  end

  it "should alias the relationship methods" do
    test_class.respond_to?(:users_orig).should be_true
  end

end
