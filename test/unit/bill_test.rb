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
end
