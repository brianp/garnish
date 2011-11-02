require 'spec_helper'

describe "A Presenter" do
  context "should initialize" do
    it "with record and no template" do
      TestClassPresenter.new(TestClass.new, nil).should be_true
    end
  end

  context "class should delgate" do
    subject { TestClassPresenter }

    it "method missing to non presenter class" do
      TestClass.should_receive(:test_method).and_raise(NoMethodError)
      lambda {subject.test_method}.should raise_error
    end
  end

  context "instance should" do
    before(:each) do
      @test_class = TestClass.new
      @test_presenter = TestClassPresenter.new(@test_class, nil)
      @test_presenter.record.should equal @test_class
    end

    subject { @test_presenter }

    context "delegate" do
      it "method missing to record if method is missing" do
        @test_class.should_receive(:test_method).and_return("Success!")
        subject.test_method.should match "Success!"
      end

      it "respond_to? to record if method doesn't exist" do
        @test_class.should_receive(:respond_to?).with(:test_method).and_return(true)
        subject.respond_to?(:test_method).should be_true
      end
    end

    context "not delegate" do
      it "respond_to? when methods exisits" do
        @test_class.should_not_receive(:respond_to?)
        subject.respond_to?(:respond_to?).should be_true
      end
    end

  end
end

