# README

## Ruby version
3.0.0

## Rails version
7.0.4

## System dependencies

1. Postgresql
2. Redis

## Database creation
rake db:migrate

change this config like on your local in config/database.yml
```
  username: bentang
  password: bentang
  host: localhost
  port: 5432
```
## Usage

On development environment

  $ rails s <br />
  $ bundle exec sidekiq #for create data because we use redis and sidekiq for process new data

## How to run the test suite

Full-suite

  $ bundle exec rspec --tag ~gcs --tag ~sql_view spec/
  
## API
### For params avatar we use base64 if you not use base63 you can't proces and image will be null

### Show list of doctors

```GET /api/v1/users/doctors```

```POST /api/v1/users/doctors```
Here is example of valid response:
```json
{"user_doctor":                                   
  {"user":                                        
    {"name":"Shawana Smith IV",                   
     "email":"y@abbott.co",        
     "phone":"+628211852654",                 
     "address":"348 Runolfsson Rapid, Kashaberg, CT 68803-0201",
     "country_id":2,                              
     "gender":"female",                           
     "password":"123456789",
     "password_confirmation":"123456789",
     "avatar": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHwAAAB8CAMAAACcwCSMAAAANlBMVEWVu9////+QuN6LtdyavuD2+fz7/P6ewOGzzefw9frW5PKmxeTD2OzQ4PDg6vXl7ve+1OusyeUbGg2fAAADaklEQVRoge1b69KiMAwtaaV3Wt//ZbcIuqhIE0xldofz53OYT08b0lxOQIgTJ06cWAcUCKHU/dMvmYWJg7WXAmuHaMTP+KUItnuBDeXyD6j98Mo8IfnW9CDcOvUIJ5oaH/ybwZ+M7xuyy+sW9QjTzPRQ5e66a6u96zp31+k23PKCIb80MTxEDHfXxRaGRxn9Znh+dtg44M9w/OTojTfwOQh48sC9ddgMbc+w3OS6x5P3zHYHg+cuQZZ36xJ5yCc43kAjE4U88ZIDKrTeceE1OxD8rXgcs7vTyHm5ieSKlVsdSf4vmZ2X+1Bvl4S8UjLLfxThJLqOGcEc2ym1BH81QUupvNyHFhNCUMoobm75oStfw8DdtBxavQqPJ/fc3ISbzn7LD26XMMrAhBb6ALaGZK4eZ/Ij+3MhcORNqJFxhj3CzDhSEEJtvdXGMQU0d9G8gMw18txQ/4SK4Ye2svu28NuUWsBW99C3lbwLu/oYZS+q+awD1KdJQ1NumH4dIKyYvp/LF2iyBBChnw+S1G+53ekpuEDuA/edB+lvfHmOX1LlRf+UsrpfvwUC5yUbP0j9mGVF+bgI2uQcstHwoHoIZjZoDn4AHZZN4tKtAJ6miaCe/jHoLyd9ANf04l3Fs1Z/890P+3T9hh78Wmds89v0tFzIa7Ev7Z91yU+NQh+9lPMKyh8pffwU+MLOFLvdk6eYjS8wOW4KB/t6dajmTxz2ZFlQPNxdtyPm1VI3HvQkD4TGsAayy/NtfMfWKTJIDVSZhKY+1UBUC2iiXw1EUZAmcddAq+Zpk6w6SLMu2iSrjkixO01kroMkQ9Pk9TpIAjxjeJtAOOlcCe0vCKkNK7/gQRBqeEPMCEKYwT2UQgHlARZuboJGxZnL70DndH5nJ7g7d3AdgQ6wnFXMHehqBthPWjlr6IPOnFZG4LUi9mNeDjqWm61dWAJbzDQ45vipD3qgQQFy+MFdwE1AlnEtAhw6xB1KXhe2G5Ifes+Z25UJ6Kbl0JQqQDPntYH0LKyEzJbaUgaqIgUgwqv6SEef8s73HQCUiXb3AnobjfpKAB3FZUe3QJ/cUo7+ZgESfHb4Jwdc9uN3viZerkAqE5zdKDQu1gWjJCvvYgU3fV2bEN2Q7P0lGpsGF4PRAn7xMs9D5FdKqb+LOnHixIl3/AHj4ibvUBaELgAAAABJRU5ErkJggg=="
     },        
      "doctor":{"specialist_id":3, "workspace_id":4, "chat_price":61.57, "phone_price":93.64, "video_price": 99}
     }
 }
```
### Show list of patients

```GET /api/v1/users/patients```

```POST /api/v1/users/patients```
Here is example of valid response:
```json
{"user_patient":                                   
  {"user":                                        
    {"name":"Shawana Smith IV",                   
     "email":"y@abbott.co",        
     "phone":"+628211852654",                 
     "address":"348 Runolfsson Rapid, Kashaberg, CT 68803-0201",
     "country_id":2,                              
     "gender":"female",                           
     "password":"123456789",             
     "avatar": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHwAAAB8CAMAAACcwCSMAAAANlBMVEWVu9////+QuN6LtdyavuD2+fz7/P6ewOGzzefw9frW5PKmxeTD2OzQ4PDg6vXl7ve+1OusyeUbGg2fAAADaklEQVRoge1b69KiMAwtaaV3Wt//ZbcIuqhIE0xldofz53OYT08b0lxOQIgTJ06cWAcUCKHU/dMvmYWJg7WXAmuHaMTP+KUItnuBDeXyD6j98Mo8IfnW9CDcOvUIJ5oaH/ybwZ+M7xuyy+sW9QjTzPRQ5e66a6u96zp31+k23PKCIb80MTxEDHfXxRaGRxn9Znh+dtg44M9w/OTojTfwOQh48sC9ddgMbc+w3OS6x5P3zHYHg+cuQZZ36xJ5yCc43kAjE4U88ZIDKrTeceE1OxD8rXgcs7vTyHm5ieSKlVsdSf4vmZ2X+1Bvl4S8UjLLfxThJLqOGcEc2ym1BH81QUupvNyHFhNCUMoobm75oStfw8DdtBxavQqPJ/fc3ISbzn7LD26XMMrAhBb6ALaGZK4eZ/Ij+3MhcORNqJFxhj3CzDhSEEJtvdXGMQU0d9G8gMw18txQ/4SK4Ye2svu28NuUWsBW99C3lbwLu/oYZS+q+awD1KdJQ1NumH4dIKyYvp/LF2iyBBChnw+S1G+53ekpuEDuA/edB+lvfHmOX1LlRf+UsrpfvwUC5yUbP0j9mGVF+bgI2uQcstHwoHoIZjZoDn4AHZZN4tKtAJ6miaCe/jHoLyd9ANf04l3Fs1Z/890P+3T9hh78Wmds89v0tFzIa7Ev7Z91yU+NQh+9lPMKyh8pffwU+MLOFLvdk6eYjS8wOW4KB/t6dajmTxz2ZFlQPNxdtyPm1VI3HvQkD4TGsAayy/NtfMfWKTJIDVSZhKY+1UBUC2iiXw1EUZAmcddAq+Zpk6w6SLMu2iSrjkixO01kroMkQ9Pk9TpIAjxjeJtAOOlcCe0vCKkNK7/gQRBqeEPMCEKYwT2UQgHlARZuboJGxZnL70DndH5nJ7g7d3AdgQ6wnFXMHehqBthPWjlr6IPOnFZG4LUi9mNeDjqWm61dWAJbzDQ45vipD3qgQQFy+MFdwE1AlnEtAhw6xB1KXhe2G5Ifes+Z25UJ6Kbl0JQqQDPntYH0LKyEzJbaUgaqIgUgwqv6SEef8s73HQCUiXb3AnobjfpKAB3FZUe3QJ/cUo7+ZgESfHb4Jwdc9uN3viZerkAqE5zdKDQu1gWjJCvvYgU3fV2bEN2Q7P0lGpsGF4PRAn7xMs9D5FdKqb+LOnHixIl3/AHj4ibvUBaELgAAAABJRU5ErkJggg==",
     "password_confirmation":"123456789"},        
   "patient":{"weight":3, "height":4}
   }
 }
```
### Here example on postman you can try
export this link to postman <br />
https://www.getpostman.com/collections/d4c9f234c2877083dcad 
