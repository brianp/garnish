require 'spec_helper'

describe "A Garnished Controller" do

  subject { TestController }

  it "should have the Garnish::Controller module already included" do
    subject.included_modules.include?(Garnish::Controller).should be_true
  end

  it "that calls the garnish marco should set the responder to Garnish::Responder" do
    subject.garnish
    subject.responder.should equal Garnish::Responder
  end

  it "should call respond_to with :html" do
    subject.should_receive(:respond_to).with(:html)
    subject.garnish
  end
end
