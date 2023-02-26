# User Story/Narrative
# As a user of OnePos's client 
# I want to get all categories
# So that I can view category list.

#Feature 
@category @store-admin @staff @customer @guest @all-users @get
Feature: Get categories
    As a user of OnePos's client 
    I want to get all categories
    So that I can view category list.

    Background: 
        Given The system is working properly

    Scenario: 1. Valid Request 
        When I send a valid request to get all categories
        Then I receive a list of categories.
    
    Scenario: 2. Invalid Request 
        When I send an invalid request to get all categories
        Then I receive a error message.

# APIs Contract

#Request: GET/Categories
{	
	header:{
		"Content-Type": "application/json"
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
		"data":[{
			"categoryId": "",
			"categoryName":  "",
			"parentCategoryId": "", 
			"description":  "",
		}]
	}
}