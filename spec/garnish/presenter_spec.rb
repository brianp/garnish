require 'spec_helper'

describe "A Garnish Presenter" do

  let(:test_class) { TestClass.new }
  before { test_class.extend TestClassPresenter }

  it "should add the template attribute accessor" do
    test_class.template = 42
    test_class.template.should eq 42
  end

  it "should send missing methods to the view context" do
    test_class.template = stub(:template)
    test_class.template.should_receive(:this_call)
    test_class.this_call
  end

  it "should include Garnish::Presenter::Relationships when included" do
    test_class.eigenclass.included_modules.should include Garnish::Presenter::Relationships
  end
end
