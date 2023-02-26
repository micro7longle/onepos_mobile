# User Story/Narrative
# As a store admin of OnePos's client named 'Alice'
# I want to update a category
# So that I can get new category as i want .

# Feature
@category @store-admin @update
Feature: Update categories
    As a store admin of OnePos's client named 'Alice'
    I want to update a category
    So that I can get new category as i want.

	Rule: 1. The system is working properly
		Background:
			Given Alice logged in
			And Category with filled data form openned

		Scenario: 1.1 submit a valid update category form
			When Alice submits a valid update category form
			Then Alice has a new update category
			And Alice receives an success message!  

		Scenario: 1.2 submits an invalid update category form	
			When Alice submits a invalid update category form
			Then Alice receives an error message!

		Scenario: 1.3 does not submit an update category form
			When Alice does not submit update category form
			Then Alice has no new category

	Rule: The system is not working properly

# APIs Contract

#Request: PUT/Category
{	
	header:{
		"Content-Type": "application/json"
	},
	body:{
    "categoryId": "required"
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
		"data":{}
	}
}