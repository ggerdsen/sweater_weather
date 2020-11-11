# README

# Endpoints
1a. Retrieve Weather for a City Request
```
GET /api/v1/forecast?location=denver,co
Content-Type: application/json
Accept: application/json
```
1b. Background Image for the City Request
```
GET /api/v1/backgrounds?location=denver,co
Content-Type: application/json
Accept: application/json
```
2. User Registration Request
```
POST /api/v1/users
Content-Type: application/json
Accept: application/json

{
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```
3. Login Request  
```
POST /api/v1/sessions
Content-Type: application/json
Accept: application/json

{
  "email": "whatever@example.com",
  "password": "password"
}
```
4. Road Trip Request  
```
POST /api/v1/road_trip
Content-Type: application/json
Accept: application/json

body:

{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```



