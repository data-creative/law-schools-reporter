FactoryGirl.define do
  # consider providing a more thorough factory/trait which includes all counts present
  factory :employment_report do
    sequence(:school_name){|n| "MY LAW SCHOOL #{n}" }
    year 2016
    total_grads nil
    total_employed nil
    employment_statuses {}
    employment_types {}
    employment_locations []
  end

  trait :with_grads do
    total_grads 250
  end

  trait :with_employed_grads do
    total_grads 250
    total_employed 200
  end

  trait :without_grads do
    total_grads 0
  end
end
