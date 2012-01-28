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

end
