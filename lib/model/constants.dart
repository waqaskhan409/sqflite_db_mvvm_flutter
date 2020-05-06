
class Constants{

  /*This is Database configuration*/
  static const DB_VERSION = 5;
  static const DB_NAME = "/stuff";

  /*This is Stuff table configuration*/
  static const TABLE_NAME_STUFF = "STUFF";
  static const COLUMN_1_STUFF = "id";
  static const COLUMN_2_STUFF = "name";
  static const COLUMN_3_STUFF = "description";
  static const COLUMN_4_STUFF = "purpose";
  static const COLUMN_5_STUFF = "is_okey";
  static const COLUMN_6_STUFF = "is_idle";

  /*This is Appliance table configuration*/
  static const TABLE_NAME_APPLIANCE = "APPLIANCE";
  static const COLUMN_1_APPLIANCES = "id";
  static const COLUMN_2_APPLIANCES = "stuff_id";
  static const COLUMN_3_APPLIANCES = "appliance_name";
  static const COLUMN_4_APPLIANCES = "is_simple";



}