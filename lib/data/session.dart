class Session{
  static int userID = 0;
  static int step = 0;
  static String loginName = "";
  static String loginEmail = "";
  static String loginMobile = "";
  static String appToken = "";
  static String code = "";
  static String cCode = "";
  static String businessName = "";
  static String profilePic = "";
  static int noInternetPage = 0;
  static double rating = 5;


  int getInternetPage(){
    return noInternetPage;
   }
  int getUserID() {
    return userID;
  }
  int getStep() {
    return step;
  }
  double getRating() {
    return rating;
  }
  String getBusinessName() {
    return businessName;
  }
  String getProfilePic() {
    return profilePic;
  }
  String getLoginName() {
    return loginName;
  }
  String getLoginEmail() {
    return loginEmail;
  }
  String getLoginMobile() {
    return loginMobile;
  }
  String getAppToken() {
    return appToken;
  }
  String getCode() {
    return code;
  }
  String getcCode() {
    return cCode;
  }

  setInternetPage(int val){
    noInternetPage = val;
  }
  setUserID(int val) {
    userID = val;
  }
  setStep(int val) {
    step = val;
  }
  setRating(double val) {
    rating = val;
  }
  setLoginName(String val) {
    loginName = val;
  }
  setProfilePic(String val) {
    profilePic = val;
  }
  setBusinessName(String val) {
    businessName = val;
  }
  setLoginEmail(String val) {
    loginEmail = val;
  }
  setLoginMobile(String val) {
    loginMobile = val;
  }
  setAppToken(String val) {
    appToken = val;
  }
  setCode(String val) {
    code = val;
  }
  setcCode(String val) {
    cCode = val;
  }

}