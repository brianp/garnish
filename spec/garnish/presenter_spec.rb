require 'spec_helper'

describe "A Garnish Presenter" do

  let(:test_class) { TestClass.new }

  it "should add the template attribute accessor" do

    test_class.extend(TestClassPresenter)
    test_class.template = 42
    test_class.template.should eq 42
  end
end
