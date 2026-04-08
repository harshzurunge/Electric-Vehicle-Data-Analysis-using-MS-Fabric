# ⚡ Electrical Vehicles Analysis – Cloud Data Engineering Project  

## 📌 Project Overview  
The Electrical Vehicles Analysis project is a cloud-based data engineering solution designed to analyze electric vehicle datasets and deliver insights into battery technology, performance, pricing, and sales trends. Using **Microsoft Fabric (Dataflows, Lakehouse, Data Pipelines, Warehouse)**, **SQL**, and **Power BI**, this project demonstrates how raw EV data can be transformed into a robust data warehouse and semantic layer for business analytics.  

---

## 🎯 Objectives  
- Build a **cloud data warehouse** for analyzing EV technical and market data.  
- Design and implement an **ETL pipeline** using Microsoft Fabric (Bronze → Silver → Gold).  
- Create a **semantic model directly in the Data Warehouse**.  
- Visualize data through an **interactive Power BI dashboard**.  

---

## 🛠️ Tools & Technologies  
- **Microsoft Fabric (Lakehouse, Dataflows, Pipelines, Warehouse)** → ETL, storage & orchestration  
- **SQL** → Data transformation & modeling  
- **Power BI** → Dashboarding & reporting  

---

## 📊 Data Warehouse Design  

- **Fact Table:**  
  - `VehicleFact` → Holds core vehicle measures (battery capacity, range, price, units sold, warranty, etc.)  

- **Dimension Tables:**  
  - `YearDim` → Model year & decade context  
  - `BatteryDim` → Battery & charging attributes  
  - `VehicleModelDim` → Manufacturer & model details  
  - `CountryColorDim` → Country of manufacture & color options  

<table align="center">
  <tr>
    <td align="center">
      <b>Conceptual Model</b><br>
      <img src="Data Models/Conceptual Model.png" width="400"/>
    </td>
    <td align="center">
      <b>Logical Model</b><br>
      <img src="Data Models/Logical Model.png" width="450" height="800"/>
    </td>
  </tr>
</table>  

---

## 🔄 Fabric ETL Pipeline  

1. **Bronze Layer (ODS):**  
   - Created a Lakehouse and uploaded the raw CSV dataset.  

2. **Silver Layer (STG):**  
   - Converted raw CSV into structured tables.  
   - Created **EV Silver Dataflow** for initial cleaning & structuring.  

3. **Gold Layer (DWH):**  
   - Built **EV Dimensions Gold Dataflow** to load cleaned dimension tables into the Warehouse.  
   - Built **EV Gold Fact Dataflow** to load fact measures (battery capacity, range, sales, etc.) and join with dimensions.  
   - Configured **indexes** for optimized querying.  

4. **Pipeline Orchestration:**  
   - Designed a **Fabric Data Pipeline** to connect all dataflows, enabling automated end-to-end data loading.  

---

## 📐 Semantic Model  

- Created relationships directly in the **Fabric Data Warehouse** between `VehicleFact` and its dimensions.  
- Defined **business-friendly measures (DAX)** for KPIs such as:  

```DAX
-- Number of Car Models
Car Models = DISTINCTCOUNT(VehicleFact[VehicleModelID])

-- Number of Manufacturers
Manufacturers = DISTINCTCOUNT(VehicleModelDim[Manufacturer])

-- Average Battery Capacity
Avg Battery Capacity = AVERAGE(VehicleFact[BatteryCapacityKwh])

-- Average Range
Avg Range = AVERAGE(VehicleFact[RangeKM])

-- Total Units Sold
Total Units Sold = SUM(VehicleFact[UnitsSold2024])

-- Units Sold Value
Units Sold Price = SUMX(VehicleFact, VehicleFact[PriceUSD] * VehicleFact[UnitsSold2024])
```  

---

## 📈 Power BI Dashboards  

The Power BI dashboard provides insights across multiple views:  
- **Overview Page** → Historical EV overview, models, units sold, total revenue.  
- **EV Sales Analysis** → Units sold by year, country, and manufacturer.  
- **Battery Analysis** → Distribution of battery capacities & charging types.  
- **Navigation Page** → Easy page switching & filtering.  

<table align="center">
  <tr>
    <td align="center">
      <b>Dashboard Home Page</b><br>
      <img src="PowerBI Report/Dashboard as Screenshots/Home Page.png" width="300"/>
    </td>
    <td align="center">
      <b>Overview Page</b><br>
      <img src="PowerBI Report/Dashboard as Screenshots/Overview Page (1).png" width="300" />
    </td>
    <td align="center">
      <b>Sales Analysis</b><br>
      <img src="PowerBI Report/Dashboard as Screenshots/Sales Analysis Page (2).png" width="300"/>
    </td>
  </tr>
  <tr>
    <td align="center">
      <b>Battery Analysis</b><br>
      <img src="PowerBI Report/Dashboard as Screenshots/Battery Analysis Page.png" width="300"/>
    </td>
  </tr>
</table>  

---

## 🙏 Acknowledgment  
Thank you for reviewing this project. This work was completed as part of my professional training and demonstrates the use of **data engineering & BI practices** to analyze the growing **electrical vehicle industry**.  

## 📂 Project Documentation  

<p align="center">
  <a href="Documentation/Yousef Jaber Abdulaziz.pdf">
    <img src="https://img.shields.io/badge/For%20More%20Details-Click%20Here-blue?style=for-the-badge" />
  </a>
</p>

