require 'spec_helper'

describe "A Garnished Controller" do

  subject { TestController }

  it "should have the garnish method defined" do
    subject.respond_to?(:garnish).should be_true
  end

  it "should set the responder to Garnish::Responder" do
    subject.garnish
    subject.responder.should equal Garnish::Responder
  end
end


