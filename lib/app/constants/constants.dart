
class Constants {
  //*********** APP CONSTANT **************
  static const String APP_DIR_LOCATION= "EXTERNAL"; //APP_DOC
  static const int RC_INT_SUCCESS= 0;
  static const int RC_INT_FAILED= 1;
  static const String DEFAULT_PIC= "assets/images/placeholder.jpg";
  static const double MAX_SOS_VIDEO_SIZE= 10; // MB
  static const int MAX_SOS_VIDEO_DURATION_IN_SECOND= 10;
  static const String SOS_EMAIL_ID= "sos@youtility.in";
  //*********** END APP CONSTANT **********


  //*********** VALIDATION CONSTANT **********
  static const String PLEASE_ENTER_NAME= "Please enter name";
  static const String PLEASE_ENTER_VALID_NAME=
      "Please enter name within range of 2 to 25 Characters";
  static const String PLEASE_ENTER_PHONE_NO= "Please enter phone number";
  static const String PLEASE_ENTER_VALID_PHONE_NO=
      "Please enter phone no within range of 10 to 16 digits";
  static const String PLEASE_ENTER_EMAIL_ADDRESS= "Please enter email address";
  static const String PLEASE_ENTER_VALID_EMAIL_ADDRESS =
      "Please enter valid email address";
  static const String PLEASE_ENTER_CATEGORY= "Please enter category";
  static const String PLEASE_ENTER_VALID_CATEGORY=
      "Please enter category within range of 1 to 3 Characters (eg. AB)";
  static const String PLEASE_ENTER_DURATION_IN_SECOND= "Please enter duration";
  static const String PLEASE_ENTER_VALID_DURATION_IN_SECOND=
      "Please enter duration within range of 0 to 300";
  static const String REGEX_EMAIL_VALIDATION =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const String REGEX_PHONE_VALIDATION = r'^[0-9]+$';
  static const String REGEX_LATITUDE_PATTERN =
      r'^(\+|-)?((\d((\.)|\.\d{1,10})?)|(0*?[0-8]\d((\.)|\.\d{1,10})?)|(0*?90((\.)|\.0{1,10})?))$';
  static const String REGEX_LONGITUDE_PATTERN =
      r'^(\+|-)?((\d((\.)|\.\d{1,10})?)|(0*?\d\d((\.)|\.\d{1,10})?)|(0*?1[0-7]\d((\.)|\.\d{1,10})?)|(0*?180((\.)|\.0{1,10})?))$';
  //*********** END VALIDATION CONSTANT **********


  //*********** STRING CONSTANT **************
  static const String APP_NAME= "PANIC";
  static const String APP_TITLE= "PANIC";
  static const String CONTACT= "Contacts";
  static const String SEARCH_CONTACTS= "Search contacts";
  static const String SUCCESS= "Success";
  static const String FAILED= "Failed";
  static const String OK= "OK";
  static const String PANIC_HISTORY= "Panic history";
  static const String SETTING= "Setting";
  static const String SETTINGS= "Settings";
  static const String MY_IDENTITY= "My Identity";
  static const String CANCEL= "CANCEL";
  static const String THIS_CONTACT_WILL_BE_DELETED= "This contact will be deleted.";
  static const String NAME= "Name";
  static const String PHONE= "Phone";
  static const String EMAIL= "Email";
  static const String ENABLE= "Enable";
  static const String CATEGORY= "Category";
  static const String SMS= "SMS";
  static const String PHOTO= "PHOTO";
  static const String VIDEO= "VIDEO";
  static const String NO_ITEM_FOUND= "No item found.";
  static const String YOU_DONT_HAVE_ANY_CONTACTS_YET= "You don't have any contacts yet";
  static const String LOADING= "Loading data";
  static const String LOADING_DATA= "Loading data";
  static const String SAVING_DATA= "Saving data";
  static const String SAVE= "SAVE";
  static const String SEARCH_CONTACT= "Search contact";
  static const String ADD_A_CONTACT= "Add a contact";
  static const String ADD_NEW_CONTACT= "Add new contact";
  static const String CONTACT_DETAILS= "Contact details";
  static const String EDIT_CONTACT= "Edit contact";
  static const String EMERGENCY_CONTACT_DETAILS= "Emergency Contact Details";
  static const String ERROR= "ERROR";
//*********** END STRING CONSTANT **************
}