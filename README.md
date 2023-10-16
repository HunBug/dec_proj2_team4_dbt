# Data Engineering Camp - Project 2 Team 4

## Project Description

In this project, our team aims to analyze data from the Northwind Database to extract valuable insights and provide meaningful reports. The project has several key objectives (besides learning the technologies), including:

1. **Customer Count**: Calculate the total number of customers acquired throughout the company's lifetime.

2. **Average Order Value**: Calculate the average value of each order.

3. **Yearly Order Comparison**: Compare the number of orders in the current year with the previous year.

4. **Yearly Sales Comparison**: Display and compare the total sales per year with all previous years.

5. **Monthly Sales by Product Category**: Calculate and visualize the sales value per product category for each month.

6. **Top Product Categories**: Identify the best-performing product categories.

7. **Top Selling Countries**: Determine the countries where our products sell the most.

8. **Top Sales Representatives**: Identify the sales representatives with the highest sales.

## Technologies Used

We are using a variety of technologies and tools to accomplish our project goals. This image will give you an overview of the architecture.

![DataEngineering - Frame 4](https://github.com/cristianivanoff/dec_proj2_team4_dbt/assets/72450060/053c139d-f795-4596-ac57-511059e8bf6e)




- **Data Source**: We are sourcing data from a PostgreSQL database, which we can manage using PGAdmin. The database is in AWS.

- **Data Replication**: Data replication and movement are achieved through Change Data Capture (CDC) using Fivetran.

- **Data Warehouse**: We store and transform our data in Snowflake, where we create role-based access permissions.

- **Data Transformation**: All data transformations are performed using dbt-cloud. We create tests and a Kimball-style model with fact and dimension tables. These tables contain calculations, including window functions.
  - dbt lineage:
  ![Skärmavbild 2023-10-14 kl  17 06 37](https://github.com/cristianivanoff/dec_proj2_team4_dbt/assets/72450060/a5a56797-ccc8-4945-8ffa-f53a1bcc909c)

  - Dimensional model:
  ![Skärmavbild 2023-10-14 kl  16 43 21](https://github.com/cristianivanoff/dec_proj2_team4_dbt/assets/72450060/f838368d-fda2-4836-bc3e-3b8da003e2ad)


- **Visualization**: Our visualizations are created and presented using Looker.
![Skärmavbild 2023-10-14 kl  17 00 44](https://github.com/cristianivanoff/dec_proj2_team4_dbt/assets/72450060/0e35a316-d408-40bf-b317-8261652b5c29)

- **Version Control**: All code developed for this project is stored in two separate Git repositories, one for dbt and one for Looker, allowing for independent development.
  - **dbt Repository**: You can find the code for data transformations in the dbt repository [here](https://github.com/cristianivanoff/dec_proj2_team4_dbt).
  - **Looker Repository**: All our Looker visualization code can be found in the Looker repository [here](https://github.com/cristianivanoff/dec_proj2_team4_looker).


## Data Source

We are working with the Northwind Database, a well-known sample database often used for teaching and practicing SQL.

## Conclusion

This project aims to provide a comprehensive analysis of the Northwind Database, with a focus on key business metrics, customer behavior, and sales performance. We leverage a range of modern data engineering and analytics technologies to deliver meaningful insights and visualizations to drive data-informed decisions. Please feel free to explore our reports and insights using the tools and resources mentioned above.



