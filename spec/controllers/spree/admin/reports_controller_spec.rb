require 'spec_helper'

describe Spree::Admin::ReportsController do
  stub_authorization!

  describe 'advanced_reporting_setup' do
    [:unavailable_products].each do |report|
      context "when #{report}" do
        it "should register the report" do
          Spree::Admin::ReportsController.should_receive(:add_available_report!).with(report)
          controller.send(:advanced_reporting_setup)
        end

        it "should have a declared controller action" do
          controller.respond_to?(report)
        end
      end
    end
  end

  describe 'GET index' do
    context 'when introducing new reports' do
      it 'should be ok' do
        spree_get :index
        response.should be_ok
      end
    end
  end
end
