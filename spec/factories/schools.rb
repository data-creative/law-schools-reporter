FactoryGirl.define do
  factory :school do
    sequence(:uuid){|n| 9000 + n }
    sequence(:long_name){|n| "MY SCHOOL #{n}, UNIVERSITY OF" }
    sequence(:name){|n| "MY SCHOOL #{n}" }
    year_founded 1929
    sequence(:url){|n| "http://law.my-school-#{n}.edu" }
    reports_url "N/A - NOT FOUND"
  end

  trait :with_reports do
      transient do
        report_years [2015, 2016, 2017]
      end

      after(:create) do |school, evaluator|
        evaluator.report_years.each do |year|
          create(:employment_report, school_uuid: school.uuid, year: year)
        end
      end
    end
end
