class Account {
  int? id;
  String? accountNumber;
  String? settlementId;
  String? sessionId;
  String? tranRemarks;
  String? transactionAmount;
  String? settledAmount;
  String? feeAmount;
  String? vatAmount;
  String? currency;
  String? initiationTranRef;
  String? sourceAccountNumber;
  String? sourceAccountName;
  String? sourceBankName;
  String? channelId;
  String? tranDateTime;

  Account({
    this.id,
    this.accountNumber,
    this.settlementId,
    this.sessionId,
    this.tranRemarks,
    this.transactionAmount,
    this.settledAmount,
    this.feeAmount,
    this.vatAmount,
    this.currency,
    this.initiationTranRef,
    this.sourceAccountNumber,
    this.sourceAccountName,
    this.sourceBankName,
    this.channelId,
    this.tranDateTime,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json['id'] as int?,
        accountNumber: json['accountNumber'] as String?,
        settlementId: json['settlementId'] as String?,
        sessionId: json['sessionId'] as String?,
        tranRemarks: json['tranRemarks'] as String?,
        transactionAmount: json['transactionAmount'] as String?,
        settledAmount: json['settledAmount'] as String?,
        feeAmount: json['feeAmount'] as String?,
        vatAmount: json['vatAmount'] as String?,
        currency: json['currency'] as String?,
        initiationTranRef: json['initiationTranRef'] as String?,
        sourceAccountNumber: json['sourceAccountNumber'] as String?,
        sourceAccountName: json['sourceAccountName'] as String?,
        sourceBankName: json['sourceBankName'] as String?,
        channelId: json['channelId'] as String?,
        tranDateTime: json['tranDateTime'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'accountNumber': accountNumber,
        'settlementId': settlementId,
        'sessionId': sessionId,
        'tranRemarks': tranRemarks,
        'transactionAmount': transactionAmount,
        'settledAmount': settledAmount,
        'feeAmount': feeAmount,
        'vatAmount': vatAmount,
        'currency': currency,
        'initiationTranRef': initiationTranRef,
        'sourceAccountNumber': sourceAccountNumber,
        'sourceAccountName': sourceAccountName,
        'sourceBankName': sourceBankName,
        'channelId': channelId,
        'tranDateTime': tranDateTime,
      };
}
