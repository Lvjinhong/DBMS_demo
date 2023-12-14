use courseDesign;
drop TABLE Warehouse,Customer
drop TABLE `Storage`,Part,Employee
drop TABLE Department,LogisticsInformation,Sales


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
    RetailPrice FLOAT
);

CREATE TABLE Employee (
    EmpID CHAR(12) PRIMARY KEY,
    EmpName CHAR(50) NOT NULL,
    Gender CHAR(1) NOT NULL,
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


CREATE TABLE `Storage` (
		StoID CHAR(12) PRIMARY KEY,
    WareID CHAR(12),
    PartID CHAR(12),
    Quantity INT CHECK (Quantity >= 0),
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
    LogisticsID CHAR(12) PRIMARY KEY,
    OrderID CHAR(12),
    Status VARCHAR(50),
    DeliverTime DATETIME,
    SigningTime DATETIME CHECK (SigningTime >= DeliverTime),
    ShippingCompany VARCHAR(50),
    TrackingNumber VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Sales(OrderID)
);

drop TABLE Customer;

INSERT INTO Customer (CustID, CustName, CustType, ContactNumber, Email) VALUES
('CustID1', '张庆生', '个人', '13867187556', 'qingsheng.zhang@email.com'),
('CustID2', '谭宁', '个人', '13425222237', 'ning.tan@email.com'),
('CustID3', '黄元君', '个人', '17280015494', 'yuanjun.huang@email.com'),
('CustID4', '胡慧安', '个人', '15969634829', 'huian.hu@email.com'),
('CustID5', '钟和', '个人', '13953829559', 'he.zhong@email.com'),
('CustID6', '陈羽', '企业', '13115794993', 'yu.chen@company.com'),
('CustID7', '许宁', '企业', '15810454371', 'ning.xu@company.com'),
('CustID8', '郭元', '企业', '18768126176', 'yuan.guo@company.com'),
('CustID9', '胡安', '企业', '19821999025', 'an.hu@company.com'),
('CustID10', '张义', '企业', '13689895059', 'yi.zhang@company.com');


-- PartID: 零件ID, PartName: 零件名称, Category: 类别, Brand: 品牌, ApplicableModels: 适用车型, Specifications: 规格, SafetyStockLevel: 安全库存水平, CurrentStock: 当前库存, RetailPrice: 零售价
INSERT INTO Part (PartID, PartName, Category, Brand, ApplicableModels, Specifications, SafetyStockLevel, CurrentStock, RetailPrice) VALUES 
('PartID1', '发动机油', '润滑油', '壳牌', '多种车型', '5W-30', 50, 100,250.00),
('PartID2', '汽车蓄电池', '电池', '博世', '轿车', '12V 60Ah', 30, 60,  600.00),
('PartID3', '刹车片', '刹车系统', '安道拓', 'SUV', '前轮用', 100, 200,  190.00),
('PartID4', '空气滤清器', '滤清器', '曼牌', '奥迪A4', '型号A-2049', 20, 40, 120.00),
('PartID5', '机油滤清器', '滤清器', '马勒', '宝马3系', '型号ML-1049', 20, 50,  90.00),
('PartID6', '火花塞', '点火系统', 'NGK', '轿车', '双铂金', 200, 400,  100.00),
('PartID7', '正时皮带', '传动系统', '盖茨', 'SUV', '型号T-1050', 15, 30, 350.00),
('PartID8', '水泵', '冷却系统', '爱信', '多种车型', '型号P-2050', 10, 20,  450.00),
('PartID9', '散热器', '冷却系统', '电装', '轿车', '型号R-3050', 5, 10, 800.00),
('PartID10', '油漆', '车身附件', '杜邦', '补漆', '金属漆', 100, 200, 150.00),
('PartID11', '轮胎', '车轮系统', '米其林', 'SUV', '205/55 R16', 30, 60,  650.00),
('PartID12', '悬挂减震器', '悬挂系统', '凯霍', '多种车型', '型号S-2010', 20, 40,  1000.00),
('PartID13', '传动轴', '传动系统', '德科', '轿车', '型号D-1010', 15, 25, 1500.00),
('PartID14', '离合器套件', '传动系统', '博格华纳', '卡车', '型号C-3030', 10, 20,  1800.00),
('PartID15', '转向器', '转向系统', '博世', '多种车型', '电子转向', 25, 50,  2500.00);

-- EmpID: 员工ID, EmpName: 员工姓名, Gender: 性别, Position: 职位, ContactNumber: 联系电话, Email: 电子邮件
INSERT INTO Employee (EmpID, EmpName, Gender,  Position, ContactNumber, Email) VALUES 
('EmpID1', '王建军', 'M', '销售管理员', '0282926306760', 'wangjianjun@example.com'),
('EmpID2', '吴红梅', 'F', '销售管理员', '6514247349', 'wuhongmei@example.com'),
('EmpID3', '左君', 'M', '销售管理员', '6564447149', 'zuojun@example.com'),
('EmpID4', '石玉英', 'F', '销售管理员', '71546732745', 'shiyuying@example.com'),
('EmpID5', '黎帅', 'M', '销售管理员', '9596575583720', 'lishuai@example.com'),
('EmpID6', '王玉', 'F',  '仓库管理员', '04629909578', 'wangyu@example.com'),
('EmpID7', '林秀云', 'M', '仓库管理员', '8394078965', 'linxiuyun@example.com'),
('EmpID8', '林俊', 'F', '仓库管理员', '5403354462', 'linjun@example.com'),
('EmpID9', '李志强', 'M',  '仓库管理员', '57638866682', 'lizhiqiang@example.com'),
('EmpID10', '贾莹', 'F', '仓库管理员', '190976022898', 'jiaying@example.com');

INSERT INTO Department (DepID, DepName, Email) VALUES 
('DepID1', '销售部', 'sales@example.com'),
('DepID2', '仓库部', 'warehouse@example.com');

INSERT INTO Warehouse (WareID, WareName, Address, ManagerID) VALUES 
('WareID1', '仓库A', '新疆维吾尔自治区台北县西峰乌鲁木齐路o座', 'EmpID10'),
('WareID2', '仓库B', '澳门特别行政区秀珍市高明深圳路V座', 'EmpID6'),
('WareID3', '仓库C', '海南省涛市西夏太原路u座', 'EmpID6'),
('WareID4', '仓库D', '甘肃省合山县龙潭郭路Q座', 'EmpID8'),
('WareID5', '仓库E', '河南省重庆市永川雷街x座', 'EmpID9'),
('WareID6', '仓库F', '澳门特别行政区丽县清浦六盘水街I座', 'EmpID9'),
('WareID7', '仓库G', '重庆市峰市平山林街q座', 'EmpID6'),
('WareID8', '仓库H', '甘肃省玉英市梁平成都街I座', 'EmpID6'),
('WareID9', '仓库I', '青海省欣县房山天津路H座', 'EmpID10'),
('WareID10', '仓库J', '青海省澳门市牧野管街j座', 'EmpID7');


-- OrderID: 订单ID, EmpID: 员工ID, CustID: 客户ID, PartID: 零件ID, SalePrice: 销售价格, Quantity: 数量, SaleTime: 销售时间, DeliveryMethod: 交货方式
INSERT INTO Sales (OrderID, EmpID, CustID, PartID, SalePrice, Quantity, SaleTime, DeliveryMethod) VALUES 
('OrderID01', 'EmpID2', 'CustID6', 'PartID10', 503.16, 2, '2023-01-02', '自提'),
('OrderID02', 'EmpID1', 'CustID2', 'PartID7', 348.63, 2, '2023-01-03', '快递'),
('OrderID03', 'EmpID3', 'CustID5', 'PartID4', 190.11, 4, '2023-01-14', '自提'),
('OrderID04', 'EmpID4', 'CustID1', 'PartID6', 238.72, 4, '2023-01-31', '自提'),
('OrderID05', 'EmpID5', 'CustID8', 'PartID3', 422.89, 4, '2023-02-01', '快递'),
('OrderID06', 'EmpID2', 'CustID3', 'PartID15', 512.48, 2, '2023-02-03', '快递'),
('OrderID07', 'EmpID1', 'CustID7', 'PartID2', 556.95, 1, '2023-02-05', '快递'),
('OrderID08', 'EmpID5', 'CustID4', 'PartID13', 576.03, 1, '2023-02-11', '自提'),
('OrderID09', 'EmpID3', 'CustID9', 'PartID6', 295.22, 4, '2023-02-14', '快递'),
('OrderID10', 'EmpID4', 'CustID2', 'PartID10', 485.03, 4, '2023-02-16', '自提'),
('OrderID11', 'EmpID2', 'CustID10', 'PartID11', 240.95, 3, '2023-02-23', '快递'),
('OrderID12', 'EmpID1', 'CustID1', 'PartID5', 650.81, 2, '2023-02-26', '自提'),
('OrderID13', 'EmpID5', 'CustID7', 'PartID12', 356.42, 2, '2023-03-04', '快递'),
('OrderID14', 'EmpID3', 'CustID3', 'PartID3', 394.33, 2, '2023-03-12', '自提'),
('OrderID15', 'EmpID4', 'CustID5', 'PartID13', 306.72, 1, '2023-03-15', '快递'),
('OrderID16', 'EmpID2', 'CustID6', 'PartID14', 339.53, 1, '2023-03-17', '快递'),
('OrderID17', 'EmpID1', 'CustID4', 'PartID10', 367.10, 3, '2023-03-24', '自提'),
('OrderID18', 'EmpID3', 'CustID8', 'PartID1', 262.87, 1, '2023-03-27', '快递'),
('OrderID19', 'EmpID5', 'CustID2', 'PartID2', 437.56, 4, '2023-04-01', '快递'),
('OrderID20', 'EmpID4', 'CustID9', 'PartID9', 362.74, 4, '2023-04-05', '自提'),
('OrderID21', 'EmpID2', 'CustID1', 'PartID8', 377.11, 3, '2023-04-11', '快递'),
('OrderID22', 'EmpID3', 'CustID10', 'PartID7', 499.22, 1, '2023-04-19', '快递'),
('OrderID23', 'EmpID1', 'CustID7', 'PartID6', 457.95, 3, '2023-04-24', '自提'),
('OrderID24', 'EmpID5', 'CustID5', 'PartID5', 309.86, 1, '2023-04-30', '快递'),
('OrderID25', 'EmpID4', 'CustID6', 'PartID4', 522.39, 4, '2023-05-02', '快递'),
('OrderID26', 'EmpID3', 'CustID3', 'PartID3', 401.15, 1, '2023-05-07', '自提'),
('OrderID27', 'EmpID2', 'CustID8', 'PartID2', 183.72, 2, '2023-05-12', '快递'),
('OrderID28', 'EmpID1', 'CustID9', 'PartID1', 245.33, 3, '2023-05-15', '快递'),
('OrderID29', 'EmpID5', 'CustID10', 'PartID15', 623.28, 2, '2023-05-20', '自提'),
('OrderID30', 'EmpID4', 'CustID4', 'PartID14', 659.20, 1, '2023-05-23', '快递'),
('OrderID31', 'EmpID3', 'CustID1', 'PartID13', 227.56, 1, '2023-05-29', '快递'),
('OrderID32', 'EmpID2', 'CustID2', 'PartID12', 538.29, 3, '2023-06-03', '自提'),
('OrderID33', 'EmpID1', 'CustID7', 'PartID11', 376.45, 4, '2023-06-09', '快递'),
('OrderID34', 'EmpID5', 'CustID5', 'PartID10', 543.17, 2, '2023-06-13', '快递'),
('OrderID35', 'EmpID4', 'CustID3', 'PartID9', 314.93, 3, '2023-06-19', '自提'),
('OrderID36', 'EmpID3', 'CustID8', 'PartID8', 411.75, 1, '2023-06-24', '快递'),
('OrderID37', 'EmpID2', 'CustID9', 'PartID7', 592.81, 2, '2023-07-02', '快递'),
('OrderID38', 'EmpID1', 'CustID10', 'PartID6', 240.09, 4, '2023-07-06', '自提'),
('OrderID39', 'EmpID5', 'CustID6', 'PartID5', 489.45, 1, '2023-07-15', '快递'),
('OrderID40', 'EmpID4', 'CustID4', 'PartID4', 608.92, 2, '2023-07-19', '快递');



INSERT INTO LogisticsInformation (LogisticsID, OrderID, `Status`, DeliverTime, SigningTime, ShippingCompany, TrackingNumber) VALUES 
('LogID93006', 'OrderID02', '已签收', '2023-01-04', '2023-01-06', '顺丰', 'SF04901323');
('LogID01253', 'OrderID05', '已发货', '2023-02-02', NULL, '圆通', 'YT96583796');
('LogID26410', 'OrderID06', '待发货', NULL, NULL, '京东', 'JD11249555'),
('LogID97922', 'OrderID07', '待发货', NULL, NULL, '极兔', 'JT39066242'),
('LogID97853', 'OrderID09', '待发货', NULL, NULL, '圆通', 'YT86745468'),
('LogID07240', 'OrderID11', '待发货', NULL, NULL, '京东', 'JD07536193'),
('LogID32127', 'OrderID13', '待发货', NULL, NULL, '极兔', 'JT71422750'),
('LogID96246', 'OrderID15', '已签收', '2023-03-16', '2023-03-18', '极兔', 'JT73141054'),
('LogID42104', 'OrderID16', '已发货', '2023-03-18', NULL, '顺丰', 'SF06293734'),
('LogID82237', 'OrderID18', '已发货', '2023-03-28', NULL, '极兔', 'JT79009149'),
('LogID61135', 'OrderID19', '已签收', '2023-04-02', '2023-04-10', '极兔', 'JT69067101'),
('LogID60518', 'OrderID21', '已签收', '2023-04-12', '2023-04-21', '中通', 'ZT74170611'),
('LogID25093', 'OrderID22', '已发货', '2023-04-20', NULL, '京东', 'JD17304722'),
('LogID30802', 'OrderID24', '已签收', '2023-05-01', '2023-05-05', '京东', 'JD74958771'),
('LogID36265', 'OrderID25', '已签收', '2023-05-03', '2023-05-07', '顺丰', 'SF85239812'),
('LogID78218', 'OrderID27', '待发货', NULL, NULL, '顺丰', 'SF66413381'),
('LogID72656', 'OrderID28', '已发货', '2023-05-16', NULL, '中通', 'ZT72258075'),
('LogID70452', 'OrderID30', '已发货', '2023-05-24', NULL, '京东', 'JD28269813'),
('LogID33956', 'OrderID31', '待发货', NULL, NULL, '极兔', 'JT09725678'),
('LogID40132', 'OrderID33', '已签收', '2023-06-10', '2023-06-15', '中通', 'ZT87394949'),
('LogID52473', 'OrderID34', '已签收', '2023-06-14', '2023-06-17', '京东', 'JD63586555'),
('LogID92793', 'OrderID36', '待发货', NULL, NULL, '京东', 'JD37149277'),
('LogID74919', 'OrderID37', '已发货', '2023-07-03', NULL, '京东', 'JD72050882'),
('LogID73586', 'OrderID39', '已发货', '2023-07-16', NULL, '京东', 'JD62272948'),
('LogID51007', 'OrderID40', '待发货', NULL, NULL, '京东', 'JD61168789');


INSERT INTO `Storage` (StoID,WareID,PartID,Quantity) VALUES
('WareID8', 'PartID2', 5),
('WareID5', 'PartID2', 1),
('WareID8', 'PartID3', 186),
('WareID6', 'PartID3', 13),
('WareID8', 'PartID3', 1),
('WareID6', 'PartID4', 7),
('WareID4', 'PartID4', 12),
('WareID10', 'PartID4', 10),
('WareID8', 'PartID4', 7),
('WareID2', 'PartID4', 2),
('WareID7', 'PartID4', 1),
('WareID4', 'PartID4', 1),
('WareID5', 'PartID5', 19),
('WareID5', 'PartID5', 13),
('WareID4', 'PartID5', 7),
('WareID8', 'PartID5', 6),
('WareID7', 'PartID5', 1),
('WareID4', 'PartID5', 3),
('WareID10', 'PartID5', 1),
('WareID10', 'PartID6', 120),
('WareID10', 'PartID6', 144),
('WareID4', 'PartID6', 75),
('WareID3', 'PartID6', 61),
('WareID7', 'PartID7', 2),
('WareID4', 'PartID7', 14),
('WareID5', 'PartID7', 5),
('WareID5', 'PartID7', 5),
('WareID10', 'PartID7', 4),
('WareID4', 'PartID8', 15),
('WareID7', 'PartID8', 1),
('WareID10', 'PartID8', 4),
('WareID4', 'PartID9', 5),
('WareID6', 'PartID9', 1),
('WareID8', 'PartID9', 1),
('WareID3', 'PartID9', 3),
('WareID10', 'PartID10', 78),
('WareID8', 'PartID10', 104),
('WareID10', 'PartID10', 1),
('WareID7', 'PartID10', 11),
('WareID1', 'PartID10', 2),
('WareID2', 'PartID10', 2),
('WareID7', 'PartID10', 2),
('WareID8', 'PartID11', 14),
('WareID4', 'PartID11', 31),
('WareID3', 'PartID11', 1),
('WareID6', 'PartID11', 8),
('WareID7', 'PartID11', 6),
('WareID10', 'PartID12', 39),
('WareID3', 'PartID12', 1),
('WareID2', 'PartID13', 16),
('WareID6', 'PartID13', 3),
('WareID2', 'PartID13', 1),
('WareID3', 'PartID13', 3),
('WareID2', 'PartID13', 2),
('WareID10', 'PartID14', 13),
('WareID10', 'PartID14', 6),
('WareID8', 'PartID14', 1),
('WareID3', 'PartID15', 21),
('WareID1', 'PartID15', 6),
('WareID8', 'PartID15', 15),
('WareID7', 'PartID15', 5),
('WareID9', 'PartID15', 1),
('WareID7', 'PartID15', 1),
('WareID5', 'PartID15', 1);



















