
**User Story 1**

```
As a user
So that I can list or hire spaces,
I would like to be able to sign up.
```

**User Story 2**
```
As a user
So that users can hire my spaces,
I would like to be able to list multiple spaces.
```
**User Story 3**
```
As a user
So that I can hire a space,
I would like to book a space for a night.
```
**User Story 4**
```
As a user
So that someone can book my space,
I would like to give them permission to use my space.
```
**User Story 5**
```
As a user
So that I can hire a space,
I would like to be able to see if said space is available.
```
**User Story 6**
```
As a user
So that I can list a space,
I would like my space to have a name, description and price.
```
**User Story 7**
```
As a user
So that someone can book my space
I would like to offer a range of available dates

```
**Domain Modelling**

| class     | User        |
|-----------|-------------|
| Properties| id          |
|           | username    | 
|           | current_user| 
|           |             |
| Actions   | sign_up     |
|           | log_in      |
|           | all         |
|           | find_user   |
|           | current_user| 
|           | name_taken  |

| class     | Space       |
|-----------|-------------|
| Properties| space_id    |
|           | name        |
|           | description |
|           | price       |
|           | startdate   |
|           | enddate     |
|           | availability|
|           | user_id     |
|           | current_space|
|           |             |
| Actions          | all |
|            |  create_space|
|            | is_available |
|             |current_space| 
|             | find_space |
|             | book        |

| class     | Booking     |
|-----------|-------------|
| Properties| booking_id |
||space_id |
||host_id |
||user_id |
||approval|
| | |
| Actions   | approve |
||check_bookings |
||find_booking_id |

