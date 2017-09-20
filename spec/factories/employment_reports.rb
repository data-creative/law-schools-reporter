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
    #total_employed 0
    #employment_types {
    #  :law_firms=>{:solo=>0, :step_10=>0, :step_25=>0, :step_50=>0, :step_100=>0, :step_250=>0, :step_500=>0, :over_500=>0, :unknown_size=>0},
    #  :business=>0,
    #  :government=>0,
    #  :public_interest=>0,
    #  :clerkships=>{:federal=>0, :state_local=>0, :other=>0},
    #  :academia=>0,
    #  :unknown_type=>0
    #}
    #employment_statuses {}
    #employment_locations:
    #  [{"label"=>"State of Largest Employment",
    #    "location"=>"New York",
    #    "count"=>154},
    #   {"label"=>"State of 2nd Largest Employment",
    #    "location"=>"Pennsylvania",
    #    "count"=>7},
    #   {"label"=>"State of 3rd Largest Employment",
    #    "location"=>"California",
    #    "count"=>4},
    #   {"label"=>"Employed in Foreign Countries",
    #    "location"=>"Foreign Countries",
    #    "count"=>0}],
  end
end
