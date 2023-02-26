# User Story/Narrative
# As a store admin of OnePos's client named 'Alice'
# I want to create category
# So that I can classify products.

# Feature
@category @store-admin @create
Feature: Create category
	As a store admin of OnePos's client named 'Alice' 
	I want to create a new product category 
	So that I can classify products.

	Rule: 1. The system is working properly
		Background:
			Given Alice logged in
			And Category form openned

		Scenario: 1.1 submit a valid category form
			When Alice submits a valid category form
			Then Alice has a new category
			And Alice receives an success message!

		Scenario: 1.2 submits an invalid category form	
			When Alice submits a invalid category form
			Then Alice receives an error message!

		Scenario: 1.3 does not submit category form
			When Alice does not submit category form
			Then Alice has no new category

	Rule: The system is not working properly

# APIs Contract

#Request: POST/Categories
{	
	header:{
		"Content-Type": "application/json"
	},
	body:{
		"categoryName":  "required, no blank, max is 500 chars",
		"parentCategoryId": "",
		"description":  "max is 5000 chars",
	}
}
#Response:
{
	header:{
		"Content-Type": "application/json"
	},
	body:{
		"statusCode": 200,
		"statusMessage": "",
		"data":{
			"categoryId": "",
			"categoryName":  "",
			"parentCategoryId": "", 
			"description":  "",
		}
	}
}