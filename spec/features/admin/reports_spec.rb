require 'spec_helper'

describe "Advanced Reports" do
  stub_authorization!

  context 'unavailable_products' do
    context "visiting the admin reports page" do
      it "should have the right content" do
        visit spree.admin_path
        click_link Spree.t(:reports)
        click_link Spree.t(:unavailable_products)
      
        page.should have_content(Spree.t(:advanced_reporting_id))
        page.should have_content(Spree.t(:advanced_reporting_name))
      end
    end

    context "searching the admin reports page" do
      it "should allow me to search for reports" do
        visit spree.admin_path
        click_link Spree.t(:reports)
        click_link Spree.t(:unavailable_products) 

        fill_in "q_created_at_gt", :with => 1.week.ago
        fill_in "q_created_at_lt", :with => 1.week.from_now
        click_button Spree.t(:search)
      end
  end
  end
end
