FactoryGirl.define do
  factory :school do
    url "http://www.law.school.edu/"
    name "A LAW SCHOOL"
    year 1961
    uuid nil
    alt_names []
  end

  trait :with_uuid do
    uuid 194
  end

  trait :with_alt_names do
    alt_names ["ALTERNATE LAW SCHOOL", "OTHER RELATED NAME"]
  end
end
