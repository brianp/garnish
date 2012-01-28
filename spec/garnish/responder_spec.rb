require 'spec_helper'

describe "The Garnished Responder" do

  let(:responder) { Garnish::Responder.new(controller, resources) }
  let(:formats) { stub(:formats, :first => nil) }
  let(:controller) { stub(:controller, :request => nil, :formats => formats, :view_context => nil) }
  let(:resources) { stub(:resources, :last => nil) }

  it "should have the Garnish::Converter module included" do
    Garnish::Responder.included_modules.include?(Garnish::Converter).should be_true
  end

  context "with params" do
    before { responder.stub(:template => nil) }

    it "should call default render" do
      responder.should_receive(:default_render)
      responder.to_html
    end

    it "should call convert" do
      responder.stub(:default_render => nil)
      responder.should_receive(:convert).at_least(:once)
      responder.to_html
    end
  end
end

