SELECT dbo.OrderProcess.JobNumber, dbo.OrderProcess.ComponentNumber, dbo.OrderProcess.ProcessID, dbo.OrderProcess.ProcessCode, dbo.OrderHeader.CustName, dbo.OrderHeader.DueDate, dbo.OrderHeader.OrderDate, dbo.OrderHeader.JobStatus, 
             dbo.OrderProcess.Description AS ProcessCode_Desc, dbo.Process.CostCenterCode, CASE WHEN dbo.OrderProcess.Description IN ('Envelope Press MR', 'Envelope Press RUN') THEN 'Envelope Press' WHEN dbo.OrderProcess.Description IN ('MR DI 52', 'RUN DI 52') 
             THEN 'DI 52' WHEN dbo.OrderProcess.Description IN ('Wide Format RIGID MR', 'Wide Format RIGID Make Ready', 'Wide Format RIGID RUN') THEN 'Wide Format RIGID' WHEN dbo.OrderProcess.Description IN ('Wide Format ROLL MR', 'Wide Format ROLL RUN') 
             THEN 'Wide Format ROLL' WHEN dbo.OrderProcess.Description IN ('Creative Production/Design', 'Variable Data Prep', 'Proof Out - PDF', 'Project Management - Graphics', 'Internal Admin - Graphics') THEN 'Graphics Services' WHEN dbo.OrderProcess.Description IN ('Prepress', 
             'Prepress - UV Spot Raised', 'Vendor Management', 'Digital Numbering', 'Scan / Copy', 'Proof to Customer - Content Proof (Digital)', 'Proof to Customer - UV Spot Raised (3 options)', 'Proof to Customer - Color Critical (per sig)', 'Proofing') 
             THEN 'Prepress Production' ELSE dbo.OrderProcess.Description END AS Renamed_Process_Desc, dbo.OrderQtyTable.Quantity, dbo.OrderComponent.Lots, dbo.OrderComponent.PressOuts, dbo.WIP.LastDCEntry, dbo.v_OrderAnalysis.ProductionQuantity, 
             dbo.v_OrderAnalysis.ProductionMinutes, dbo.v_OrderAnalysis.Sides, dbo.OrderHeader.UserDefined2
FROM   dbo.WIP RIGHT OUTER JOIN
             dbo.OrderProcess ON dbo.WIP.JobNumber = dbo.OrderProcess.JobNumber AND dbo.WIP.ComponentNumber = dbo.OrderProcess.ComponentNumber LEFT OUTER JOIN
             dbo.v_OrderAnalysis ON dbo.OrderProcess.JobNumber = dbo.v_OrderAnalysis.JobNumber AND dbo.OrderProcess.ComponentNumber = dbo.v_OrderAnalysis.ComponentNumber AND 
             dbo.OrderProcess.Description = dbo.v_OrderAnalysis.OrderProcessDescription LEFT OUTER JOIN
             dbo.OrderComponent ON dbo.OrderProcess.JobNumber = dbo.OrderComponent.JobNumber AND dbo.OrderProcess.ComponentNumber = dbo.OrderComponent.ComponentNumber LEFT OUTER JOIN
             dbo.OrderQtyTable ON dbo.OrderProcess.JobNumber = dbo.OrderQtyTable.JobNumber AND dbo.OrderProcess.ComponentNumber = dbo.OrderQtyTable.ComponentNumber LEFT OUTER JOIN
             dbo.Process ON dbo.OrderProcess.ProcessCode = dbo.Process.ProcessCode LEFT OUTER JOIN
             dbo.OrderHeader ON dbo.OrderProcess.JobNumber = dbo.OrderHeader.JobNumber
WHERE (dbo.OrderHeader.JobStatus = 'In Process') AND (dbo.Process.CostCenterCode IN (50500, 399600, 101001, 101051, 390001) OR
             dbo.Process.CostCenterCode BETWEEN 500490 AND 506051 OR
             dbo.Process.CostCenterCode BETWEEN 302001 AND 401501) AND (dbo.v_OrderAnalysis.JobStatus = 'In Process')
