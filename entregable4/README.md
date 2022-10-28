# SKELETON

API structure:

## GET /api/v1/users

Get all users

## POST /api/v1/auth/register

Register a new user

### Body - Example

```json
{
	"firstName": "Nelson",
	"lastName": "Carrion",
	"email": "nelson.c@gmail.com",
	"password": "qwerty",
	"phone": "+51993848376",
	"birthday": "1994/01/15",
	"gender": "Masculino",
	"country": "peru"
}
```

## POST /api/v1/auth/login

Login a user

### Body - Example

```json
{
	"email": "nelson.c@gmail.com",
	"password": "qwerty"
}
```

GET /api/v1/users/me
