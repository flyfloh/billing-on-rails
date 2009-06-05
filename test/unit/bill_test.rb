require File.dirname(__FILE__) + '/../test_helper'

class BillTest < Test::Unit::TestCase
   fixtures :bills
  
  def test_should_return_tax_hash
    bill = bills(:bill_has_one_position)
    correct_hash = { 19 => 190 }
    assert_equal correct_hash, bill.tax_to_h
    bill = bills(:bill_has_multiple_taxes)
    correct_hash = { 7 => 0.7, 19 => 20.9 }
    assert_equal correct_hash, bill.tax_to_h
  end

  def should_return_open_bills
    bills = Bill.open_bills
    bills.each() { |b| assert_equal 0,b.state }
  end

#  def should_return_billed_bills
#    bills = Bill.closed_bills
#    bills.each() { |b| assert_equal 1,b.state }
#  end

  def should_return_paid_bills
    bills = Bill.paid_bills
    bills.each() { |b| assert_equal 3,b.state }
  end

  def test_net_total
    bill = bills(:bill_has_multiple_taxes)
    assert_equal 120, bill.net_total
    bill = bills(:bill_has_one_position)
    assert_equal 1000,bill.net_total
  end

  def test_sales_total
    bill = bills(:bill_has_multiple_taxes)
    assert_equal 21.6, bill.sales_total
    bill = bills(:bill_has_one_position)
    assert_equal 190,bill.sales_total
  end

  def test_gross_total
    bill = bills(:bill_has_multiple_taxes)
    assert_equal 141.6, bill.gross_total
    bill = bills(:bill_has_one_position)
    assert_equal 1190,bill.gross_total
  end


end
