Table Customer {
  id integer [primary key, increment]
  name varchar [not null]
  email varchar [unique]
  hash varchar(255) [not null]
  registrationDate timestamp [not null, default: "now()"]
}

Table SpiceCategory {
  id integer [primary key, increment]
  name varchar [unique]
  description text [not null]
}

Table Spice {
  id integer [primary key, increment]
  name varchar [unique]
  description text [not null]
  price decimal(10,2) [not null]
  quantity integer [not null, default: 0]
  categoryId integer [not null]
}

Table SpiceOrder {
  id integer [primary key, increment]
  status varchar [not null]
  createDate timestamp [not null, default: "now()"]
  customerId integer [not null]
}

Table SpiceOrderContent {
  id integer [primary key, increment]
  orderId integer [not null]
  spiceId integer [not null]
  productPrice decimal(10,2) [not null]
  productQuantity integer [not null]
}

Ref: Spice.categoryId > SpiceCategory.id
Ref: SpiceOrderContent.orderId > SpiceOrder.id
Ref: SpiceOrderContent.spiceId > Spice.id
Ref: SpiceOrder.customerId > Customer.id
