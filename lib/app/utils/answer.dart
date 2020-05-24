import 'package:fluttersampleapp/app/constants/constants.dart';
import 'package:fluttersampleapp/app/utils/story.dart';

class Answer {
  int pkid= -1;
  int rc= 0;
  String msg= "OK";
  String reason= "OK";
  String more= "...";
  List<dynamic> data;
  Answer() {
    this.pkid= -1;
    this.rc= Constants.RC_INT_SUCCESS;
    this.msg= Constants.OK;
    this.reason= Constants.OK;
    this.more= "...";
  }

  String details() {
    int dl= this.data==null ? 0 : this.data.length;
    String s= "printing Answer attribute\n";
    s+= "Answer.details rc:     ${this.rc}\n";
    s+= "Answer.details pkid:   ${this.pkid}\n";
    s+= "Answer.details msg:    ${this.msg}\n";
    s+= "Answer.details reason: ${this.reason}\n";
    s+= "Answer.details length: ${this.data?.length}\n";
    s+= "Answer.details data:   ${this.data}\n";
    for(var i= 0; i<dl; i++){
      s+= "[${i + 1} of $dl] ${this.data[i].toJson()}\n";
    }
    s+= "Answer.details: more:  ${this.more}\n";
    return s;
  }
}
