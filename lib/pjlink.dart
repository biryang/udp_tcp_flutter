const PJLINK_OK = 0;
const PJLINK_BAD_DEVICE = 20;
const PJLINK_NO_CONNECTION = 21;
const PJLINK_AUTH_ERROR = 22;
const PJLINK_SEND_ERROR = 23;

const PJLINK_DEFAULT_PORT = 4352;
const PJLINK_DEFAULT_TIMEOUT = 5;
const PJLINK_PREFIX = '';

class Pjlink {
  Pjlink({class_level = '1'});

  dynamic class_level = '1';
  dynamic host = '';
  dynamic password = '';
  dynamic timeout = PJLINK_DEFAULT_TIMEOUT;
  dynamic port = PJLINK_DEFAULT_PORT;
  dynamic socket = null;
  dynamic error = '';
  dynamic error_number = '';
  dynamic prefix_hash = '';
  dynamic response_raw = '';
  dynamic response_text = '';

  dynamic getClassLevel() {
    return class_level;
  }

  dynamic setClassLevel({class_level = '1'}) {
    class_level = class_level;
  }

  dynamic getError() {
    return error;
  }

  dynamic getErrorNumber() {
    return error_number;
  }

  dynamic getResponseRaw() {
    return response_raw;
  }

  dynamic getResponseText() {
    return response_text;
  }

  dynamic setDevice(
      {host,
      password = '',
      timeout = PJLINK_DEFAULT_TIMEOUT,
      port = PJLINK_DEFAULT_PORT}) {
    error = '';
    error_number = PJLINK_OK;

    host = host;
    password = password;
    timeout = timeout;
    port = port;

    if (host == '') {
      error = 'Host not defined';
      error_number = PJLINK_BAD_DEVICE;
      return false;
    }
    return true;
  }

  dynamic open({host = '', password = '', timeout = 0, port = 0}) {
    error = '';
    error_number = PJLINK_OK;

    if (host != '') {
      host = host;
    }

    if (password != '') {
      password = password;
    }

    if (timeout != 0) {
      timeout = int.parse(timeout, radix: 16);
    }

    if (int.parse(port, radix: 16) > 0) {
      port = int.parse(port, radix: 16);
    }

    if (host == '') {
      error = 'Host not defined';
      error_number = PJLINK_BAD_DEVICE;
      return false;
    }
    //
    // dynamic errno = 0;
    // dynamic errstr = '';
    //
    // socket = @fsockopen(host, port, errno, errstr, timeout);
    //
    // if (!socket) {
    // error = 'Connection failed: ' . socket_strerror(errno);
    // error_number = PJLINK_NO_CONNECTION;
    // return false;
    // }
    //
    // stream_set_timeout(socket, timeout, 0);
    //
    // response = strtoupper(getResponse());
    //
    // if (FALSE !== strpos(response, 'PJLINK 0')) {
    // prefix_hash = '';
    // return true;
    // } elseif (FALSE !== strpos(response, 'PJLINK 1')) {
    // auth_random = trim(substr(response, strpos(response, 'PJLINK 1') + 9));
    // prefix_hash = md5(auth_random . password);
    // return true;
    // } else {
    // error = 'Bad answer, connection failed';
    // error_number = PJLINK_NO_CONNECTION;
    // return false;
    // }
  }
}
