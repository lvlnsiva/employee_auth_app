# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
ruby -> 2.3.1
rails -> 5.0.1

* System dependencies
For pg installation need to install some other dependencies
sudo apt-get install libpq-dev
* Configuration

* Database creation
rake db:create
* Database initialization
rake db:migrate
* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

* Dummy Data creation using rails
rails db:seed

API CALL

1. User Authentication Api: 
URL: http://localhost:3008/authenticate
TYPE: POST
Req Body:
{
  "email": "example1@mail.com",
  "password": "password"
}

Response:
{
"auth_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2Mjc0OTI4OTh9.InYoQD8OEFbJg4Wdh-fD_jxh50UrKTLeXUf4odu3SYU"
}


2. Employees List API
Authorization: "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2Mjc0OTI4OTh9.InYoQD8OEFbJg4Wdh-fD_jxh50UrKTLeXUf4odu3SYU"
TYPE: GET
URL: http://localhost:3008/api/v1/employee?limit=3

Response:

{"employees":[{"id":1,"name":"emp1","emp_id":"1234","password":"AXSP","designation":"manager","qualificaton":"BE","from_date":"2021-07-21","end_date":"2021-08-22","is_super_admin":true,"created_at":"2021-07-27T17:18:05.421Z","updated_at":"2021-07-27T17:18:05.421Z"},{"id":2,"name":"emp2","emp_id":"12345","password":"XYZ","designation":"engineer","qualificaton":"BE","from_date":"2021-07-21","end_date":"2021-08-22","is_super_admin":false,"created_at":"2021-07-27T17:18:05.427Z","updated_at":"2021-07-27T17:18:05.427Z"},{"id":3,"name":"emp3","emp_id":"123456","password":"XYZX","designation":"admin","qualificaton":"MCA","from_date":"2021-07-21","end_date":"2021-08-22","is_super_admin":true,"created_at":"2021-07-27T17:18:05.432Z","updated_at":"2021-07-27T17:18:05.432Z"}]}

3. Create Employee Api
Authorization: "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2Mjc0OTI4OTh9.InYoQD8OEFbJg4Wdh-fD_jxh50UrKTLeXUf4odu3SYU"
POST: http://localhost:3008/api/v1/employee
Body:
{
   "name": "emp4",
   "emp_id": "1519",
   "designation": "officer",
   "qualificaton": "inter",
   "from_date": "2021-07-22",
   "is_super_admin": true
}

Response:
{"status":"SUCCESS","msg":"Created Employee","data":{"id":4,"name":"emp4","emp_id":"1519","password":null,"designation":"officer","qualificaton":"inter","from_date":"2021-07-22","end_date":null,"is_super_admin":true,"created_at":"2021-07-27T18:14:24.244Z","updated_at":"2021-07-27T18:14:24.244Z"}}

4.Update Employee API
Authorization: "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2Mjc0OTI4OTh9.InYoQD8OEFbJg4Wdh-fD_jxh50UrKTLeXUf4odu3SYU"
PUT: http://localhost:3008/api/v1/employee/4
Response:
{
"status": "SUCCESS",
"msg": "Updated Employee",
"data": {
"id": 4,
"name": "emp4",
"emp_id": "1520",
"designation": "officer",
"qualificaton": "inter",
"from_date": "2021-07-22",
"is_super_admin": true,
"password": null,
"end_date": null,
"created_at": "2021-07-27T18:14:24.244Z",
"updated_at": "2021-07-27T18:16:23.488Z"
}
}


5.GET Employee Record:

HEADERS: 
Authorization: "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2Mjc0OTI4OTh9.InYoQD8OEFbJg4Wdh-fD_jxh50UrKTLeXUf4odu3SYU"
GET: http://localhost:3008/api/v1/employee/1
RESPONSE:
{
"status": "SUCCESS",
"data": {
"id": 1,
"name": "emp1",
"emp_id": "1234",
"password": "AXSP",
"designation": "manager",
"qualificaton": "BE",
"from_date": "2021-07-21",
"end_date": "2021-08-22",
"is_super_admin": true,
"created_at": "2021-07-27T17:18:05.421Z",
"updated_at": "2021-07-27T17:18:05.421Z"
}
}

6. Delete Employee API:

Authorization: "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2Mjc0OTI4OTh9.InYoQD8OEFbJg4Wdh-fD_jxh50UrKTLeXUf4odu3SYU"

DELETE: http://localhost:3008/api/v1/employee/4

Response:
{
"status": "SUCCESS",
"msg": "Deleted Employee",
"data": {
"id": 4,
"name": "emp4",
"emp_id": "1520",
"password": null,
"designation": "officer",
"qualificaton": "inter",
"from_date": "2021-07-22",
"end_date": null,
"is_super_admin": true,
"created_at": "2021-07-27T18:14:24.244Z",
"updated_at": "2021-07-27T18:16:23.488Z"
}
}








