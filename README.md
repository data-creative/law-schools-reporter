# Law Schools Reporter API

Use the web service live in production at https://law-school-reporter.herokuapp.com/.

## Resources

### Schools

Example Requests:

  + GET `api/v1/schools`
  + GET `api/v1/schools/:uuid`

Example Response:

```js
{
	"uuid": 2,
	"long_name": "ALABAMA, UNIVERSITY OF",
	"name": "ALABAMA",
	"year_founded": 1926,
	"url": "http://www.law.ua.edu/",
	"reports_url": "https://www.law.ua.edu/admissions/aba-required-disclosures/."
}
```

### Employment Reports

Example Requests:

  + GET `api/v1/employment_reports`
  + GET `api/v1/employment_reports?years[]=2016&years[]=2017&schools[]=25&schools[]=36`

Example Response:

```js
[{
	"school_uuid": 25,
	"reported_school_name": "YALE UNIVERSITY",
	"year": 2017,
	"total_grads": 203,
	"total_employed": 194,
	"employment_types": {
		"law_firms": {
			"solo": 0,
			"step_10": 1,
			"step_25": 1,
			"step_50": 1,
			"step_100": 1,
			"step_250": 8,
			"step_500": 6,
			"over_500": 65,
			"unknown_size": 0
		},
		"business": 8,
		"government": 8,
		"public_interest": 18,
		"clerkships": {
			"federal": 69,
			"state_local": 1,
			"other": 2
		},
		"academia": 5,
		"unknown_type": 0
	},
	"employment_statuses": {},
	"employment_locations": [{
		"label": "State of Largest Employment",
		"location": "New York",
		"count": 63
	}, {
		"label": "State of 2nd Largest Employment",
		"location": "District of Columbia",
		"count": 40
	}, {
		"label": "State of 3rd Largest Employment",
		"location": "California",
		"count": 23
	}, {
		"label": "Employed in Foreign Countries",
		"location": "Foreign Countries",
		"count": 8
	}]
}]
```

## [Contributing](/CONTRIBUTING.md)
## [License](/LICENSE.md)
