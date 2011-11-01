require 'spec_helper'

describe Garnish::Presenter do
  before(:each) do
    @record = TestClassPresenter.new(TestClass.new, nil)
  end
  subject { @record }

  it "Should pass" do
  end
end

