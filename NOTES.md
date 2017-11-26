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

Can continue to exclude the following sub-count headers (for now), to reduce complexity:

  + `FULL TIME LONG TERM (FTLT)`
  + `FULL TIME SHORT TERM (FTST)`
  + `PART TIME LONG TERM (PTLT)`
  + `PART TIME SHORT TERM (PTST)`

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

The total number employed (`Total`) is equal to the sum of aforementioned "employed" employment statuses.

It is also equal to the sum of the following employment types:

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

### Investigation and Reconciliation of Headers

See results in `db/seeds/aba_employment_reports/header_reconciliation.csv` and optionally make use of that file during the parsing process. Moving forward for now with a somewhat more conditional but still sufficient approach.

### Investigation of Graduate-less Reports

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

Further-investigating these grad-less reports, they have erroneous location data:

```rb
EmploymentReport.where(:total_grads => 0).each do |report|
  puts "-------------------"
  puts "#{report.year} -- #{report.school_name}"
  #pp report.employment_types # all these counts are zero, as expected
  pp report.employment_locations # but these aren't, which is puzzling (sent an email to ABA about this)
end
```

### Investigation of Non-standard School Names

Some school names differ from year to year.

```rb
reports = EmploymentReport.with_grads.map{|report| {school_name: report.school_name, year: report.year}}
grps = reports.group_by{|report| report[:school_name]}
names_with_years = grps.map{|k,v| {school_name: k, years: v.map{|h| h[:year]} } }
names_with_years.each do |h|
  puts "#{h[:school_name]} -- #{h[:years]}"
end
```

A coping strategy might involve compiling a list of known school name aliases for each known school UUID. EDIT: see results in `db/seeds/batch_employment_reports/school_name_reconciliation.csv`.
