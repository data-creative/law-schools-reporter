FactoryGirl.define do
  factory :school do
    sequence(:uuid){|n| 9000 + n }
    sequence(:long_name){|n| "MY SCHOOL #{n}, UNIVERSITY OF" }
    sequence(:name){|n| "MY SCHOOL #{n}" }
    year_founded 1929
    sequence(:url){|n| "http://law.my-school-#{n}.edu" }
    reports_url "N/A - NOT FOUND"
  end
end
