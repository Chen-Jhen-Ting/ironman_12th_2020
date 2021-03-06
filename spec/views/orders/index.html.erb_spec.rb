require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    @user = User.create
    assign(:orders, [
      Order.create!(
        name: "Name",
        status: "Status",
        total_price: 2,
        phone: "Phone",
        address: "Address",
        email: "Email",
        note: "Note",
        user: @user
      ),
      Order.create!(
        name: "Name",
        status: "Status",
        total_price: 2,
        phone: "Phone",
        address: "Address",
        email: "Email",
        note: "Note",
        user: @user
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Status".to_s, count: 2
    assert_select "tr>td", text: "Phone".to_s, count: 2
    assert_select "tr>td", text: "Address".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: "Note".to_s, count: 2
  end
end
