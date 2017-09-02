module DonationsHelper
  def opttag(number)
    charset = Array('A'..'Z')
    Array.new(number) { charset.sample }.join
  end
end
