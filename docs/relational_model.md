# Relational Model

This document summarizes the relational schemas derived from the E/R models developed for the Database Design project.

## Initial Relational Schema

The initial design models an online restaurant-ordering system involving users, restaurants, orders, cuisine types, menu items, meals, beverages, and alcoholic beverages.

The E/R model was converted into the following relational schema.

### Entity Relations

```text
User(userid, name, address, email)

Restaurant(restaurantid, name, address, email, phonenum)

CuisineType(type)

MenuItem(itemid, name, price)

Meal(itemid, calories, isVegetarian)

Beverage(itemid, volume, isAlcoholic)

Alcoholic(itemid, alcoholPercentage)

Order(orderid, timeOfOrder, totalAmount)
```

### Relationship Relations

```text
OrderItem(orderid, itemid, quantity)

PlaceOrder(orderid, restaurantid)

RestCuisine(restaurantid, type)

Serves(itemid, restaurantid)
```

The subclass relations `Meal`, `Beverage`, and `Alcoholic` inherit their identifying attributes from the corresponding parent entity in the ISA hierarchy.

---

## Modified Relational Schema

The modified design introduces two constraints:

1. Each restaurant belongs to exactly one cuisine type.
2. `ItemID` identifies a menu item only within a particular restaurant.

As a result, cuisine type becomes an attribute of `Restaurant`, while `MenuItem` becomes a weak entity dependent on `Restaurant`.

The composite identifier is:

```text
(RestaurantID, ItemID)
```

The corresponding relational schema becomes:

```text
User(userid, name, address, email)

Restaurant(
    restaurantid,
    name,
    address,
    email,
    phonenum,
    cuisineType
)

MenuItem(
    restaurantid,
    itemid,
    name,
    price
)

Meal(
    restaurantid,
    itemid,
    calories,
    isVegetarian
)

Beverage(
    restaurantid,
    itemid,
    volume,
    isAlcoholic
)

Alcoholic(
    restaurantid,
    itemid,
    alcoholPercentage
)

Order(
    orderid,
    timeOfOrder,
    totalAmount
)
```

### Relationship Relations

```text
OrderItem(
    orderid,
    restaurantid,
    itemid,
    quantity
)

PlaceOrder(
    orderid,
    restaurantid
)

Serves(
    restaurantid,
    itemid
)
```

The composite identifier `(restaurantid, itemid)` is propagated to the dependent relations so that each menu item remains uniquely associated with its restaurant.
