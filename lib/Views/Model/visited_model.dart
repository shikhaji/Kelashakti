class VisitedModel {
  int? status;
  List<VisitedData>? message;

  VisitedModel({this.status, this.message});

  VisitedModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['message'] != null) {
      message = <VisitedData>[];
      json['message'].forEach((v) {
        message!.add(new VisitedData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.message != null) {
      data['message'] = this.message!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VisitedData {
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

  VisitedData(
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
        this.cUSDATE});

  VisitedData.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}