FactoryGirl.define do
  factory :employment_report do
    school_name "MY SCHOOL, UNIVERSITY OF"
    year 2016
    total_grads nil
    employment_statuses {}
    employment_types {}
    employment_locations {}
  end

  #trait :with_statuses do
  #  employment_statuses {...}
  #end

  #trait :with_types do
  #  employment_types {...}
  #end

  #trait :with_locations do
  #  employment_locations {...}
  #end

end
