# Notes from Report Analysis

## CSV Files

SEEDING EMPLOYMENT REPORTS:

   + 2011 -- 69 HEADERS -- 200/200 ROWS
   + 2012 -- 134 HEADERS -- 197/197 ROWS
   + 2013 -- 255 HEADERS -- 216/219 ROWS
   + 2014 -- 154 HEADERS -- 203/203 ROWS
   + 2015 -- 154 HEADERS -- 203/203 ROWS
   + 2016 -- 159 HEADERS -- 208/208 ROWS
   + 2017 -- 159 HEADERS -- 223/223 ROWS

```rb
row.headers #> [
  "SchoolName",

  "EmployedBarPassageRequiredFTLT",
  "EmployedBarPassageRequiredFTST",
  "EmployedBarPassageRequiredPTLT",
  "EmployedBarPassageRequiredPTST",
  "EmployedBarPassageRequiredNumber",
  "EmployedJDAdvantageFTLT",
  "EmployedJDAdvantageFTST",
  "EmployedJDAdvantagePTLT",
  "EmployedJDAdvantagePTST",
  "EmployedJDAdvantageNumber",
  "EmployedProfessionPositionFTLT",
  "EmployedProfessionPositionFTST",
  "EmployedProfessionPositionPTLT",
  "EmployedProfessionPositionPTST",
  "EmployedProfessionPositionNumber",
  "EmployedNonProfessionPositionFTLT",
  "EmployedNonProfessionPositionFTST",
  "EmployedNonProfessionPositionPTLT",
  "EmployedNonProfessionPositionPTST",
  "EmployedNonProfessionPositionNumber",
  "EmployedLawSchoolFTLT",
  "EmployedLawSchoolFTST",
  "EmployedLawSchoolPTLT",
  "EmployedLawSchoolPTST",
  "EmployedLawSchoolNumber",
  "EmployedUndeterminableFTLT",
  "EmployedUndeterminableFTST",
  "EmployedUndeterminablePTLT",
  "EmployedUndeterminablePTST",
  "EmployedUndeterminableNumber",
  "EmployedPursuingGraduateDegreeNumber",

  "UnEmployedStartDateDeferredNumber",
  "UnEmployedNotSeekingNumber",
  "UnEmployedSeekingNumber",

  "EmploymentStatusUnknownNumber",

  "TotalGraduatesNumber",

  "Funded_BarPassgeFullTimeLongTerm",
  "Funded_BarPassgeFullTimeShortTerm",
  "Funded_BarPassgePartTimeLongTerm",
  "Funded_BarPassgePartTimeShortTerm",
  "Funded_BarPassgeTotalEmployed",
  "Funded_JDAdvantageFullTimeLongTerm",
  "Funded_JDAdvantageFullTimeShortTerm",
  "Funded_JDAdvantagePartTimeLongTerm",
  "Funded_JDAdvantagePartTimeShortTerm",
  "Funded_JDAdvantageTotalEmployed",
  "Funded_ProfessionFullTimeLongTerm",
  "Funded_ProfessionFullTimeShortTerm",
  "Funded_ProfessionPartTimeLongTerm",
  "Funded_ProfessionPartTimeShortTerm",
  "Funded_ProfessionTotalEmployed",
  "Funded_NonProfessionFullTimeLongTerm",
  "Funded_NonProfessionFullTimeShortTerm",
  "Funded_NonProfessionPartTimeLongTerm",
  "Funded_NonProfessionPartTimeShortTerm",
  "Funded_NonProfessionTotalEmployed",
  "Funded_TotFullTimeLongTerm",
  "Funded_TotFullTimeShortTerm",
  "Funded_TotPartTimeLongTerm",
  "Funded_TotPartTimeShortTerm",
  "Funded_TotTotalEmployed",
  "Solo-FTLT",
  "Solo-FTST",
  "Solo-PTLT",
  "Solo-PTST",
  "Solo",
  "2-10-FTLT",
  "2-10-FTST",
  "2-10-PTLT",
  "2-10-PTST",
  "10-Feb",
  "11-25-FTLT",
  "11-25-FTST",
  "11-25-PTLT",
  "11-25-PTST",
  "25-Nov",
  "26-50-FTLT",
  "26-50-FTST",
  "26-50-PTLT",
  "26-50-PTST",
  "26-50",
  "51-100-FTLT",
  "51-100-FTST",
  "51-100-PTLT",
  "51-100-PTST",
  "51-100",
  "101-250-FTLT",
  "101-250-FTST",
  "101-250-PTLT",
  "101-250-PTST",
  "101-250",
  "251-500-FTLT",
  "251-500-FTST",
  "251-500-PTLT",
  "251-500-PTST",
  "251-500",
  "501-FTLT",
  "501-FTST",
  "501-PTLT",
  "501-PTST",
  "501-PLUS",
  "Unknown-FTLT",
  "Unknown-FTST",
  "Unknown-PTLT",
  "Unknown-PTST",
  "Unknown",
  "BusinessIndustry-FTLT",
  "BusinessIndustry-FTST",
  "BusinessIndustry-PTLT",
  "BusinessIndustry-PTST",
  "BusinessIndustry",
  "Government-FTLT",
  "Government-FTST",
  "Government-PTLT",
  "Government-PTST",
  "Government",
  "PublicInterest-FTLT",
  "PublicInterest-FTST",
  "PublicInterest-PTLT",
  "PublicInterest-PTST",
  "PublicInterest",
  "Federal-FTLT",
  "Federal-FTST",
  "Federal-PTLT",
  "Federal-PTST",
  "Federal",
  "StateLocal-FTLT",
  "StateLocal-FTST",
  "StateLocal-PTLT",
  "StateLocal-PTST",
  "StateLocal",
  "Other-FTLT",
  "Other-FTST",
  "Other-PTLT",
  "Other-PTST",
  "Other",
  "Academia-FTLT",
  "Academia-FTST",
  "Academia-PTLT",
  "Academia-PTST",
  "Academia",
  "UnknownEmployerType-FTLT",
  "UnknownEmployerType-FTST",
  "UnknownEmployerType-PTLT",
  "UnknownEmployerType-PTST",
  "UnknownEmployerType",
  "Total-FTLT",
  "Total-FTST",
  "Total-PTLT",
  "Total-PTST",
  "Total",
  "FirstLargestEmployment",
  "FirstLargestEmploymentNumber",
  "SecondLargestEmployment",
  "SecondLargestEmploymentNumber",
  "ThirdLargestEmployment",
  "ThirdLargestEmploymentNumber",
  "EmployedInForeignCountries"
]
```

Can continue to exclude the following sub-counts (for now), to reduce complexity:

  + FULL TIME LONG TERM (FTLT)
  + FULL TIME SHORT TERM (FTST)
  + PART TIME LONG TERM (PTLT)
  + PART TIME SHORT TERM (PTST)

Can also get rid of headers with the `Funded_` prefix

```rb
headers = row.headers.reject{|header|
  header.include?("FTLT") || header.include?("FTST") ||
  header.include?("PTLT") || header.include?("PTST") ||
  header.include?("FullTimeLongTerm") || header.include?("FullTimeShortTerm") ||
  header.include?("PartTimeLongTerm") || header.include?("PartTimeShortTerm") ||
  header.include?("Funded_")
}
```

Edit:

```rb
headers = row.headers.compact.reject{ |header|
  header.include?("FTLT") || header.include?("FTST") ||
  header.include?("PTLT") || header.include?("PTST") ||
  header.include?("FullTimeLongTerm") || header.include?("FullTimeShortTerm") ||
  header.include?("PartTimeLongTerm") || header.include?("PartTimeShortTerm") ||
  header.include?("Funded_") ||
  header.include?(" LT") || header.include?(" ST") || # 2011 only
  header.include?("Long Term") || header.include?("Short Term") # 2011 only
} # use `.compact` to get rid of ~2000 nil columns in year 2013
```

So the new list of headers (maybe more manageable) is:

```rb
[
  "SchoolName",

  "EmployedBarPassageRequiredNumber",
  "EmployedJDAdvantageNumber",
  "EmployedProfessionPositionNumber",
  "EmployedNonProfessionPositionNumber",
  "EmployedLawSchoolNumber",
  "EmployedUndeterminableNumber",
  "EmployedPursuingGraduateDegreeNumber",
  "UnEmployedStartDateDeferredNumber",
  "UnEmployedNotSeekingNumber",
  "UnEmployedSeekingNumber",
  "EmploymentStatusUnknownNumber",
  "TotalGraduatesNumber",

  "Solo",
  "10-Feb", # this should be "2-10". when I open the XLS file in Numbers, this header is what I see. So now I'm thinking this is a result of a faulty manual CSV export process by the webmaster. A manual mistake like this would strengthen the case for an API.
  "25-Nov", # this should be "11-25". when I open the XLS file in Numbers, this header is what I see. So now I'm thinking this is a result of a faulty manual CSV export process by the webmaster. A manual mistake like this would strengthen the case for an API.
  "26-50",
  "51-100",
  "101-250",
  "251-500",
  "501-PLUS",
  "Unknown",
  "BusinessIndustry",
  "Government",
  "PublicInterest",
  "Federal",
  "StateLocal",
  "Other",
  "Academia",
  "UnknownEmployerType",
  "Total",

  "FirstLargestEmployment",
  "FirstLargestEmploymentNumber",
  "SecondLargestEmployment",
  "SecondLargestEmploymentNumber",
  "ThirdLargestEmployment",
  "ThirdLargestEmploymentNumber",
  "EmployedInForeignCountries"
]
```

### Employment Statuses

Total Graduates (`TotalGraduatesNumber`) is equal to the sum of:

  + `EmployedBarPassageRequiredNumber` (employed)
  + `EmployedJDAdvantageNumber` (employed)
  + `EmployedProfessionPositionNumber` (employed)
  + `EmployedNonProfessionPositionNumber` (employed)
  + `EmployedLawSchoolNumber` (employed)
  + `EmployedUndeterminableNumber` (employed)
  + `EmployedPursuingGraduateDegreeNumber` (employed)
  + `UnEmployedStartDateDeferredNumber`
  + `UnEmployedNotSeekingNumber`
  + `UnEmployedSeekingNumber`
  + `EmploymentStatusUnknownNumber`

### Employment Types

The total number employed (`Total`) is equal to the sum of aforementioned "employed" employment statuses, as well as the sum of the following employment types:

  + `Solo`
  + `10-Feb` should be ("2-10")
  + `25-Nov` should be ("11-25")
  + `26-50`
  + `51-100`
  + `101-250`
  + `251-500`
  + `501-PLUS`
  + `Unknown`
  + `BusinessIndustry`
  + `Government`
  + `PublicInterest`
  + `Federal`
  + `StateLocal`
  + `Other`
  + `Academia`
  + `UnknownEmployerType`

### Investigation of Headers

```rb
# 2011:
exclude " LT", " ST", "Long Term", and "Short Term"

"university"
"yr"
"Number Employed"
"Purs Grad Deg FT"
"Unempl Not Seek"
"Unemployed Seek"
"Emp Status Unk"
"Total Graduates"
"Law Schl Funded"

"Emp Solo"
"Emp 2-10"
"Emp 11-25"
"Emp 26-50"
"Emp 51-100"
"Emp 101-250"
"Emp 251-500"
"Emp 501+"
"Emp Type Unk"
"Bus & Ind"
"Government"
"Public Interest"
"Federal"
"State & local"
"Academia"
"Emp Type Unk"
"Tot Emp Type"

"State 1 Lrgst Emp"
"State 1 Lrgst Emp Num"
"State 2 Lrgst Emp"
"State 2 Lrgst Emp Num"
"State 3 Lrgst Emp"
"State 3 Lrgst Emp Num"
"Emp Forgn Countries"


# 2012:

[
  "SchoolName",
  "EmployedBarPassageRequiredNumber",
  "EmployedJDAdvantageNumber",
  "EmployedProfessionPositionNumber",
  "EmployedNonProfessionPositionNumber",
  "EmployedUndeterminableNumber",
  "EmployedPursuingGraduateDegreeNumber",
  "UnEmployedStartDateDeferredNumber",
  "UnEmployedNotSeekingNumber",
  "UnEmployedSeekingNumber",
  "EmploymentStatusUnknownNumber",
  "TotalGraduatesNumber",
  "Funded Position",

  "Solo",
  "2-10",
  "11-25",
  "26-50",
  "51-100",
  "101-250",
  "251-500",
  "501-PLUS",
  "Unknown",
  "BusinessIndustry",
  "Government",
  "PublicInterest",
  "Federal",
  "StateLocal",
  "Other",
  "Academia",
  "UnknownEmployerType Total",
  "Total",

  "FirstLargestEmployment",
  "FirstLargestEmploymentNumber",
  "SecondLargestEmployment",
  "SecondLargestEmploymentNumber",
  "ThirdLargestEmployment",
  "ThirdLargestEmploymentNumber",
  "EmployedInForeignCountries"
]

# 2013:
[
  "SchoolName",
  "EmployedBarPassageRequiredNumber",
  "EmployedJDAdvantageNumber",
  "EmployedProfessionPositionNumber",
  "EmployedNonProfessionPositionNumber",
  "EmployedUndeterminableNumber",
  "EmployedPursuingGraduateDegreeNumber",
  "UnEmployedStartDateDeferredNumber",
  "UnEmployedNotSeekingNumber",
  "UnEmployedSeekingNumber",
  "EmploymentStatusUnknownNumber",
  "TotalGraduatesNumber",
  "Solo",
  "2-10",
  "11-25",
  "26-50",
  "51-100",
  "101-250",
  "251-500",
  "501-PLUS",
  "Unknown",
  "BusinessIndustry",
  "Government",
  "PublicInterest",
  "Federal",
  "StateLocal",
  "Other",
  "Education",
  "UnknownEmployerType",
  "Total",
  "FirstLargestEmployment",
  "FirstLargestEmploymentNumber",
  "SecondLargestEmployment",
  "SecondLargestEmploymentNumber",
  "ThirdLargestEmployment",
  "ThirdLargestEmploymentNumber",
  "EmployedInForeignCountries"
]

# 2014:
[
  "SchoolName",
  "EmployedBarPassageRequiredNumber",
  "EmployedJDAdvantageNumber",
  "EmployedProfessionPositionNumber",
  "EmployedNonProfessionPositionNumber",
  "EmployedUndeterminableNumber",
  "EmployedPursuingGraduateDegreeNumber",
  "UnEmployedStartDateDeferredNumber",
  "UnEmployedNotSeekingNumber",
  "UnEmployedSeekingNumber",
  "EmploymentStatusUnknownNumber",
  "TotalGraduatesNumber",
  "Solo",
  "10-Feb",
  "25-Nov",
  "26-50",
  "51-100",
  "101-250",
  "251-500",
  "501-PLUS",
  "Unknown",
  "BusinessIndustry",
  "Government",
  "PublicInterest",
  "Federal",
  "StateLocal",
  "Other",
  "Academia",
  "UnknownEmployerType",
  "Total",
  "FirstLargestEmployment",
  "FirstLargestEmploymentNumber",
  "SecondLargestEmployment",
  "SecondLargestEmploymentNumber",
  "ThirdLargestEmployment",
  "ThirdLargestEmploymentNumber",
  "EmployedInForeignCountries"
]

# 2015:

[
  "SchoolName",
  "EmployedBarPassageRequiredNumber",
  "EmployedJDAdvantageNumber",
  "EmployedProfessionPositionNumber",
  "EmployedNonProfessionPositionNumber",
  "EmployedUndeterminableNumber",
  "EmployedPursuingGraduateDegreeNumber",
  "UnEmployedStartDateDeferredNumber",
  "UnEmployedNotSeekingNumber",
  "UnEmployedSeekingNumber",
  "EmploymentStatusUnknownNumber",
  "TotalGraduatesNumber",
  "Solo",
  "2-10",
  "11-25",
  "26-50",
  "51-100",
  "101-250",
  "251-500",
  "501-PLUS",
  "Unknown",
  "BusinessIndustry",
  "Government",
  "PublicInterest",
  "Federal",
  "StateLocal",
  "Other",
  "Academia",
  "UnknownEmployerType",
  "Total",
  "FirstLargestEmployment",
  "FirstLargestEmploymentNumber",
  "SecondLargestEmployment",
  "SecondLargestEmploymentNumber",
  "ThirdLargestEmployment",
  "ThirdLargestEmploymentNumber",
  "EmployedInForeignCountries"
]

# 2016:

[
  "SchoolName",
  "EmployedBarPassageRequiredNumber",
  "EmployedJDAdvantageNumber",
  "EmployedProfessionPositionNumber",
  "EmployedNonProfessionPositionNumber",
  "EmployedLawSchoolNumber",
  "EmployedUndeterminableNumber",
  "EmployedPursuingGraduateDegreeNumber",
  "UnEmployedStartDateDeferredNumber",
  "UnEmployedNotSeekingNumber",
  "UnEmployedSeekingNumber",
  "EmploymentStatusUnknownNumber",
  "TotalGraduatesNumber",
  "Solo",
  "10-Feb",
  "25-Nov",
  "26-50",
  "51-100",
  "101-250",
  "251-500",
  "501-PLUS",
  "Unknown",
  "BusinessIndustry",
  "Government",
  "PublicInterest",
  "Federal",
  "StateLocal",
  "Other",
  "Academia",
  "UnknownEmployerType",
  "Total",
  "FirstLargestEmployment",
  "FirstLargestEmploymentNumber",
  "SecondLargestEmployment",
  "SecondLargestEmploymentNumber",
  "ThirdLargestEmployment",
  "ThirdLargestEmploymentNumber",
  "EmployedInForeignCountries"
]

# 2017:

[
  "SchoolName",
  "EmployedBarPassageRequiredNumber",
  "EmployedJDAdvantageNumber",
  "EmployedProfessionPositionNumber",
  "EmployedNonProfessionPositionNumber",
  "EmployedLawSchoolNumber",
  "EmployedUndeterminableNumber",
  "EmployedPursuingGraduateDegreeNumber",
  "UnEmployedStartDateDeferredNumber",
  "UnEmployedNotSeekingNumber",
  "UnEmployedSeekingNumber",
  "EmploymentStatusUnknownNumber",
  "TotalGraduatesNumber",
  "Solo",
  "10-Feb",
  "25-Nov",
  "26-50",
  "51-100",
  "101-250",
  "251-500",
  "501-PLUS",
  "Unknown",
  "BusinessIndustry",
  "Government",
  "PublicInterest",
  "Federal",
  "StateLocal",
  "Other",
  "Academia",
  "UnknownEmployerType",
  "Total",
  "FirstLargestEmployment",
  "FirstLargestEmploymentNumber",
  "SecondLargestEmployment",
  "SecondLargestEmploymentNumber",
  "ThirdLargestEmployment",
  "ThirdLargestEmploymentNumber",
  "EmployedInForeignCountries"
]
```

### Reconciliation and Standardization of Headers

See results in `db/seeds/batch_employment_reports/header_reconciliation.csv` and optionally make use of that file during the parsing process. Moving forward for now with a somewhat more conditional but still sufficient approach.


### Analysis of Results

#### Grad-less Reports

The following reports were found to have zero total graduates. This might be worth investigating further, but at the moment I'm comfortable excluding them from the reporting universe.

school_name	|	year	|	total_grads	|	total_employed
---	|	---	|	---	|	---
AMERICAN JUSTICE	|	2013	|	0	|	0
AMERICAN JUSTICE	|	2017	|	0	|	0
BELMONT UNIVERSITY	|	2013	|	0	|	0
BELMONT UNIVERSITY	|	2014	|	0	|	0
CONCORDIA LAW SCHOOL	|	2013	|	0	|	0
EUGENIO MARIA DE HOSTOS SCHOOL OF LAW	|	2013	|	0	|	0
EUGENIO MARIA DE HOSTOS SCHOOL OF LAW	|	2017	|	0	|	0
GENERIC UNIVERSITY SCHOOL OF LAW	|	2017	|	0	|	0
HAMLINE UNIVERSITY	|	2017	|	0	|	0
INDIANA TECH	|	2017	|	0	|	0
JUDGE ADVOCATE GENERAL'S SCHOOL	|	2013	|	0	|	0
JUDGE ADVOCATE GENERAL'S SCHOOL	|	2017	|	0	|	0
LINCOLN MEMORIAL	|	2013	|	0	|	0
LINCOLN MEMORIAL	|	2014	|	0	|	0
PEKING CHINA	|	2013	|	0	|	0
PEKING CHINA	|	2017	|	0	|	0
PENNSYLVANIA STATE UNIVERSITY	|	2016	|	0	|	0
PENNSYLVANIA STATE UNIVERSITY	|	2017	|	0	|	0
RUTGERS UNIVERSITY-CAMDEN	|	2016	|	0	|	0
RUTGERS UNIVERSITY-CAMDEN	|	2017	|	0	|	0
RUTGERS UNIVERSITY-NEWARK	|	2016	|	0	|	0
RUTGERS UNIVERSITY-NEWARK	|	2017	|	0	|	0
THOMAS M. COOLEY LAW SCHOOL - ANN ARBOR	|	2013	|	0	|	0
THOMAS M. COOLEY LAW SCHOOL - ANN ARBOR	|	2017	|	0	|	0
THOMAS M. COOLEY LAW SCHOOL - TAMPA BAY	|	2013	|	0	|	0
THOMAS M. COOLEY LAW SCHOOL - TAMPA BAY	|	2017	|	0	|	0
THOMAS M. COOLEY SCHOOL OF LAW - AUBURN HILLS	|	2013	|	0	|	0
THOMAS M. COOLEY SCHOOL OF LAW - AUBURN HILLS	|	2017	|	0	|	0
THOMAS M. COOLEY SCHOOL OF LAW - GRAND RAPIDS	|	2013	|	0	|	0
THOMAS M. COOLEY SCHOOL OF LAW - GRAND RAPIDS	|	2017	|	0	|	0
THOMAS M. COOLEY SCHOOL OF LAW - LANSING	|	2013	|	0	|	0
THOMAS M. COOLEY SCHOOL OF LAW - LANSING	|	2017	|	0	|	0
THOMAS M. COOLEY SCHOOL OF LAW – MICHIGAN	|	2017	|	0	|	0
UNIVERSITY OF THE DISTRICT OF COLUMBIA	|	2013	|	0	|	0
UNIVERSITY OF THE DISTRICT OF COLUMBIA	|	2017	|	0	|	0
UNT DALLAS COLLEGE OF LAW	|	2016	|	0	|	0
UNT DALLAS COLLEGE OF LAW	|	2017	|	0	|	0
WILLIAM MITCHELL COLLEGE OF LAW	|	2017	|	0	|	0

Further-investigating these grad-less reports:

```rb
EmploymentReport.where(:total_grads => 0).each do |report|
  puts "-------------------"
  puts "#{report.year} -- #{report.school_name}"
  #pp report.employment_types # all these counts are zero, as expected
  pp report.employment_locations # but these aren't, which is puzzling (see output below)
end

#>
=begin
-------------------
2013 -- AMERICAN JUSTICE
[{"label"=>"State of Largest Employment",
  "location"=>"New York",
  "count"=>154},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"Pennsylvania",
  "count"=>7},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"California",
  "count"=>4},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2013 -- BELMONT UNIVERSITY
[{"label"=>"State of Largest Employment", "location"=>"Texas", "count"=>117},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"Oklahoma",
  "count"=>2},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"California",
  "count"=>1},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2013 -- CONCORDIA LAW SCHOOL
[{"label"=>"State of Largest Employment",
  "location"=>"New York",
  "count"=>316},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"California",
  "count"=>34},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"District Of Columbia",
  "count"=>32},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2013 -- EUGENIO MARIA DE HOSTOS SCHOOL OF LAW
[{"label"=>"State of Largest Employment", "location"=>"Georgia", "count"=>121},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"New York",
  "count"=>24},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"Florida",
  "count"=>22},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2013 -- JUDGE ADVOCATE GENERAL'S SCHOOL
[{"label"=>"State of Largest Employment",
  "location"=>"Illinois",
  "count"=>273},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"Alabama",
  "count"=>3},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"Florida",
  "count"=>3},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2013 -- LINCOLN MEMORIAL
[{"label"=>"State of Largest Employment", "location"=>"Virginia", "count"=>32},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"North Carolina",
  "count"=>6},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"Florida",
  "count"=>3},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2013 -- PEKING CHINA
[{"label"=>"State of Largest Employment",
  "location"=>"New York",
  "count"=>140},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"New Jersey",
  "count"=>16},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"Connecticut",
  "count"=>13},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2013 -- THOMAS M. COOLEY LAW SCHOOL - ANN ARBOR
[{"label"=>"State of Largest Employment",
  "location"=>"Michigan",
  "count"=>223},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"Illinois",
  "count"=>24},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"Florida",
  "count"=>19},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2013 -- THOMAS M. COOLEY LAW SCHOOL - TAMPA BAY
[{"label"=>"State of Largest Employment",
  "location"=>"Michigan",
  "count"=>223},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"Illinois",
  "count"=>24},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"Florida",
  "count"=>19},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2013 -- THOMAS M. COOLEY SCHOOL OF LAW - AUBURN HILLS
[{"label"=>"State of Largest Employment",
  "location"=>"Michigan",
  "count"=>223},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"Illinois",
  "count"=>24},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"Florida",
  "count"=>19},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2013 -- THOMAS M. COOLEY SCHOOL OF LAW - GRAND RAPIDS
[{"label"=>"State of Largest Employment",
  "location"=>"Michigan",
  "count"=>223},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"Illinois",
  "count"=>24},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"Florida",
  "count"=>19},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2013 -- THOMAS M. COOLEY SCHOOL OF LAW - LANSING
[{"label"=>"State of Largest Employment",
  "location"=>"Michigan",
  "count"=>223},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"Illinois",
  "count"=>24},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"Florida",
  "count"=>19},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2013 -- UNIVERSITY OF THE DISTRICT OF COLUMBIA
[{"label"=>"State of Largest Employment", "location"=>"Nevada", "count"=>117},
 {"label"=>"State of 2nd Largest Employment", "location"=>"Utah", "count"=>4},
 {"label"=>"State of 3rd Largest Employment", "location"=>"Texas", "count"=>2},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2014 -- BELMONT UNIVERSITY
[{"label"=>"State of Largest Employment", "location"=>"Texas", "count"=>135},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"Michigan",
  "count"=>2},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"Oklahoma",
  "count"=>2},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2014 -- LINCOLN MEMORIAL
[{"label"=>"State of Largest Employment", "location"=>"Virginia", "count"=>30},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"Florida",
  "count"=>4},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"District Of Columbia",
  "count"=>3},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2016 -- PENNSYLVANIA STATE UNIVERSITY
[{"label"=>"State of Largest Employment", "location"=>"New York", "count"=>97},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"New Jersey",
  "count"=>10},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"Connecticut",
  "count"=>8},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2016 -- RUTGERS UNIVERSITY-CAMDEN
[{"label"=>"State of Largest Employment",
  "location"=>"New Jersey",
  "count"=>263},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"New York",
  "count"=>55},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"Pennsylvania",
  "count"=>25},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2016 -- RUTGERS UNIVERSITY-NEWARK
[{"label"=>"State of Largest Employment",
  "location"=>"New Jersey",
  "count"=>263},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"New York",
  "count"=>55},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"Pennsylvania",
  "count"=>25},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2016 -- UNT DALLAS COLLEGE OF LAW
[{"label"=>"State of Largest Employment", "location"=>"Nevada", "count"=>106},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"California",
  "count"=>4},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"Arizona",
  "count"=>1},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2017 -- AMERICAN JUSTICE
[{"label"=>"State of Largest Employment",
  "location"=>"New York",
  "count"=>126},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"New Jersey",
  "count"=>3},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"District of Columbia",
  "count"=>2},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2017 -- EUGENIO MARIA DE HOSTOS SCHOOL OF LAW
[{"label"=>"State of Largest Employment", "location"=>"Georgia", "count"=>136},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"New York",
  "count"=>35},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"Florida",
  "count"=>17},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2017 -- GENERIC UNIVERSITY SCHOOL OF LAW
[{"label"=>"State of Largest Employment",
  "location"=>"New York",
  "count"=>298},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"New Jersey",
  "count"=>10},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"California",
  "count"=>6},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2017 -- HAMLINE UNIVERSITY
[{"label"=>"State of Largest Employment",
  "location"=>"Washington",
  "count"=>58},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"Arizona",
  "count"=>5},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"California",
  "count"=>4},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2017 -- INDIANA TECH
[{"label"=>"State of Largest Employment",
  "location"=>"Illinois",
  "count"=>109},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"California",
  "count"=>7},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"Missouri",
  "count"=>6},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2017 -- JUDGE ADVOCATE GENERAL'S SCHOOL
[{"label"=>"State of Largest Employment",
  "location"=>"Illinois",
  "count"=>218},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"California",
  "count"=>4},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"Indiana",
  "count"=>4},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2017 -- PEKING CHINA
[{"label"=>"State of Largest Employment",
  "location"=>"New York",
  "count"=>128},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"New Jersey",
  "count"=>15},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"Connecticut",
  "count"=>6},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2017 -- PENNSYLVANIA STATE UNIVERSITY
[{"label"=>"State of Largest Employment",
  "location"=>"Pennsylvania",
  "count"=>44},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"Florida",
  "count"=>4},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"New York",
  "count"=>4},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2017 -- RUTGERS UNIVERSITY-CAMDEN
[{"label"=>"State of Largest Employment",
  "location"=>"New Jersey",
  "count"=>238},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"New York",
  "count"=>32},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"Pennsylvania",
  "count"=>17},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2017 -- RUTGERS UNIVERSITY-NEWARK
[{"label"=>"State of Largest Employment",
  "location"=>"New Jersey",
  "count"=>238},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"New York",
  "count"=>32},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"Pennsylvania",
  "count"=>17},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2017 -- THOMAS M. COOLEY LAW SCHOOL - ANN ARBOR
[{"label"=>"State of Largest Employment",
  "location"=>"Michigan",
  "count"=>181},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"Florida",
  "count"=>71},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"Illinois",
  "count"=>16},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2017 -- THOMAS M. COOLEY LAW SCHOOL - TAMPA BAY
[{"label"=>"State of Largest Employment",
  "location"=>"Michigan",
  "count"=>181},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"Florida",
  "count"=>71},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"Illinois",
  "count"=>16},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2017 -- THOMAS M. COOLEY SCHOOL OF LAW - AUBURN HILLS
[{"label"=>"State of Largest Employment",
  "location"=>"Michigan",
  "count"=>181},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"Florida",
  "count"=>71},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"Illinois",
  "count"=>16},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2017 -- THOMAS M. COOLEY SCHOOL OF LAW - GRAND RAPIDS
[{"label"=>"State of Largest Employment",
  "location"=>"Michigan",
  "count"=>181},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"Florida",
  "count"=>71},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"Illinois",
  "count"=>16},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2017 -- THOMAS M. COOLEY SCHOOL OF LAW - LANSING
[{"label"=>"State of Largest Employment",
  "location"=>"Michigan",
  "count"=>181},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"Florida",
  "count"=>71},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"Illinois",
  "count"=>16},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2017 -- THOMAS M. COOLEY SCHOOL OF LAW – MICHIGAN
[{"label"=>"State of Largest Employment",
  "location"=>"Michigan",
  "count"=>181},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"Florida",
  "count"=>71},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"Illinois",
  "count"=>16},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2017 -- UNIVERSITY OF THE DISTRICT OF COLUMBIA
[{"label"=>"State of Largest Employment", "location"=>"Nevada", "count"=>100},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"District of Columbia",
  "count"=>1},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"Illinois",
  "count"=>1},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2017 -- UNT DALLAS COLLEGE OF LAW
[{"label"=>"State of Largest Employment", "location"=>"Nevada", "count"=>100},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"District of Columbia",
  "count"=>1},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"Illinois",
  "count"=>1},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
-------------------
2017 -- WILLIAM MITCHELL COLLEGE OF LAW
[{"label"=>"State of Largest Employment", "location"=>"Virginia", "count"=>67},
 {"label"=>"State of 2nd Largest Employment",
  "location"=>"District of Columbia",
  "count"=>33},
 {"label"=>"State of 3rd Largest Employment",
  "location"=>"New York",
  "count"=>16},
 {"label"=>"Employed in Foreign Countries",
  "location"=>"Foreign Countries",
  "count"=>0}]
=end
```
