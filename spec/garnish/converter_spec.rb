require 'spec_helper'

describe "A Garnish Converter" do

  context "instance" do

    let(:template) { stub }
    let(:test_class) { TestClass.new }
    let(:responder) { TestResponder.new }

    context "with a template" do
      it "should take a record variable and include the presenter module" do
        responder.convert(test_class, template)
        test_class.eigenclass.included_modules.should include TestClassPresenter
      end

      it "should take an array of records and include the presenter module" do
        records = [test_class, TestClass.new, TestClass.new]
        responder.convert(records)
        records.map { |r| r.eigenclass.included_modules.should include TestClassPresenter }
      end
    end

    context "without a template" do
      it "should take a record variable and include the presenter module" do
       responder.convert(test_class)
       test_class.eigenclass.included_modules.should include TestClassPresenter
      end
    end
  end

  context "class" do
    let(:test_class) { TestClass }
    before { test_class.send :include, Garnish::Converter }

    it "should return true from module_exists if module exists" do
      test_class.module_exists?(:TestClassPresenter).should be_true
    end

    it "should return false from module_exists if module doesn't exists" do
      test_class.module_exists?(:BadClass).should be_false
    end
  end

end
