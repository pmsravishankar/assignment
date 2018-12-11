FactoryGirl.define do
  #Assets fields
  sequence :id do |n|
    "id-#{n}"
  end

  factory :asset do
    id
    eff_dt Time.now - 5.days
    html_string "<html><head></head><body>MyText</body></html>"
    ver_nbr "1"
    title "MyString"
    description "MyString"
  end
end
