FactoryGirl.define do
  # consider providing a more thorough factory/trait which includes all counts present
  # consider providing a trait which includes a school_uuid and matching school factory
  factory :employment_report do
    school_uuid nil
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
