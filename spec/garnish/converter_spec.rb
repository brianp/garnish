require 'spec_helper'

describe "A Garnish Converter" do

  context "instance" do

    before(:each) do
      @test_class = TestClass.new
      @template = Class.new
      @test_presenter = TestClassPresenter.new(@test_class, @template)
    end

    subject { @test_presenter }

    it "should return true from class_exists if class exists" do
      subject.class_exists?(:TestClassPresenter).should be_true
    end

    it "should return false from class_exists if class doesn't exists" do
      subject.class_exists?(:BadClass).should be_false
    end

    context "with a template" do
      it "should take a record variable and wrap it in a presenter if a presenter exists" do
        presenter = subject.convert(@test_class, @template)
        presenter.class.should equal TestClassPresenter
        presenter.record.should equal @test_class
      end
    end

    context "without a template" do
      it "should take a record variable and wrap it in a presenter if a presenter exists" do
        presenter = subject.convert(@test_class)
        presenter.class.should equal TestClassPresenter
        presenter.record.should equal @test_class
        presenter.template.should equal @template
      end
    end
  end

  context "class" do
    subject { TestClassPresenter }

    it "should return true from class_exists if class exists" do
      subject.class_exists?(:TestClassPresenter).should be_true
    end

    it "should return false from class_exists if class doesn't exists" do
      subject.class_exists?(:BadClass).should be_false
    end
  end

end
