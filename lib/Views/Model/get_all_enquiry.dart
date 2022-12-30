class GetAllActiveModel {
  int? status;
  String? message;
  List<GetAllActiveData>? users;

  GetAllActiveModel({this.status, this.message, this.users});

  GetAllActiveModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['users'] != null) {
      users = <GetAllActiveData>[];
      json['users'].forEach((v) {
        users!.add(new GetAllActiveData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetAllActiveData {
  String? cUSID;
  String? cUSTT;
  String? cUSNAME;
  String? cUSPHONE;
  String? cUSADDRESS;
  String? lEADSTATUS;
  String? fIELDPROCESS;
  String? oFFICEPROCESS;
  String? fACTORYPROCESS;
  String? rEFERTO;
  String? cUSLASTCOMMENT;
  String? wPSID;
  String? wPSTT;
  String? wPSCUSID;
  String? wPSFIELDPROCESS;
  String? wPSOFFICEPROCESS;
  String? wPSFACTORYPROCESS;
  String? wPSLOGINID;
  String? wPSLASTCOMMENT;
  bool? isSelected0;
  bool? isSelected1;
  bool? isSelected2;
  bool? isSelected3;



  GetAllActiveData(
      {this.cUSID,
        this.cUSTT,
        this.cUSNAME,
        this.isSelected0,
        this.isSelected1,
        this.isSelected2,
        this.isSelected3,
        this.cUSPHONE,
        this.cUSADDRESS,
        this.lEADSTATUS,
        this.fIELDPROCESS,
        this.oFFICEPROCESS,
        this.fACTORYPROCESS,
        this.rEFERTO,
        this.cUSLASTCOMMENT,
        this.wPSID,
        this.wPSTT,
        this.wPSCUSID,
        this.wPSFIELDPROCESS,
        this.wPSOFFICEPROCESS,
        this.wPSFACTORYPROCESS,
        this.wPSLOGINID,
        this.wPSLASTCOMMENT});

  GetAllActiveData.fromJson(Map<String, dynamic> json) {
    cUSID = json['CUS_ID'];
    cUSTT = json['CUS_TT'];
    cUSNAME = json['CUS_NAME'];
    cUSPHONE = json['CUS_PHONE'];
    cUSADDRESS = json['CUS_ADDRESS'];
    lEADSTATUS = json['LEAD_STATUS'];
    fIELDPROCESS = json['FIELD_PROCESS'];
    oFFICEPROCESS = json['OFFICE_PROCESS'];
    fACTORYPROCESS = json['FACTORY_PROCESS'];
    rEFERTO = json['REFER_TO'];
    cUSLASTCOMMENT = json['CUS_LAST_COMMENT'];
    wPSID = json['WPS_ID'];
    wPSTT = json['WPS_TT'];
    wPSCUSID = json['WPS_CUS_ID'];
    wPSFIELDPROCESS = json['WPS_FIELD_PROCESS'];
    wPSOFFICEPROCESS = json['WPS_OFFICE_PROCESS'];
    wPSFACTORYPROCESS = json['WPS_FACTORY_PROCESS'];
    wPSLOGINID = json['WPS_LOGIN_ID'];
    wPSLASTCOMMENT = json['WPS_LAST_COMMENT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CUS_ID'] = this.cUSID;
    data['CUS_TT'] = this.cUSTT;
    data['CUS_NAME'] = this.cUSNAME;
    data['CUS_PHONE'] = this.cUSPHONE;
    data['CUS_ADDRESS'] = this.cUSADDRESS;
    data['LEAD_STATUS'] = this.lEADSTATUS;
    data['FIELD_PROCESS'] = this.fIELDPROCESS;
    data['OFFICE_PROCESS'] = this.oFFICEPROCESS;
    data['FACTORY_PROCESS'] = this.fACTORYPROCESS;
    data['REFER_TO'] = this.rEFERTO;
    data['CUS_LAST_COMMENT'] = this.cUSLASTCOMMENT;
    data['WPS_ID'] = this.wPSID;
    data['WPS_TT'] = this.wPSTT;
    data['WPS_CUS_ID'] = this.wPSCUSID;
    data['WPS_FIELD_PROCESS'] = this.wPSFIELDPROCESS;
    data['WPS_OFFICE_PROCESS'] = this.wPSOFFICEPROCESS;
    data['WPS_FACTORY_PROCESS'] = this.wPSFACTORYPROCESS;
    data['WPS_LOGIN_ID'] = this.wPSLOGINID;
    data['WPS_LAST_COMMENT'] = this.wPSLASTCOMMENT;
    return data;
  }
}