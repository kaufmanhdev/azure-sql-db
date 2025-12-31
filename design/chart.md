erDiagram
      
"dbo.tblSuppliers" {
    int SupplierID "PK"
          varchar(100) SupplierName ""
          varchar(100) ContactPerson ""
          varchar(100) Email ""
          varchar(25) Phone ""
          
}
"dbo.tblEmployees" {
    int EmployeeID "PK"
          varchar(50) FirstName ""
          varchar(50) LastName ""
          varchar(50) Role ""
          
}
"dbo.tblProducts" {
    int ProductID "PK"
          varchar(100) ProductName ""
          varchar(-1) Description ""
          varchar(50) Brand ""
          varchar(50) Model ""
          int CurrentStock ""
          
}
"dbo.tblPurchaseOrders" {
    int PurchaseOrderID "PK"
          int SupplierID "FK"
          int EmployeeID "FK"
          datetime OrderDate ""
          datetime ExpectedDeliveryDate ""
          varchar(20) Status ""
          
}
"dbo.tblPurchaseOrderDetails" {
    int PurchaseOrderDetailID "PK"
          int PurchaseOrderID "FK"
          int ProductID "FK"
          int Quantity ""
          decimal CostPerUnit ""
          
}
      "dbo.tblPurchaseOrders" ||--|{ "dbo.tblSuppliers": "SupplierID"
"dbo.tblPurchaseOrders" ||--|{ "dbo.tblEmployees": "EmployeeID"
"dbo.tblPurchaseOrderDetails" ||--|{ "dbo.tblPurchaseOrders": "PurchaseOrderID"
"dbo.tblPurchaseOrderDetails" ||--|{ "dbo.tblProducts": "ProductID"
