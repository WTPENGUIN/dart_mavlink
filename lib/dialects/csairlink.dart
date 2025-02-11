import 'dart:typed_data';
import 'package:dart_mavlink/mavlink_dialect.dart';
import 'package:dart_mavlink/mavlink_message.dart';
import 'package:dart_mavlink/types.dart';

///
/// AIRLINK_AUTH_RESPONSE_TYPE
typedef AirlinkAuthResponseType = int;

/// Login or password error
///
/// AIRLINK_ERROR_LOGIN_OR_PASS
const AirlinkAuthResponseType airlinkErrorLoginOrPass = 0;

/// Auth successful
///
/// AIRLINK_AUTH_OK
const AirlinkAuthResponseType airlinkAuthOk = 1;

///
/// AIRLINK_EYE_GS_HOLE_PUSH_RESP_TYPE
typedef AirlinkEyeGsHolePushRespType = int;

///
/// AIRLINK_HPR_PARTNER_NOT_READY
const AirlinkEyeGsHolePushRespType airlinkHprPartnerNotReady = 0;

///
/// AIRLINK_HPR_PARTNER_READY
const AirlinkEyeGsHolePushRespType airlinkHprPartnerReady = 1;

///
/// AIRLINK_EYE_IP_VERSION
typedef AirlinkEyeIpVersion = int;

///
/// AIRLINK_IP_V4
const AirlinkEyeIpVersion airlinkIpV4 = 0;

///
/// AIRLINK_IP_V6
const AirlinkEyeIpVersion airlinkIpV6 = 1;

///
/// AIRLINK_EYE_HOLE_PUSH_TYPE
typedef AirlinkEyeHolePushType = int;

///
/// AIRLINK_HP_NOT_PENETRATED
const AirlinkEyeHolePushType airlinkHpNotPenetrated = 0;

///
/// AIRLINK_HP_BROKEN
const AirlinkEyeHolePushType airlinkHpBroken = 1;

///
/// AIRLINK_EYE_TURN_INIT_TYPE
typedef AirlinkEyeTurnInitType = int;

///
/// AIRLINK_TURN_INIT_START
const AirlinkEyeTurnInitType airlinkTurnInitStart = 0;

///
/// AIRLINK_TURN_INIT_OK
const AirlinkEyeTurnInitType airlinkTurnInitOk = 1;

///
/// AIRLINK_TURN_INIT_BAD
const AirlinkEyeTurnInitType airlinkTurnInitBad = 2;

/// Authorization package
///
/// AIRLINK_AUTH
class AirlinkAuth implements MavlinkMessage {
  static const int msgId = 52000;

  static const int crcExtra = 13;

  static const int mavlinkEncodedLength = 100;

  @override
  int get mavlinkMessageId => msgId;

  @override
  int get mavlinkCrcExtra => crcExtra;

  /// Login
  ///
  /// MAVLink type: char[50]
  ///
  /// login
  final List<char> login;

  /// Password
  ///
  /// MAVLink type: char[50]
  ///
  /// password
  final List<char> password;

  AirlinkAuth({
    required this.login,
    required this.password,
  });

  AirlinkAuth copyWith({
    List<char>? login,
    List<char>? password,
  }) {
    return AirlinkAuth(
      login: login ?? this.login,
      password: password ?? this.password,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'msgId': msgId,
        'login': login,
        'password': password,
      };

  factory AirlinkAuth.parse(ByteData data_) {
    if (data_.lengthInBytes < AirlinkAuth.mavlinkEncodedLength) {
      var len = AirlinkAuth.mavlinkEncodedLength - data_.lengthInBytes;
      var d = data_.buffer.asUint8List().sublist(0, data_.lengthInBytes) +
          List<int>.filled(len, 0);
      data_ = Uint8List.fromList(d).buffer.asByteData();
    }
    var login = MavlinkMessage.asInt8List(data_, 0, 50);
    var password = MavlinkMessage.asInt8List(data_, 50, 50);

    return AirlinkAuth(login: login, password: password);
  }

  @override
  ByteData serialize() {
    var data_ = ByteData(mavlinkEncodedLength);
    MavlinkMessage.setInt8List(data_, 0, login);
    MavlinkMessage.setInt8List(data_, 50, password);
    return data_;
  }
}

/// Response to the authorization request
///
/// AIRLINK_AUTH_RESPONSE
class AirlinkAuthResponse implements MavlinkMessage {
  static const int msgId = 52001;

  static const int crcExtra = 239;

  static const int mavlinkEncodedLength = 1;

  @override
  int get mavlinkMessageId => msgId;

  @override
  int get mavlinkCrcExtra => crcExtra;

  /// Response type
  ///
  /// MAVLink type: uint8_t
  ///
  /// enum: [AirlinkAuthResponseType]
  ///
  /// resp_type
  final AirlinkAuthResponseType respType;

  AirlinkAuthResponse({
    required this.respType,
  });

  AirlinkAuthResponse copyWith({
    AirlinkAuthResponseType? respType,
  }) {
    return AirlinkAuthResponse(
      respType: respType ?? this.respType,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'msgId': msgId,
        'respType': respType,
      };

  factory AirlinkAuthResponse.parse(ByteData data_) {
    if (data_.lengthInBytes < AirlinkAuthResponse.mavlinkEncodedLength) {
      var len = AirlinkAuthResponse.mavlinkEncodedLength - data_.lengthInBytes;
      var d = data_.buffer.asUint8List().sublist(0, data_.lengthInBytes) +
          List<int>.filled(len, 0);
      data_ = Uint8List.fromList(d).buffer.asByteData();
    }
    var respType = data_.getUint8(0);

    return AirlinkAuthResponse(respType: respType);
  }

  @override
  ByteData serialize() {
    var data_ = ByteData(mavlinkEncodedLength);
    data_.setUint8(0, respType);
    return data_;
  }
}

/// Request to hole punching
///
/// AIRLINK_EYE_GS_HOLE_PUSH_REQUEST
class AirlinkEyeGsHolePushRequest implements MavlinkMessage {
  static const int msgId = 52002;

  static const int crcExtra = 24;

  static const int mavlinkEncodedLength = 1;

  @override
  int get mavlinkMessageId => msgId;

  @override
  int get mavlinkCrcExtra => crcExtra;

  /// Hole push response type
  ///
  /// MAVLink type: uint8_t
  ///
  /// enum: [AirlinkEyeGsHolePushRespType]
  ///
  /// resp_type
  final AirlinkEyeGsHolePushRespType respType;

  AirlinkEyeGsHolePushRequest({
    required this.respType,
  });

  AirlinkEyeGsHolePushRequest copyWith({
    AirlinkEyeGsHolePushRespType? respType,
  }) {
    return AirlinkEyeGsHolePushRequest(
      respType: respType ?? this.respType,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'msgId': msgId,
        'respType': respType,
      };

  factory AirlinkEyeGsHolePushRequest.parse(ByteData data_) {
    if (data_.lengthInBytes <
        AirlinkEyeGsHolePushRequest.mavlinkEncodedLength) {
      var len = AirlinkEyeGsHolePushRequest.mavlinkEncodedLength -
          data_.lengthInBytes;
      var d = data_.buffer.asUint8List().sublist(0, data_.lengthInBytes) +
          List<int>.filled(len, 0);
      data_ = Uint8List.fromList(d).buffer.asByteData();
    }
    var respType = data_.getUint8(0);

    return AirlinkEyeGsHolePushRequest(respType: respType);
  }

  @override
  ByteData serialize() {
    var data_ = ByteData(mavlinkEncodedLength);
    data_.setUint8(0, respType);
    return data_;
  }
}

/// Response information about the connected device
///
/// AIRLINK_EYE_GS_HOLE_PUSH_RESPONSE
class AirlinkEyeGsHolePushResponse implements MavlinkMessage {
  static const int msgId = 52003;

  static const int crcExtra = 166;

  static const int mavlinkEncodedLength = 26;

  @override
  int get mavlinkMessageId => msgId;

  @override
  int get mavlinkCrcExtra => crcExtra;

  /// port
  ///
  /// MAVLink type: uint32_t
  ///
  /// ip_port
  final uint32_t ipPort;

  /// Hole push response type
  ///
  /// MAVLink type: uint8_t
  ///
  /// enum: [AirlinkEyeGsHolePushRespType]
  ///
  /// resp_type
  final AirlinkEyeGsHolePushRespType respType;

  /// ip version
  ///
  /// MAVLink type: uint8_t
  ///
  /// enum: [AirlinkEyeIpVersion]
  ///
  /// ip_version
  final AirlinkEyeIpVersion ipVersion;

  /// ip 4 address
  ///
  /// MAVLink type: uint8_t[4]
  ///
  /// ip_address_4
  final List<int8_t> ipAddress4;

  /// ip 6 address
  ///
  /// MAVLink type: uint8_t[16]
  ///
  /// ip_address_6
  final List<int8_t> ipAddress6;

  AirlinkEyeGsHolePushResponse({
    required this.ipPort,
    required this.respType,
    required this.ipVersion,
    required this.ipAddress4,
    required this.ipAddress6,
  });

  AirlinkEyeGsHolePushResponse copyWith({
    uint32_t? ipPort,
    AirlinkEyeGsHolePushRespType? respType,
    AirlinkEyeIpVersion? ipVersion,
    List<int8_t>? ipAddress4,
    List<int8_t>? ipAddress6,
  }) {
    return AirlinkEyeGsHolePushResponse(
      ipPort: ipPort ?? this.ipPort,
      respType: respType ?? this.respType,
      ipVersion: ipVersion ?? this.ipVersion,
      ipAddress4: ipAddress4 ?? this.ipAddress4,
      ipAddress6: ipAddress6 ?? this.ipAddress6,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'msgId': msgId,
        'ipPort': ipPort,
        'respType': respType,
        'ipVersion': ipVersion,
        'ipAddress4': ipAddress4,
        'ipAddress6': ipAddress6,
      };

  factory AirlinkEyeGsHolePushResponse.parse(ByteData data_) {
    if (data_.lengthInBytes <
        AirlinkEyeGsHolePushResponse.mavlinkEncodedLength) {
      var len = AirlinkEyeGsHolePushResponse.mavlinkEncodedLength -
          data_.lengthInBytes;
      var d = data_.buffer.asUint8List().sublist(0, data_.lengthInBytes) +
          List<int>.filled(len, 0);
      data_ = Uint8List.fromList(d).buffer.asByteData();
    }
    var ipPort = data_.getUint32(0, Endian.little);
    var respType = data_.getUint8(4);
    var ipVersion = data_.getUint8(5);
    var ipAddress4 = MavlinkMessage.asUint8List(data_, 6, 4);
    var ipAddress6 = MavlinkMessage.asUint8List(data_, 10, 16);

    return AirlinkEyeGsHolePushResponse(
        ipPort: ipPort,
        respType: respType,
        ipVersion: ipVersion,
        ipAddress4: ipAddress4,
        ipAddress6: ipAddress6);
  }

  @override
  ByteData serialize() {
    var data_ = ByteData(mavlinkEncodedLength);
    data_.setUint32(0, ipPort, Endian.little);
    data_.setUint8(4, respType);
    data_.setUint8(5, ipVersion);
    MavlinkMessage.setUint8List(data_, 6, ipAddress4);
    MavlinkMessage.setUint8List(data_, 10, ipAddress6);
    return data_;
  }
}

/// A package with information about the hole punching status. It is used for constant sending to avoid NAT closing timeout.
///
/// AIRLINK_EYE_HP
class AirlinkEyeHp implements MavlinkMessage {
  static const int msgId = 52004;

  static const int crcExtra = 39;

  static const int mavlinkEncodedLength = 1;

  @override
  int get mavlinkMessageId => msgId;

  @override
  int get mavlinkCrcExtra => crcExtra;

  /// Hole push response type
  ///
  /// MAVLink type: uint8_t
  ///
  /// enum: [AirlinkEyeHolePushType]
  ///
  /// resp_type
  final AirlinkEyeHolePushType respType;

  AirlinkEyeHp({
    required this.respType,
  });

  AirlinkEyeHp copyWith({
    AirlinkEyeHolePushType? respType,
  }) {
    return AirlinkEyeHp(
      respType: respType ?? this.respType,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'msgId': msgId,
        'respType': respType,
      };

  factory AirlinkEyeHp.parse(ByteData data_) {
    if (data_.lengthInBytes < AirlinkEyeHp.mavlinkEncodedLength) {
      var len = AirlinkEyeHp.mavlinkEncodedLength - data_.lengthInBytes;
      var d = data_.buffer.asUint8List().sublist(0, data_.lengthInBytes) +
          List<int>.filled(len, 0);
      data_ = Uint8List.fromList(d).buffer.asByteData();
    }
    var respType = data_.getUint8(0);

    return AirlinkEyeHp(respType: respType);
  }

  @override
  ByteData serialize() {
    var data_ = ByteData(mavlinkEncodedLength);
    data_.setUint8(0, respType);
    return data_;
  }
}

/// Initializing the TURN protocol
///
/// AIRLINK_EYE_TURN_INIT
class AirlinkEyeTurnInit implements MavlinkMessage {
  static const int msgId = 52005;

  static const int crcExtra = 145;

  static const int mavlinkEncodedLength = 1;

  @override
  int get mavlinkMessageId => msgId;

  @override
  int get mavlinkCrcExtra => crcExtra;

  /// Turn init type
  ///
  /// MAVLink type: uint8_t
  ///
  /// enum: [AirlinkEyeTurnInitType]
  ///
  /// resp_type
  final AirlinkEyeTurnInitType respType;

  AirlinkEyeTurnInit({
    required this.respType,
  });

  AirlinkEyeTurnInit copyWith({
    AirlinkEyeTurnInitType? respType,
  }) {
    return AirlinkEyeTurnInit(
      respType: respType ?? this.respType,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'msgId': msgId,
        'respType': respType,
      };

  factory AirlinkEyeTurnInit.parse(ByteData data_) {
    if (data_.lengthInBytes < AirlinkEyeTurnInit.mavlinkEncodedLength) {
      var len = AirlinkEyeTurnInit.mavlinkEncodedLength - data_.lengthInBytes;
      var d = data_.buffer.asUint8List().sublist(0, data_.lengthInBytes) +
          List<int>.filled(len, 0);
      data_ = Uint8List.fromList(d).buffer.asByteData();
    }
    var respType = data_.getUint8(0);

    return AirlinkEyeTurnInit(respType: respType);
  }

  @override
  ByteData serialize() {
    var data_ = ByteData(mavlinkEncodedLength);
    data_.setUint8(0, respType);
    return data_;
  }
}

class MavlinkDialectCsairlink implements MavlinkDialect {
  static const int mavlinkVersion = 3;

  @override
  int get version => mavlinkVersion;

  @override
  MavlinkMessage? parse(int messageID, ByteData data) {
    switch (messageID) {
      case 52000:
        return AirlinkAuth.parse(data);
      case 52001:
        return AirlinkAuthResponse.parse(data);
      case 52002:
        return AirlinkEyeGsHolePushRequest.parse(data);
      case 52003:
        return AirlinkEyeGsHolePushResponse.parse(data);
      case 52004:
        return AirlinkEyeHp.parse(data);
      case 52005:
        return AirlinkEyeTurnInit.parse(data);
      default:
        return null;
    }
  }

  @override
  int crcExtra(int messageID) {
    switch (messageID) {
      case 52000:
        return AirlinkAuth.crcExtra;
      case 52001:
        return AirlinkAuthResponse.crcExtra;
      case 52002:
        return AirlinkEyeGsHolePushRequest.crcExtra;
      case 52003:
        return AirlinkEyeGsHolePushResponse.crcExtra;
      case 52004:
        return AirlinkEyeHp.crcExtra;
      case 52005:
        return AirlinkEyeTurnInit.crcExtra;
      default:
        return -1;
    }
  }
}
