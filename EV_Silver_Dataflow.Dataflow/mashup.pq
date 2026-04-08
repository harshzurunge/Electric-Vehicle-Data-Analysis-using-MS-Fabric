[DefaultOutputDestinationSettings = [DestinationDefinition = [Kind = "Reference", QueryName = "DefaultDestination", IsNewTarget = true], UpdateMethod = [Kind = "Replace"], DestinationTypeSettings = [Kind = "Table"]], StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared DefaultDestination = Lakehouse.Contents([EnableFolding = false]){[workspaceId = "32b0730f-d652-4ec5-b12c-b2db5af7f629"]}[Data]{[lakehouseId = "11b218f0-d5fc-4ae9-a504-9e93de655b24"]}[Data];
shared ev_data = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "32b0730f-d652-4ec5-b12c-b2db5af7f629"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "3ce1531f-7812-4749-a8c2-48564e770b90"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "ev_data", ItemKind = "Table"]}[Data],
  #"Changed column type" = Table.TransformColumnTypes(#"Navigation 2", {{"Vehicle_ID", Int64.Type}, {"Year", Int64.Type}, {"Battery_Capacity_kWh", Int64.Type}, {"Range_km", Int64.Type}, {"Charge_Time_hr", Int64.Type}, {"Price_USD", Int64.Type}, {"Autonomous_Level", Int64.Type}, {"CO2_Emissions_g_per_km", Int64.Type}, {"Safety_Rating", Int64.Type}, {"Units_Sold_2024", Int64.Type}, {"Warranty_Years", Int64.Type}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "YearDimSilver_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared YearDimSilver = let
  Source = ev_data,
  #"Choose columns" = Table.SelectColumns(Source, {"Year"}),
  #"Removed duplicates" = Table.Distinct(#"Choose columns", {"Year"}),
  #"Sorted rows" = Table.Sort(#"Removed duplicates", {{"Year", Order.Ascending}})
in
  #"Sorted rows";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "BatteryDim_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared BatteryDim = let
  Source = ev_data,
  #"Choose columns" = Table.SelectColumns(Source, {"Battery_Type", "Charging_Type"}),
  #"Trimmed text" = Table.TransformColumns(#"Choose columns", {{"Charging_Type", each Text.Trim(_), type nullable text}}),
  #"Removed duplicates" = Table.Distinct(#"Trimmed text", {"Battery_Type"}),
  #"Sorted rows" = Table.Sort(#"Removed duplicates", {{"Battery_Type", Order.Ascending}})
in
  #"Sorted rows";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "VehicalModelDim_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared VehicalModelDim = let
  Source = ev_data,
  #"Choose columns" = Table.SelectColumns(Source, {"Manufacturer", "Model"}),
  #"Trimmed text" = Table.TransformColumns(#"Choose columns", {{"Model", each Text.Trim(_), type nullable text}}),
  #"Removed duplicates" = Table.Distinct(#"Trimmed text", {"Manufacturer"}),
  #"Sorted rows" = Table.Sort(#"Removed duplicates", {{"Manufacturer", Order.Ascending}})
in
  #"Sorted rows";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "CountryColorDim_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared CountryColorDim = let
  Source = ev_data,
  #"Choose columns" = Table.SelectColumns(Source, {"Color", "Country_of_Manufacture"}),
  #"Renamed columns" = Table.RenameColumns(#"Choose columns", {{"Country_of_Manufacture", "ManCountry"}}),
  #"Trimmed text" = Table.TransformColumns(#"Renamed columns", {{"ManCountry", each Text.Trim(_), type nullable text}}),
  #"Removed duplicates" = Table.Distinct(#"Trimmed text", {"ManCountry"})
in
  #"Removed duplicates";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "VehicalFact_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared VehicalFact = let
  Source = ev_data,
  #"Choose columns" = Table.SelectColumns(Source, {"Vehicle_ID", "Battery_Capacity_kWh", "Range_km", "Charge_Time_hr", "Price_USD", "Autonomous_Level", "Safety_Rating", "Units_Sold_2024", "Warranty_Years"}),
  #"Replaced value" = Table.ReplaceValue(#"Choose columns", null, 3, Replacer.ReplaceValue, {"Autonomous_Level"}),
  #"Replaced value 1" = Table.ReplaceValue(#"Replaced value", null, 3, Replacer.ReplaceValue, {"Safety_Rating"}),
  #"Renamed columns" = Table.RenameColumns(#"Replaced value 1", {{"Units_Sold_2024", "Units_Sold"}}),
  #"Sorted rows" = Table.Sort(#"Renamed columns", {{"Vehicle_ID", Order.Ascending}})
in
  #"Sorted rows";
shared VehicalFact_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = null, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "32b0730f-d652-4ec5-b12c-b2db5af7f629"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "11b218f0-d5fc-4ae9-a504-9e93de655b24"]}[Data],
  TableNavigation = Navigation_2{[Id = "VehicalFact", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared YearDimSilver_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = null, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "32b0730f-d652-4ec5-b12c-b2db5af7f629"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "11b218f0-d5fc-4ae9-a504-9e93de655b24"]}[Data],
  TableNavigation = Navigation_2{[Id = "YearDimSilver", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared BatteryDim_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = null, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "32b0730f-d652-4ec5-b12c-b2db5af7f629"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "11b218f0-d5fc-4ae9-a504-9e93de655b24"]}[Data],
  TableNavigation = Navigation_2{[Id = "BatteryDim", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared VehicalModelDim_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = null, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "32b0730f-d652-4ec5-b12c-b2db5af7f629"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "11b218f0-d5fc-4ae9-a504-9e93de655b24"]}[Data],
  TableNavigation = Navigation_2{[Id = "VehicalModelDim", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared CountryColorDim_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = null, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "32b0730f-d652-4ec5-b12c-b2db5af7f629"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "11b218f0-d5fc-4ae9-a504-9e93de655b24"]}[Data],
  TableNavigation = Navigation_2{[Id = "CountryColorDim", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
