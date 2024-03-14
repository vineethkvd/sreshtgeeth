// To parse this JSON data, do
//
//     final stateModel = stateModelFromJson(jsonString);

import 'dart:convert';

StateModel stateModelFromJson(String str) => StateModel.fromJson(json.decode(str));

String stateModelToJson(StateModel data) => json.encode(data.toJson());

class StateModel {
    String status;
    List<StateList> stateList;

    StateModel({
        required this.status,
        required this.stateList,
    });

    factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        status: json["status"],
        stateList: List<StateList>.from(json["State List"].map((x) => StateList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "State List": List<dynamic>.from(stateList.map((x) => x.toJson())),
    };
}

class StateList {
    int stateId;
    String stateName;

    StateList({
        required this.stateId,
        required this.stateName,
    });

    factory StateList.fromJson(Map<String, dynamic> json) => StateList(
        stateId: json["state_id"],
        stateName: json["state_name"],
    );

    Map<String, dynamic> toJson() => {
        "state_id": stateId,
        "state_name": stateName,
    };
}
