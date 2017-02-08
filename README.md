# README

This is a Hotel room booking application

## Rails Version
Rails 5.0.0.1

## Ruby Version
Ruby 2.3.1

## Database
MySQL

## Run Gemfile
```
	bundle install
```

## Create Database
```
	rails db:create
```

## Run Migrations
```
	rails db:migrate
```

## Run Seed File
#### Seed Data for storing the rooms category and rooms information to the database
```
	rails db:seed
```

## Start Server
```
	rails s
```

# API Documentation

I have used serializer for accomplishing the apis
 
## API document by postman testing
#### Please import the url into the postman 
Postman API Document Link : https://www.getpostman.com/collections/ebd9a4dd8cf44c88402d
```json
{
	"variables": [],
	"info": {
		"name": "TrivagosHotel",
		"_postman_id": "172ed3c2-9811-36cf-010a-9514b320c156",
		"description": "",
		"schema": "https://schema.getpostman.com/json/collection/v2.0.0/collection.json"
	},
	"item": [
		{
			"name": "User Registration",
			"request": {
				"url": "http://localhost:3000/api/v1/users",
				"method": "POST",
				"header": [
					{
						"key": "Content-Type",
						"value": "application/json",
						"description": ""
					}
				],
				"body": {
					"mode": "raw",
					"raw": "{\n\t\"user\": {\n\t\t\"first_name\":\"Ashish\",\n\t\t\"last_name\":\"Prajapati\",\n\t\t\"mobile\":\"8085665606\",\n\t\t\"email\":\"mail@manishshrivastava1.com\",\n\t\t\"password\":\"12345678\"\n\t}\n}"
				},
				"description": ""
			},
			"response": []
		},
		{
			"name": "User Sign In",
			"request": {
				"url": "http://localhost:3000/api/v1/users/sign_in",
				"method": "POST",
				"header": [
					{
						"key": "Content-Type",
						"value": "application/json",
						"description": ""
					}
				],
				"body": {
					"mode": "raw",
					"raw": "{\n\t\"user\": {\n\t\t\"email\":\"mail@manishshrivastava.com\",\n\t\t\"password\":\"12345678\"\n\t}\n}"
				},
				"description": ""
			},
			"response": []
		},
		{
			"name": "Availability of rooms api dates range",
			"request": {
				"url": "http://localhost:3000/api/v1/hotel_rooms?check_in=2016/10/9&check_out=2016/10/14",
				"method": "GET",
				"header": [
					{
						"key": "Content-Type",
						"value": "application/json",
						"description": ""
					}
				],
				"body": {
					"mode": "raw",
					"raw": ""
				},
				"description": ""
			},
			"response": []
		},
		{
			"name": "Availability of rooms by category",
			"request": {
				"url": "http://localhost:3000/api/v1/hotel_rooms?check_in=2016/10/9&check_out=2016/10/14&category_id=4",
				"method": "GET",
				"header": [
					{
						"key": "Content-Type",
						"value": "application/json",
						"description": ""
					}
				],
				"body": {
					"mode": "raw",
					"raw": ""
				},
				"description": ""
			},
			"response": []
		},
		{
			"name": "User's Rooms Booking Informations",
			"request": {
				"url": "http://localhost:3000/api/v1/booking_informations?user_email=mail@clecotech.com&user_token=KsWaQr3zXtQLhTq9BLVM",
				"method": "GET",
				"header": [
					{
						"key": "Content-Type",
						"value": "application/json",
						"description": ""
					}
				],
				"body": {
					"mode": "raw",
					"raw": ""
				},
				"description": ""
			},
			"response": []
		},
		{
			"name": "Availability of rooms api single date",
			"request": {
				"url": "http://localhost:3000/api/v1/hotel_rooms?check_in=2016/10/9",
				"method": "GET",
				"header": [
					{
						"key": "Content-Type",
						"value": "application/json",
						"description": ""
					}
				],
				"body": {
					"mode": "raw",
					"raw": ""
				},
				"description": ""
			},
			"response": []
		}
	]
}
```