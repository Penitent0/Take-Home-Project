# Take-Home Tea Project

## Turing Backend Engineering Finale

![ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white) ![ror](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white) ![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)

### Description

Rails RESTful Backend API that exposes tea subscription endpoints. 

### **Database Schema**

![Screen Shot 2023-01-11 at 12 33 49 PM](https://user-images.githubusercontent.com/102636892/212399380-2af63b16-eae0-4281-aa3a-9f5e9caa0455.png)

### **Create Subscription**

POST `/create`

```JSON
{
    "customer_id": 6,
    "tea_id": 20,
    "title": "test subscription",
    "price": "12.99",
    "status": "active",
    "frequency": "weekly"
}
```

**Example Response:**

```JSON
{
    "data": {
        "id": 24,
        "type": "Subscription",
        "attributes": {
            "title": "test subscription",
            "price": "12.99",
            "status": "active",
            "frequency": "weekly",
            "customer_id": 6,
            "tea_id": 20
        }
    }
}
```

### **Customer Subscriptions**

GET '/index'

```JSON 
{
    "customer_id": 6
}
```

**Example Response:**

```JSON
{
    "data": {
        "customer_id": 6,
        "customer_email": "helena_bartoletti@damore.name",
        "type": "Subscription Index",
        "subscriptions": [
            {
                "id": 11,
                "type": "Subscription",
                "attributes": {
                    "status": "cancelled",
                    "frequency": "monthly"
                }
            },
            {
                "id": 12,
                "type": "Subscription",
                "attributes": {
                    "status": "cancelled",
                    "frequency": "monthly"
                }
            },
            {
                "id": 21,
                "type": "Subscription",
                "attributes": {
                    "status": "active",
                    "frequency": "weekly"
                }
            },
            {
                "id": 22,
                "type": "Subscription",
                "attributes": {
                    "status": "active",
                    "frequency": "weekly"
                }
            },
            {
                "id": 23,
                "type": "Subscription",
                "attributes": {
                    "status": "active",
                    "frequency": "weekly"
                }
            },
            {
                "id": 24,
                "type": "Subscription",
                "attributes": {
                    "status": "active",
                    "frequency": "weekly"
                }
            }
        ]
    }
}

```

### **Cancel Subscription**

PATCH '/update'

```JSON
{
    "subscription_id": 24,
    "status": "cancelled"
}
```

**Returns Status 204 Updated Successfully**

