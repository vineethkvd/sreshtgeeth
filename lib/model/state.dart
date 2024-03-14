// To parse this JSON data, do
//
//     final mState = mStateFromJson(jsonString);

import 'dart:convert';

MState mStateFromJson(String str) => MState.fromJson(json.decode(str));

String mStateToJson(MState data) => json.encode(data.toJson());

class MState {
    String status;
    List<StateList> stateList;

    MState({
        required this.status,
        required this.stateList,
    });

    factory MState.fromJson(Map<String, dynamic> json) => MState(
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
