# Functional Dependencies & Normalization

This document summarizes the functional-dependency and normalization analysis performed in the Database Design project.

## Functional Dependencies

The following non-trivial functional dependencies were identified:

```text
UserID → UserName, UserAddress

RestaurantID → RestaurantName, RestaurantAddress

ItemID → ItemName, ItemPrice

(UserID, OrderTime) → RestaurantID

(UserID, OrderTime, ItemID) → ItemQuantity
```

---

## Candidate Key

`CuisineType` does not appear on the right-hand side of any non-trivial functional dependency and therefore has to be included in the candidate key identified in the submitted analysis.

Similarly, `OrderTime`, `UserID`, and `ItemID` cannot be derived from the other attributes using the identified dependencies.

The attribute closure is:

```text
{CuisineType, OrderTime, UserID, ItemID}+ = R
```

Therefore, the candidate key identified in the submitted analysis is:

```text
{CuisineType, OrderTime, UserID, ItemID}
```

---

## Third Normal Form (3NF)

The original relation does not satisfy Third Normal Form.

A minimal basis was obtained by separating the functional dependencies:

```text
UserID → UserName
UserID → UserAddress

RestaurantID → RestaurantName
RestaurantID → RestaurantAddress

ItemID → ItemName
ItemID → ItemPrice

(UserID, OrderTime) → RestaurantID

(UserID, OrderTime, ItemID) → ItemQuantity
```

Using the 3NF synthesis procedure, the following relations were obtained:

```text
R1(UserID, UserName)

R2(UserID, UserAddress)

R3(RestaurantID, RestaurantName)

R4(RestaurantID, RestaurantAddress)

R5(ItemID, ItemName)

R6(ItemID, ItemPrice)

R7(UserID, OrderTime, RestaurantID)

R8(UserID, OrderTime, ItemID, ItemQuantity)
```

Because none of these relations contains a key for the original relation, an additional relation was included:

```text
R9(UserID, OrderTime, ItemID, CuisineType)
```

---

## Boyce-Codd Normal Form (BCNF)

The original relation also does not satisfy BCNF.

The submitted analysis considers the dependency:

```text
(UserID, OrderTime, ItemID)
    →
(ItemQuantity,
 UserName,
 UserAddress,
 ItemName,
 ItemPrice,
 RestaurantID,
 RestaurantName,
 RestaurantAddress)
```

The corresponding decomposition is:

```text
R1(
    UserID,
    OrderTime,
    ItemID,
    ItemQuantity,
    UserName,
    UserAddress,
    ItemName,
    ItemPrice,
    RestaurantID,
    RestaurantName,
    RestaurantAddress
)
```

and:

```text
R2(
    UserID,
    OrderTime,
    ItemID,
    CuisineType
)
```

The submitted solution concludes that no non-trivial functional dependencies violate BCNF in the resulting relations.
