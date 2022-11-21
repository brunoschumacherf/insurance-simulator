# insurance-simulator



## DOCUMENTAÇÃO README
### LEMBRANDO QUE ONDE TEM ':ID' É O ID NO GET
### No final exemplos de uma simulação e um usuário Admin

### DOCUMENTAÇÃO NO POSTMAN
```
https://api.postman.com/collections/19946352-2e281c0a-8641-497e-bf98-e0d29b6b4410?access_key=PMAT-01GJC0H8YY7YQV44MKYQ4D5MZK
``` 

### LINK HEROKU DEPROY
```
https://insurance-simulator.herokuapp.com/
```

## Users

### Criar Usuário comum exemplo
#### [POST] /api/login/signup


```json
{
  "email":"abc@example.com",
  "password":"password",
  "password_confirmation":"password",
  "name": "Bruno Souza",
  "age": "18",
  "address": "Rua Souza Correia, Barro Preto, Bahia",
  "number": "11",
  "zipcode": "45625000"
}
```



### Login Usuário comum exemplo
#### [POST] /api/login/signin


```json
{
  "email":"abc@example.com",
  "password":"password"
}
```

### Deslogar Usuário comum exemplo
####  [POST] /api/login/signout



## Users Seguros

### Criar Seguros
#### [POST] api/insurance/create

```json
{
    "name": "Seguro de Vida"
}
```

### Buscar um seguro
#### [GET] /api/insurance/:ID

### Exibir todos seguros do Usuário
#### [GET] /api/insurance/



## Users Coberturas


### Criar Cobertura
#### [POST] api/roof/create

```json
{
  "insurance_id": 1,
  "name": "",
  "factor": 0.20
}
```


### Buscar Coberturar de um Seguro
#### [Get] api/roof/:ID



## AREA ADMIN


### Criar Usuário Admin
#### [POST] api/admin/create

```json
{
  "email":"abc@example.com",
  "password":"password",
  "password_confirmation":"password"
}
```


### Login Usuário Admin

#### [POST] /api/admin/login


```json
{
    "email": "abc@example.com",
    "password": "password"
}

```

### Simulador
### [POST] /api/simulator/

```json
  {
  "user_id": 1,
  "insurance_id": 1,
  "coberturas": [
    {"coverage_id": 3, "capital": 1000 },
    {"coverage_id": 4, "capital": 1000 }
  ]
}
```

### Exbir todos Seguros
#### [GET] api/admin/insurances


### Buscar um Seguros
#### [GET] api/admin/insurances/:id



### Exibir usuários Usuário
#### [GET] /api/admin/users

### Buscar um usuário
#### [GET] api/admin/users/:id


### Exibir coberturas de um seguro
#### [GET] api/admin/roofs/:id

### Deslogar Admin

#### [GET] api/admin/signout



### EXEMPLOS
#### User admin
```json
{
    "email": "abc1@example.com",
    "password": "password"
}
```

### Para simular

```json
{
  "user_id": 1,
  "insurance_id": 1,
  "coberturas": [
    {"coverage_id": 1, "capital": 1000 }
    {"coverage_id": 2, "capital": 1000 }
  ]
}
```



