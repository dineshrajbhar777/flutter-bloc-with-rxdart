import 'package:fluttersampleapp/app/constants/constants.dart';

class Validation {
  static bool isValid(String thingNeedToBeValidated, String validationPattern) {
    return new RegExp(validationPattern).hasMatch(thingNeedToBeValidated);
  }

  static bool isValidEmail(String email) {
    return isValid(email, Constants.REGEX_EMAIL_VALIDATION);
  }

  static bool isValidPhone(String phone) {
    return isValid(phone, Constants.REGEX_PHONE_VALIDATION);
  }

  static bool isValidLatitude(String latitude) {
    return isValid(latitude, Constants.REGEX_LATITUDE_PATTERN);
  }

  static bool isValidLongitude(String longitude) {
    return isValid(longitude, Constants.REGEX_LONGITUDE_PATTERN);
  }

  static String validateName(String value){
    if(value.isEmpty) {
      return Constants.PLEASE_ENTER_NAME;
    }
    if(!(value.length > 1 && value.length <= 25)) {
      return Constants.PLEASE_ENTER_VALID_NAME;
    }
    return null;
  }

  static String validatePhone(String value){
    if(value.isEmpty) {
      return Constants.PLEASE_ENTER_PHONE_NO;
    }
    if(!(value.length >= 10 && value.length <= 16)) {
      return Constants.PLEASE_ENTER_VALID_PHONE_NO;
    }
    return null;
  }

  static String validateEmail(String value){
    if(value.isEmpty) {
      return Constants.PLEASE_ENTER_EMAIL_ADDRESS;
    }
    if(!isValidEmail(value)){
      return Constants.PLEASE_ENTER_VALID_EMAIL_ADDRESS;
    }
    return null;
  }

  static String validateCategory(String value){
    if(value.isEmpty) {
      return Constants.PLEASE_ENTER_CATEGORY;
    }
    if(!(value.length >= 1 && value.length <= 3)) {
      return Constants.PLEASE_ENTER_VALID_CATEGORY;
    }
    return null;
  }

  static String validateDurationInSeconds(String value){
    if(value.isEmpty) {
      return Constants.PLEASE_ENTER_DURATION_IN_SECOND;
    }
    if(!(value.length >= 1 && value.length <= 3)) {
      return Constants.PLEASE_ENTER_VALID_DURATION_IN_SECOND;
    } else {
      try {
        int dur = int.parse(value);
        if (!(dur >= 0 && dur <= 300)) {
          return Constants.PLEASE_ENTER_VALID_DURATION_IN_SECOND;
        }
      } catch (error) {
        return Constants.PLEASE_ENTER_VALID_DURATION_IN_SECOND;
      }
    }
    return null;
  }
}