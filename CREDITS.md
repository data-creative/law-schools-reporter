# Credits, Notes, and Reference

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
  "10-Feb", # needs to be resolved by re-exporting CSV files from their XLS sources
  "25-Nov", # needs to be resolved by re-exporting CSV files from their XLS sources
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

Total Graduates `TotalGraduatesNumber`) is equal to the sum of:

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
