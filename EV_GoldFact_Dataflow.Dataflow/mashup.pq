[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared BatteryDim = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "32b0730f-d652-4ec5-b12c-b2db5af7f629"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "11b218f0-d5fc-4ae9-a504-9e93de655b24"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "BatteryDim", ItemKind = "Table"]}[Data]
in
  #"Navigation 2";
shared VehicalFact = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "32b0730f-d652-4ec5-b12c-b2db5af7f629"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "11b218f0-d5fc-4ae9-a504-9e93de655b24"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "VehicalFact", ItemKind = "Table"]}[Data]
in
  #"Navigation 2";
