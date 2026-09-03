# 📌 Project Overview
This project demonstrates the development of a modern cloud-based ELT pipeline for Airbnb data.
Raw data is stored in AWS S3, loaded into Snowflake, and transformed using dbt into multiple analytical layers.

# 🏗️ Data Architecture

The project follows a Medallion Architecture consisting of three layers:

                         Airbnb Raw Data
                               │
                               ▼
                          AWS S3 Bucket
                               │
                               ▼
                           Snowflake
                               │
                               ▼
                         ┌───────────┐
                         │    dbt    │
                         │ Transform │
                         └───────────┘
                               │
              ┌────────────────┼────────────────┐
              │                │                │
              ▼                ▼                ▼
          🥉 BRONZE        🥈 SILVER        🥇 GOLD
           Staging         Intermediate      Mart
              │                │                │
              ▼                ▼                ▼
        Standardize        Clean &          Analytics
        Raw Data           Enrich            Ready
                               │                │
                               └────────┬───────┘
                                        ▼
                                BI / Analytics

# 🛠️ Technology Stack
Technology	Purpose
**AWS S3** -	Stores raw Airbnb data
**Snowflake**	- Cloud data warehouse
**dbt** -	Data transformation, testing, documentation, and modeling
**SQL** -	Data transformation and analytics
**Jinja**	- Dynamic and reusable SQL logic
**Git** -	Version control
**GitHub** -	Code repository and project documentation

# ⭐ One Big Table (OBT)

The Gold layer includes an One Big Table approach for analytical workloads.
Instead of requiring analysts to join multiple tables for common analysis, relevant dimensions and measures can be combined into a single analytics-ready dataset.

Conceptually:

                    ┌──────────────────────┐
                    │         OBT          │
                    ├──────────────────────┤
                    │ Listing Information  │
                    │ Host Information     │
                    │ Location             │
                    │ Price                │
                    │ Reviews              │
                    │ Availability         │
                    │ Room Type            │
                    └──────────────────────┘

# ⭐ Star Schema

The project can also support a dimensional modeling approach using fact and dimension tables.

                    dim_host
                       │
                       │
dim_location ───── fact_listing ───── dim_listing
                       │
                       │
                    dim_date

This structure separates measurable business events from descriptive dimensions and is suitable for analytical workloads.

# ✔️Initial SETUP
---pip install uv
---uv init
---uv sync
---.venv/Scripts/activate
---uv add dbt-core
---uv add dbt-snowflake 
