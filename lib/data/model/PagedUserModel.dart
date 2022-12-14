class PagedUserModel {
  Data? data;

  PagedUserModel({this.data});

  PagedUserModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Users? users;

  Data({this.users});

  Data.fromJson(Map<String, dynamic> json) {
    users = json['users'] != null ? new Users.fromJson(json['users']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.users != null) {
      data['users'] = this.users!.toJson();
    }
    return data;
  }
}

class Users {
  int? totalCount;
  PageInfo? pageInfo;
  List<Nodes>? nodes;

  Users({this.totalCount, this.pageInfo, this.nodes});

  Users.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    pageInfo = json['pageInfo'] != null
        ? new PageInfo.fromJson(json['pageInfo'])
        : null;
    if (json['nodes'] != null) {
      nodes = <Nodes>[];
      json['nodes'].forEach((v) {
        nodes!.add(new Nodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    if (this.pageInfo != null) {
      data['pageInfo'] = this.pageInfo!.toJson();
    }
    if (this.nodes != null) {
      data['nodes'] = this.nodes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PageInfo {
  String? endCursor;
  bool? hasNextPage;
  bool? hasPreviousPage;
  String? startCursor;

  PageInfo(
      {this.endCursor,
        this.hasNextPage,
        this.hasPreviousPage,
        this.startCursor});

  PageInfo.fromJson(Map<String, dynamic> json) {
    endCursor = json['endCursor'];
    hasNextPage = json['hasNextPage'];
    hasPreviousPage = json['hasPreviousPage'];
    startCursor = json['startCursor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['endCursor'] = this.endCursor;
    data['hasNextPage'] = this.hasNextPage;
    data['hasPreviousPage'] = this.hasPreviousPage;
    data['startCursor'] = this.startCursor;
    return data;
  }
}

class Nodes {
  String? email;
  int? id;
  String? name;
  String? gender;
  String? status;

  Nodes({this.email, this.id, this.name, this.gender, this.status});

  Nodes.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['id'] = this.id;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['status'] = this.status;
    return data;
  }
}
