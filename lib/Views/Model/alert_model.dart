class AlertModel {
  int? status;
  String? message;
  List<GetAllAlertData>? alert;

  AlertModel({this.status, this.message, this.alert});

  AlertModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['alert'] != null) {
      alert = <GetAllAlertData>[];
      json['alert'].forEach((v) {
        alert!.add(new GetAllAlertData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.alert != null) {
      data['alert'] = this.alert!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetAllAlertData{
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
  String? cUSDATE;
  String? tTCUS;

  GetAllAlertData(
      {this.cUSID,
        this.cUSTT,
        this.cUSNAME,
        this.cUSPHONE,
        this.cUSADDRESS,
        this.lEADSTATUS,
        this.fIELDPROCESS,
        this.oFFICEPROCESS,
        this.fACTORYPROCESS,
        this.rEFERTO,
        this.cUSLASTCOMMENT,
        this.cUSDATE,
        this.tTCUS});

  GetAllAlertData.fromJson(Map<String, dynamic> json) {
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
    cUSDATE = json['CUS_DATE'];
    tTCUS = json['TT_CUS'];
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
    data['CUS_DATE'] = this.cUSDATE;
    data['TT_CUS'] = this.tTCUS;
    return data;
  }
}