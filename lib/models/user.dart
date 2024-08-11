class User {
  int? id;
  DateTime? lastLogin;
  bool? isSuperuser;
  String? username;
  DateTime? dateJoined;
  String? email;
  bool? isActive;
  bool? isStaff;
  String? firstName;
  String? lastName;
  String? createdDate;
  String? updatedDate;
  String? accountNumber;
  String? phoneNumber;
  dynamic photo;
  bool? isAdmin;
  bool? isUser;
  List<dynamic>? groups;
  List<dynamic>? userPermissions;

  User({
    this.id,
    this.lastLogin,
    this.isSuperuser,
    this.username,
    this.dateJoined,
    this.email,
    this.isActive,
    this.isStaff,
    this.firstName,
    this.lastName,
    this.createdDate,
    this.updatedDate,
    this.accountNumber,
    this.phoneNumber,
    this.photo,
    this.isAdmin,
    this.isUser,
    this.groups,
    this.userPermissions,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        lastLogin: json['last_login'] == null
            ? null
            : DateTime.parse(json['last_login'] as String),
        isSuperuser: json['is_superuser'] as bool?,
        username: json['username'] as String?,
        dateJoined: json['date_joined'] == null
            ? null
            : DateTime.parse(json['date_joined'] as String),
        email: json['email'] as String?,
        isActive: json['is_active'] as bool?,
        isStaff: json['is_staff'] as bool?,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        createdDate: json['created_date'] as String?,
        updatedDate: json['updated_date'] as String?,
        accountNumber: json['account_number'] as String?,
        phoneNumber: json['phone_number'] as String?,
        photo: json['photo'] as dynamic,
        isAdmin: json['is_admin'] as bool?,
        isUser: json['is_user'] as bool?,
        groups: json['groups'] as List<dynamic>?,
        userPermissions: json['user_permissions'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'last_login': lastLogin?.toIso8601String(),
        'is_superuser': isSuperuser,
        'username': username,
        'date_joined': dateJoined?.toIso8601String(),
        'email': email,
        'is_active': isActive,
        'is_staff': isStaff,
        'first_name': firstName,
        'last_name': lastName,
        'created_date': createdDate,
        'updated_date': updatedDate,
        'account_number': accountNumber,
        'phone_number': phoneNumber,
        'photo': photo,
        'is_admin': isAdmin,
        'is_user': isUser,
        'groups': groups,
        'user_permissions': userPermissions,
      };
}
