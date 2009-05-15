require File.dirname(__FILE__) + '/../test_helper'

class ClientTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_full_name
    client = client(:company_client)
    assert_equal "heinz muller", client.full_name
  end

  def test_billed_bills
    client = client(:company_client)
    bills = client.bills
    bills.each do |b|
      assert_equal 1,b.state
      assert_equal client = b.client
    end
  end

  def test_admonished_bills
    client = client(:company_client)
    bills = client.bills
    bills.each do |b|
      assert_equal 2,b.state
      assert_equal client = b.client
    end
  end
end
