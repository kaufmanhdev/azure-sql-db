# Database Normalization Documentation

## Objective

The database schema is designed to comply with **Third Normal Form (3NF)** to eliminate redundancy and maintain data integrity.

## First Normal Form (1NF)

- All tables have primary keys
- No repeating groups or multi-valued attributes
- Each field contains atomic values

## Second Normal Form (2NF)

- All non-key attributes depend fully on the primary key
- Partial dependencies are removed by separating related entities

## Third Normal Form (3NF)

- No transitive dependencies
- Non-key attributes depend only on the primary key
- Lookup tables created where appropriate

## Key Design Decisions

- Surrogate primary keys used for simplicity
- Foreign keys enforce referential integrity
- Constraints applied to ensure data validity

## Assumptions

- Each order is associated with exactly one customer
- Each order may contain multiple items
- Products belong to a single category

