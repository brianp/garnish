require 'spec_helper'

describe "The Garnished Responder" do

  subject { Garnish::Responder }

  it "should have the Garnish::Converter module included" do
    subject.included_modules.include?(Garnish::Converter).should be_true
  end

end

