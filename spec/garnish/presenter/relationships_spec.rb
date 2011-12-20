require 'spec_helper'

describe "A Presenter Relationship" do

  context "instance" do

    before(:each) do
      @test_class = TestClass.new
      @template = Class.new
      @test_presenter = TestClassPresenter.new(@test_class, @template)
    end

    subject { @test_presenter }

    it "should have the records relationships defined" do
      subject.respond_to?(:users_p).should be_true
    end

  end

  context "class" do
    subject { TestClassPresenter }

    it "should return record_class" do
      subject.record_class.should equal TestClass
    end

    it "should not have the records relationships defined" do
      subject.respond_to?(:users).should be_false
    end
  end

end
