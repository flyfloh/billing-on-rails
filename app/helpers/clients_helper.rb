module ClientsHelper
  
  def admonished_bills(client)
    unless client.admonished_bills.count.zero?
      content_tag('span', " + Admonished:&nbsp;#{client.admonished_bills.count}", :class => "admonished_bills")
    end
  end
end
