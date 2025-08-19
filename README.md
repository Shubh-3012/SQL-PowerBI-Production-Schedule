# SF1 Production Schedule Dashboard

## Overview
The **SF1 Production Schedule Dashboard** was developed to provide a clear, real-time visualization of production workload distribution across key presses in the SF1 facility. Built using **SQL** (data extraction and transformation) and **Power BI** (interactive visualization), the dashboard centralizes production data and improves scheduling oversight.

---

## Goals and Objectives
- **Centralize and streamline** visibility of allocated production hours for each press (KM1, DI 52, BW Digital, Color Digital, Envelope Press, Bindery).  
- **Enhance scheduling oversight** by summarizing in-process jobs and their allocation by press.  
- **Enable press-level planning** with workload breakdown by due date windows (Past, Current Week, Next Week, Beyond/Unassigned).  
- **Track job readiness** through staging code segmentation (`Pre`, `Ready`, `Post`).  

---

## Project Benefits
- **Improved Production Planning:** Provides real-time workloads and readiness status for better decision-making.  
- **Enhanced Communication:** Improves collaboration between Prepress, Production, and Scheduling teams.  
- **Increased Efficiency:** Enables proactive resource allocation and workload balancing.  
- **Data-Driven Decisions:** Supports operational reviews with historical and forward-looking scheduling insights.  
- **Transparency & Accountability:** Tracks job status, readiness, and due dates across the organization.  

---

## Project Scope
### **Summary Page**
- Table of all in-process jobs.  
- Bar graph showing total allocated hours per press.  

### **Individual Press Pages (2 per press)**
1. **Four bar graphs by due date range:**  
   - Past Weeks  
   - Current Week  
   - Next Week  
   - Beyond 2 Weeks / Unassigned  

   *(X-axis: Due Dates, Y-axis: Allocated Hours)*  

2. **Detailed Job View:**  
   - Data table listing all jobs assigned to the press.  
   - Bar graph showing hours (X-axis) by due date (Y-axis), color-coded by staging code:  
     - Pre → Not ready for press  
     - Ready → Ready to run  
     - Post → Post-press staging  

---

## Data Source & ETL Process
- **Source:** EPMS database tables (`OrderProcess`, `OrderComponent`, `OrderHeader`, `OrderValue`, `Process`, `CostCenter`).  
- **ETL & Querying:** Microsoft SQL Server Management Studio (SSMS).  
- **Visualization:** Power BI dashboards and interactive reports.  

---

## Project Rationale
Production scheduling is a critical function in a multi-press environment. Prior to this dashboard, visibility into job distribution, press readiness, and bottlenecks was limited and fragmented.  

The **SF1 Production Schedule Dashboard** addresses these gaps by:  
- Providing a centralized, interactive view of job schedules and workloads.  
- Identifying and resolving imbalances or readiness delays before they affect delivery.  
- Supporting strategic goals to reduce turnaround time, minimize idle press time, and enhance output.  

---

## Conclusion
By transforming raw production data into actionable insights, the **SF1 Production Schedule Dashboard** directly supports **Strategic Factory’s continuous improvement initiatives** in operations, efficiency, and customer satisfaction.  

