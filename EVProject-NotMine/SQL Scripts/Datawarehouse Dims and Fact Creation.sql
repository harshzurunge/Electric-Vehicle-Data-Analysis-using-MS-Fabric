--CREATE DIMENSIONS
CREATE TABLE [BatteryDim] (
  [BatteryID] INT,
  [BatteryType] VARCHAR(255),
  [ChargingType] VARCHAR(255)
--   PRIMARY KEY ([BatteryID])
);

CREATE TABLE [VehicleModelDim] (
  [ModelID] INT,
  [Manufacturer] VARCHAR(100),
  [Model] VARCHAR(255)
--   PRIMARY KEY ([ModelID])
);

CREATE TABLE [CountryColorDim] (
  [InfoID] INT,
  [ManCountry] VARCHAR(100),
  [Color] VARCHAR(100)
--   PRIMARY KEY ([InfoID])
);

CREATE TABLE [YearDim] (
  [YearID] INT,
  [Year] INT,
  [Decade] VARCHAR(5)
--   PRIMARY KEY ([YearID])
);


CREATE TABLE [VehicleFact] (
  [VehicleID] INT,
  [BatteryCapacityKwh] FLOAT,
  [RangeKM] INT,
  [ChargeTimeHR] FLOAT,
  [PriceUSD] FLOAT,
  [AutonemousLevel] INT,
  [SafetyRating] INT,
  [UnitsSold2024] INT,
  [WarrantyYears] INT,
  [ModelYearID] INT,
  [VehicleIModelD] INT,
  [BatteryID] INT,
  [ManCountryID] INT
--   PRIMARY KEY ([VehicleID]),
--   CONSTRAINT [FK_VehicleFact_VehicleIModelD]
--     FOREIGN KEY ([VehicleIModelD])
--       REFERENCES [VehicleModelDim]([ModelID]),
--   CONSTRAINT [FK_VehicleFact_ManCountryID]
--     FOREIGN KEY ([ManCountryID])
--       REFERENCES [CountryColorDim]([InfoID]),
--   CONSTRAINT [FK_VehicleFact_ModelYearID]
--     FOREIGN KEY ([ModelYearID])
--       REFERENCES [YearDim]([YearID]),
--   CONSTRAINT [FK_VehicleFact_BatteryID]
--     FOREIGN KEY ([BatteryID])
--       REFERENCES [BatteryDim]([BatteryID])
);

