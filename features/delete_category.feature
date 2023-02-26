# User Story/Narrative
# As a store admin of OnePos's client named 'Alice'
# I want to delete a category
# So that I can remove an unnecessary category.

# Feature
@category @store-admin @delete
Feature: Delete category
    As a store admin of OnePos's client named 'Alice'
    I want to delete a category
    So that I can remove an unnecessary category.

	Rule: 1. The system is working properly
		Background:
			Given Alice logged in
			And Deleted category is already existed

		Scenario: 1.1 Valid Request
			When I send a valid request to delete category
      Then Category is removed
      And I receive a successful message.

		Scenario: 1.2. Invalid Request 
			When I send an invalid request to delete category
			Then I receive a error message.

	Rule: The system is not working properly

# APIs Contract

#Request: DELETE/Category
{	
	header:{
		"Content-Type": "application/json"
	},
	body:{
		"categoryId": "required"
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