require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase 
  fixtures :orders
  test "received" do
    byebug
    mail = OrderMailer.received(orders(:one))
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /1 x Agile Web Development with Rails 5/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal "Pragmatic Store Order Shipped", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /<td>1&times;<\/td>\s*<td>Agile Web Development with Rails 5<\/td>/, mail.body.encoded
  end 
end
