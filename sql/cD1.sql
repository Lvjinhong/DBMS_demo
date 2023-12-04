use courseDesign;
CREATE TABLE Customer (
    CustID CHAR(12) PRIMARY KEY,
    CustName CHAR(50) NOT NULL,
    CustType CHAR(20) NOT NULL,
    ContactNumber CHAR(15) UNIQUE CHECK (ContactNumber REGEXP '^[0-9]{10,15}$'),
    Email VARCHAR(50) CHECK (Email REGEXP '^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$')
);

CREATE TABLE Part (
    PartID CHAR(12) PRIMARY KEY,
    PartName CHAR(50) NOT NULL,
    Category CHAR(20) NOT NULL,
    Brand CHAR(30) NOT NULL,
    ApplicableModels VARCHAR(100) NOT NULL,
    Specifications VARCHAR(100) NOT NULL,
    SafetyStockLevel INT CHECK (SafetyStockLevel >= 0),
    CurrentStock INT CHECK (CurrentStock >= 0 AND CurrentStock >= SafetyStockLevel),
    SuggestedPurchasePrice FLOAT,
    SuggestedRetailPrice FLOAT
);

CREATE TABLE Employee (
    EmpID CHAR(12) PRIMARY KEY,
    EmpName CHAR(50) NOT NULL,
    Gender CHAR(1) NOT NULL,
    Address VARCHAR(100),
    Position CHAR(30) NOT NULL,
    ContactNumber CHAR(15) UNIQUE CHECK (ContactNumber REGEXP '^[0-9]{10,15}$'),
    Email VARCHAR(50) CHECK (Email REGEXP '^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$')
);

CREATE TABLE Department (
    DepID CHAR(12) PRIMARY KEY,
    DepName CHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL CHECK (Email REGEXP '^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$')
);

CREATE TABLE Warehouse (
    WareID CHAR(12) PRIMARY KEY,
    WareName CHAR(50) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    ManagerID CHAR(12) NOT NULL,
    FOREIGN KEY (ManagerID) REFERENCES Employee(EmpID)
);

CREATE TABLE Storage (
    WareID CHAR(12),
    PartID CHAR(12),
    Quantity INT CHECK (Quantity >= 0),
    PRIMARY KEY (WareID, PartID),
    FOREIGN KEY (WareID) REFERENCES Warehouse(WareID),
    FOREIGN KEY (PartID) REFERENCES Part(PartID)
);

CREATE TABLE Sales (
    OrderID CHAR(12) PRIMARY KEY,
    EmpID CHAR(12) NOT NULL,
    CustID CHAR(12) NOT NULL,
    PartID CHAR(12) NOT NULL,
    SalePrice FLOAT CHECK (SalePrice >= 0),
    Quantity INT CHECK (Quantity >= 0),
    SaleTime DATETIME CHECK (SaleTime <= CURRENT_TIMESTAMP),
    DeliveryMethod CHAR(20),
    FOREIGN KEY (EmpID) REFERENCES Employee(EmpID),
    FOREIGN KEY (CustID) REFERENCES Customer(CustID),
    FOREIGN KEY (PartID) REFERENCES Part(PartID)
);

CREATE TABLE LogisticsInformation (
    OrderID CHAR(12),
    SaleID CHAR(12),
    Status VARCHAR(50),
    EstimatedArrival DATETIME,
    ActualArrival DATETIME CHECK (ActualArrival >= EstimatedArrival),
    ShippingCompany VARCHAR(50),
    TrackingNumber VARCHAR(50),
    PRIMARY KEY (OrderID, SaleID),
    FOREIGN KEY (SaleID) REFERENCES Sales(OrderID)
);


INSERT INTO Customer (CustID, CustName, CustType, ContactNumber, Email) VALUES
('CUST0001', '张庆生', '个人', '13867187556', 'qingsheng.zhang@email.com'),
('CUST0002', '谭宁', '个人', '13425222237', 'ning.tan@email.com'),
('CUST0003', '黄元君', '个人', '17280015494', 'yuanjun.huang@email.com'),
('CUST0004', '胡慧安', '个人', '15969634829', 'huian.hu@email.com'),
('CUST0005', '钟和', '个人', '13953829559', 'he.zhong@email.com'),
('CUST0006', '张庆生', '企业', '13115794993', 'qingsheng.zhang@company.com'),
('CUST0007', '谭宁', '企业', '15810454371', 'ning.tan@company.com'),
('CUST0008', '黄元君', '企业', '18768126176', 'yuanjun.huang@company.com'),
('CUST0009', '胡慧安', '企业', '19821999025', 'huian.hu@company.com'),
('CUST0010', '钟和', '企业', '13689895059', 'he.zhong@company.com'),
('CUST0011', '张庆生', '个人', '18969328061', 'qingsheng.zhang@personal.com'),
('CUST0012', '谭宁', '个人', '17324079504', 'ning.tan@personal.com'),
('CUST0013', '黄元君', '个人', '18983636171', 'yuanjun.huang@personal.com'),
('CUST0014', '胡慧安', '个人', '15116368946', 'huian.hu@personal.com'),
('CUST0015', '钟和', '个人', '13082828585', 'he.zhong@personal.com'),
('CUST0016', '张庆生', '企业', '19978833694', 'qingsheng.zhang@biz.com'),
('CUST0017', '谭宁', '企业', '19904989918', 'ning.tan@biz.com'),
('CUST0018', '黄元君', '企业', '17599063565', 'yuanjun.huang@biz.com'),
('CUST0019', '胡慧安', '企业', '19503213696', 'huian.hu@biz.com'),
('CUST0020', '钟和', '企业', '18718867824', 'he.zhong@biz.com'),
('CUST0021', '张庆生', '个人', '13080956666', 'qingsheng.zhang@home.com'),
('CUST0022', '谭宁', '个人', '13018558581', 'ning.tan@home.com'),
('CUST0023', '黄元君', '个人', '13362376786', 'yuanjun.huang@home.com'),
('CUST0024', '胡慧安', '个人', '19834819794', 'huian.hu@home.com');


INSERT INTO Part (PartID, PartName, Category, Brand, ApplicableModels, Specifications, SafetyStockLevel, CurrentStock, SuggestedPurchasePrice, SuggestedRetailPrice) VALUES 
('PART000001', '发动机油', '润滑油', '壳牌', '适用于多种车型', '5W-30', 50, 100, 200.00, 250.00),
('PART000002', '汽车蓄电池', '电池', '博世', '适用于轿车', '12V 60Ah', 30, 60, 500.00, 600.00),
('PART000003', '刹车片', '刹车系统', '安道拓', '适用于SUV', '前轮用', 100, 200, 150.00, 190.00),
('PART000004', '空气滤清器', '滤清器', '曼牌', '适用于奥迪A4', '型号A-2049', 20, 40, 80.00, 120.00),
('PART000005', '机油滤清器', '滤清器', '马勒', '适用于宝马3系', '型号ML-1049', 20, 50, 60.00, 90.00),
('PART000006', '火花塞', '点火系统', 'NGK', '适用于轿车', '双铂金', 200, 400, 70.00, 100.00),
('PART000007', '正时皮带', '传动系统', '盖茨', '适用于SUV', '型号T-1050', 15, 30, 300.00, 350.00),
('PART000008', '水泵', '冷却系统', '爱信', '适用于多种车型', '型号P-2050', 10, 20, 400.00, 450.00),
('PART000009', '散热器', '冷却系统', '电装', '适用于轿车', '型号R-3050', 5, 10, 700.00, 800.00),
('PART000010', '油漆', '车身附件', '杜邦', '适用于补漆', '金属漆', 100, 200, 100.00, 150.00),
('PART000011', '轮胎', '车轮系统', '米其林', '适用于SUV', '205/55 R16', 30, 60, 500.00, 650.00),
('PART000012', '悬挂减震器', '悬挂系统', '凯霍', '适用于多种车型', '型号S-2010', 20, 40, 800.00, 1000.00),
('PART000013', '传动轴', '传动系统', '德科', '适用于轿车', '型号D-1010', 15, 25, 1200.00, 1500.00),
('PART000014', '离合器套件', '传动系统', '博格华纳', '适用于卡车', '型号C-3030', 10, 20, 1500.00, 1800.00),
('PART000015', '转向器', '转向系统', '博世', '适用于多种车型', '电子转向', 25, 50, 2000.00, 2500.00);




INSERT INTO Sales (OrderID, EmpID, CustID, PartID, SalePrice, Quantity, SaleTime, DeliveryMethod) VALUES 
('ORDER000001', 'EmpID1', 'CustID1', 'PartID1', 200.00, 2, NOW(), '快递'),
('ORDER000002', 'EmpID2', 'CustID2', 'PartID2', 150.00, 1, NOW(), '自提'),
('ORDER000003', 'EmpID3', 'CustID3', 'PartID3', 300.00, 4, NOW(), '货运'),
-- ... 更多记录 ...
('ORDER000030', 'EmpID10', 'CustID30', 'PartID15', 500.00, 3, NOW(), '专线');

INSERT INTO Sales (OrderID, EmpID, CustID, PartID, SalePrice, Quantity, SaleTime, DeliveryMethod) VALUES 
('ORDER000031', 'EmpID1', 'CustID1', 'PartID1', 220.00, 1, NOW(), '快递'),
('ORDER000032', 'EmpID2', 'CustID2', 'PartID2', 180.00, 2, NOW(), '自提'),
('ORDER000033', 'EmpID3', 'CustID3', 'PartID3', 350.00, 3, NOW(), '货运'),
('ORDER000034', 'EmpID4', 'CustID4', 'PartID4', 210.00, 2, NOW(), '快递'),
('ORDER000035', 'EmpID5', 'CustID5', 'PartID5', 250.00, 1, NOW(), '自提'),
('ORDER000036', 'EmpID6', 'CustID6', 'PartID6', 190.00, 2, NOW(), '货运'),
('ORDER000037', 'EmpID7', 'CustID7', 'PartID7', 400.00, 1, NOW(), '快递'),
('ORDER000038', 'EmpID8', 'CustID8', 'PartID8', 230.00, 2, NOW(), '自提'),
('ORDER000039', 'EmpID9', 'CustID9', 'PartID9', 330.00, 1, NOW(), '货运'),
('ORDER000040', 'EmpID10', 'CustID10', 'PartID10', 260.00, 3, NOW(), '快递'),
('ORDER000041', 'EmpID1', 'CustID11', 'PartID11', 290.00, 2, NOW(), '自提'),
('ORDER000042', 'EmpID2', 'CustID12', 'PartID12', 310.00, 1, NOW(), '货运'),
('ORDER000043', 'EmpID3', 'CustID13', 'PartID13', 320.00, 3, NOW(), '快递'),
('ORDER000044', 'EmpID4', 'CustID14', 'PartID14', 270.00, 1, NOW(), '自提'),
('ORDER000045', 'EmpID5', 'CustID15', 'PartID15', 360.00, 2, NOW(), '货运'),
('ORDER000046', 'EmpID6', 'CustID16', 'PartID1', 205.00, 1, NOW(), '快递'),
('ORDER000047', 'EmpID7', 'CustID17', 'PartID2', 215.00, 2, NOW(), '自提'),
('ORDER000048', 'EmpID8', 'CustID18', 'PartID3', 225.00, 3, NOW(), '货运'),
('ORDER000049', 'EmpID9', 'CustID19', 'PartID4', 235.00, 1, NOW(), '快递'),
('ORDER000050', 'EmpID10', 'CustID20', 'PartID5', 245.00, 2, NOW(), '自提');


INSERT INTO Sales (OrderID, EmpID, CustID, PartID, SalePrice, Quantity, SaleTime, DeliveryMethod) VALUES 
('ORDER000051', 'EmpID1', 'CustID21', 'PartID6', 280.00, 1, NOW(), '快递'),
('ORDER000052', 'EmpID2', 'CustID22', 'PartID7', 300.00, 2, NOW(), '自提'),
('ORDER000053', 'EmpID3', 'CustID23', 'PartID8', 320.00, 1, NOW(), '货运'),
('ORDER000054', 'EmpID4', 'CustID24', 'PartID9', 340.00, 3, NOW(), '快递'),
('ORDER000055', 'EmpID5', 'CustID25', 'PartID10', 360.00, 2, NOW(), '自提'),
('ORDER000056', 'EmpID6', 'CustID26', 'PartID11', 380.00, 1, NOW(), '货运'),
('ORDER000057', 'EmpID7', 'CustID27', 'PartID12', 400.00, 2, NOW(), '快递'),
('ORDER000058', 'EmpID8', 'CustID28', 'PartID13', 420.00, 1, NOW(), '自提'),
('ORDER000059', 'EmpID9', 'CustID29', 'PartID14', 440.00, 3, NOW(), '货运'),
('ORDER000060', 'EmpID10', 'CustID30', 'PartID15', 460.00, 2, NOW(), '快递'),
('ORDER000061', 'EmpID1', 'CustID1', 'PartID1', 480.00, 1, NOW(), '自提'),
('ORDER000062', 'EmpID2', 'CustID2', 'PartID2', 500.00, 2, NOW(), '货运'),
('ORDER000063', 'EmpID3', 'CustID3', 'PartID3', 520.00, 1, NOW(), '快递'),
('ORDER000064', 'EmpID4', 'CustID4', 'PartID4', 540.00, 3, NOW(), '自提'),
('ORDER000065', 'EmpID5', 'CustID5', 'PartID5', 560.00, 2, NOW(), '货运'),
('ORDER000066', 'EmpID6', 'CustID6', 'PartID6', 580.00, 1, NOW(), '快递'),
('ORDER000067', 'EmpID7', 'CustID7', 'PartID7', 600.00, 2, NOW(), '自提'),
('ORDER000068', 'EmpID8', 'CustID8', 'PartID8', 620.00, 1, NOW(), '货运'),
('ORDER000069', 'EmpID9', 'CustID9', 'PartID9', 640.00, 3, NOW(), '快递'),
('ORDER000070', 'EmpID10', 'CustID10', 'PartID10', 660.00, 2, NOW(), '自提');





INSERT INTO LogisticsInformation (OrderID, SaleID, Status, EstimatedArrival, ActualArrival, ShippingCompany, TrackingNumber) 
VALUES 
('ORD00000003', 'SAL00000003', 'Delivered', '2023-07-20 12:00:00', '2023-07-22 15:00:00', 'USPS', 'TRK00000003'),
('ORD00000004', 'SAL00000004', 'Cancelled', '2023-08-15 09:00:00', '2023-08-17 10:00:00', 'FedEx', 'TRK00000004'),
('ORD00000005', 'SAL00000005', 'In Transit', '2023-09-05 14:00:00', '2023-09-07 16:00:00', 'DHL', 'TRK00000005'),
('ORD00000006', 'SAL00000006', 'Shipped', '2023-10-10 08:00:00', '2023-10-12 09:00:00', 'UPS', 'TRK00000006'),
('ORD00000007', 'SAL00000007', 'Delivered', '2023-11-18 11:00:00', '2023-11-20 13:00:00', 'USPS', 'TRK00000007'),
('ORD00000008', 'SAL00000008', 'Cancelled', '2023-12-22 17:00:00', '2023-12-24 18:00:00', 'FedEx', 'TRK00000008'),
('ORD00000009', 'SAL00000009', 'In Transit', '2023-01-28 07:00:00', '2023-01-30 08:00:00', 'DHL', 'TRK00000009'),
('ORD00000010', 'SAL00000010', 'Shipped', '2023-02-14 13:00:00', '2023-02-16 14:00:00', 'UPS', 'TRK00000010'),
('ORD00000011', 'SAL00000011', 'Delivered', '2023-03-23 10:00:00', '2023-03-25 11:00:00', 'USPS', 'TRK00000011'),
('ORD00000012', 'SAL00000012', 'Cancelled', '2023-04-30 16:00:00', '2023-05-02 17:00:00', 'FedEx', 'TRK00000012'),
('ORD00000013', 'SAL00000013', 'In Transit', '2023-06-19 09:00:00', '2023-06-21 10:00:00', 'DHL', 'TRK00000013'),
('ORD00000014', 'SAL00000014', 'Shipped', '2023-07-27 15:00:00', '2023-07-29 16:00:00', 'UPS', 'TRK00000014'),
('ORD00000015', 'SAL00000015', 'Delivered', '2023-08-31 08:00:00', '2023-09-02 09:00:00', 'USPS', 'TRK00000015'),
('ORD00000016', 'SAL00000016', 'Cancelled', '2023-10-05 14:00:00', '2023-10-07 15:00:00', 'FedEx', 'TRK00000016'),
('ORD00000017', 'SAL00000017', 'In Transit', '2023-11-09 12:00:00', '2023-11-11 13:00:00', 'DHL', 'TRK00000017'),
('ORD00000018', 'SAL00000018', 'Shipped', '2023-12-15 07:00:00', '2023-12-17 08:00:00', 'UPS', 'TRK00000018'),
('ORD00000019', 'SAL00000019', 'Delivered', '2023-01-20 11:00:00', '2023-01-22 12:00:00', 'USPS', 'TRK00000019'),
('ORD00000020', 'SAL00000020', 'Cancelled', '2023-02-25 17:00:00', '2023-02-27 18:00:00', 'FedEx', 'TRK00000020'),
('ORD00000021', 'SAL00000021', 'In Transit', '2023-03-28 13:00:00', '2023-03-30 14:00:00', 'DHL', 'TRK00000021'),
('ORD00000022', 'SAL00000022', 'Shipped', '2023-04-12 08:00:00', '2023-04-14 09:00:00', 'UPS', 'TRK00000022');


























