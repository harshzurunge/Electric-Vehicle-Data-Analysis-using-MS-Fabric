[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "BatteryDim_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared BatteryDim = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "32b0730f-d652-4ec5-b12c-b2db5af7f629"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "11b218f0-d5fc-4ae9-a504-9e93de655b24"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "BatteryDim", ItemKind = "Table"]}[Data],
  #"Added index" = Table.AddIndexColumn(#"Navigation 2", "Index", 1, 1, Int64.Type),
  #"Renamed columns" = Table.RenameColumns(#"Added index", {{"Index", "BatteryID"}}),
  #"Reordered columns" = Table.ReorderColumns(#"Renamed columns", {"BatteryID", "Battery_Type", "Charging_Type"})
in
  #"Reordered columns";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "CountryColorDim_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared CountryColorDim = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "32b0730f-d652-4ec5-b12c-b2db5af7f629"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "11b218f0-d5fc-4ae9-a504-9e93de655b24"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "CountryColorDim", ItemKind = "Table"]}[Data],
  #"Added index" = Table.AddIndexColumn(#"Navigation 2", "Index", 1, 1, Int64.Type),
  #"Renamed columns" = Table.RenameColumns(#"Added index", {{"Index", "InfoID"}}),
  #"Reordered columns" = Table.ReorderColumns(#"Renamed columns", {"InfoID", "ManCountry", "Color"})
in
  #"Reordered columns";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "VehicalModelDim_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared VehicalModelDim = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "32b0730f-d652-4ec5-b12c-b2db5af7f629"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "11b218f0-d5fc-4ae9-a504-9e93de655b24"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "VehicalModelDim", ItemKind = "Table"]}[Data],
  #"Added index" = Table.AddIndexColumn(#"Navigation 2", "Index", 1, 1, Int64.Type),
  #"Renamed columns" = Table.RenameColumns(#"Added index", {{"Index", "ModelID"}}),
  #"Reordered columns" = Table.ReorderColumns(#"Renamed columns", {"ModelID", "Manufacturer", "Model"})
in
  #"Reordered columns";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "YearDimSilver_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared YearDimSilver = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "32b0730f-d652-4ec5-b12c-b2db5af7f629"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "11b218f0-d5fc-4ae9-a504-9e93de655b24"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "YearDimSilver", ItemKind = "Table"]}[Data],
  #"Added index" = Table.AddIndexColumn(#"Navigation 2", "Index", 1, 1, Int64.Type),
  #"Renamed columns" = Table.RenameColumns(#"Added index", {{"Index", "YearID"}}),
  #"Reordered columns" = Table.ReorderColumns(#"Renamed columns", {"YearID", "Year"})
in
  #"Reordered columns";
shared BatteryDim_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = null, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "32b0730f-d652-4ec5-b12c-b2db5af7f629"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "be8e77ff-4f98-43b2-88f3-1df4d9f9f371"]}[Data],
  TableNavigation = Navigation_2{[Id = "BatteryDim", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared CountryColorDim_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = null, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "32b0730f-d652-4ec5-b12c-b2db5af7f629"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "be8e77ff-4f98-43b2-88f3-1df4d9f9f371"]}[Data],
  TableNavigation = Navigation_2{[Id = "CountryColorDim", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared VehicalModelDim_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = null, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "32b0730f-d652-4ec5-b12c-b2db5af7f629"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "be8e77ff-4f98-43b2-88f3-1df4d9f9f371"]}[Data],
  TableNavigation = Navigation_2{[Id = "VehicalModelDim", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared YearDimSilver_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = null, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "32b0730f-d652-4ec5-b12c-b2db5af7f629"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "be8e77ff-4f98-43b2-88f3-1df4d9f9f371"]}[Data],
  TableNavigation = Navigation_2{[Id = "YearDimSilver", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
