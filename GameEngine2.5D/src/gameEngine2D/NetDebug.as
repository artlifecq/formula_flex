package gameEngine2D {
    import flash.net.Socket;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import flash.events.ProgressEvent;
    import flash.utils.ByteArray;
    import flash.utils.Endian;
    import flash.errors.IOError;
    /**************************************************************************
     * 网络日志输出
     *************************************************************************/
    public class NetDebug {
        private static var _instance : NetDebug = null;

        public static function init(ip : String, port : int) : void {
            if (null == _instance) {
                _instance = new NetDebug();
            }
            _instance.init(ip, port);
        }

        public static function LOG(...args) : void {
            if (null == _instance) {
                return;
            }
            var msg : String = args.join("");
            var buffer : ByteArray = new ByteArray();
            buffer.endian = Endian.LITTLE_ENDIAN;
            buffer.writeInt(0);
            buffer.writeUTFBytes(msg);
            var len : int = buffer.length - 4;
            buffer.position = 0;
            buffer.writeInt(len);
            _instance.send(buffer);
        }

        private static const STATE_NONE         : int = 0;          // 无效
        private static const STATE_INIT         : int = 1;          // 初始化
        private static const STATE_CONNECTING   : int = 2;          // 连接中
        private static const STATE_CONNECTED    : int = 3;          // 连接成功
        private static const STATE_CLOSE        : int = 4;          // 连接关闭

        private var _ip : String = null;
        private var _port : int = -1;

        private var _socket : Socket = null;

        private var _state : int = STATE_NONE;

        private var _data : ByteArray = null;

        public function NetDebug() {
        }

        public function init(ip : String, port : int) : void {
            if (STATE_NONE != this._state) {
                return;
            }
            this._ip = ip;
            this._port = port;
            this._state = STATE_INIT;

            this._data = new ByteArray();

            this._socket = new Socket();
            this._socket.endian = Endian.LITTLE_ENDIAN;
            this._socket.addEventListener(Event.CONNECT, onConnectHandler);
            this._socket.addEventListener(Event.CLOSE, onCloseHandler);
            this._socket.addEventListener(IOErrorEvent.IO_ERROR, onIOErrorHandler);
            this._socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, 
                                          onSecurityErrorHandler);
            this._socket.addEventListener(ProgressEvent.SOCKET_DATA, 
                                          onReceiveHandler);
            this.connect();
        }

        private function close(reson : String = "") : void {
            if (STATE_CONNECTING == this._state ||
                STATE_CONNECTED == this._state) {
                try {
                    LOG("异常关闭, 原因:", reson);
                    this._socket.close();
                } catch (e : IOError) {
                }
                this._state = STATE_CLOSE;
            }
        }

        private function connect() : void {
            if (STATE_CLOSE != this._state &&
                STATE_INIT != this._state) {
                return;
            }
            this._state = STATE_CONNECTING;
            this._socket.connect(this._ip, this._port);
        }

        private function send(buffer : ByteArray) : void {
            if (STATE_CONNECTED != this._state) {
                return;
            }
            try {
                this._socket.writeBytes(buffer);
                this._socket.flush();
            } catch (e : IOError) {
            }
        }

        private function onConnectHandler(e : Event) : void {
            // 链接成功
            this._state = STATE_CONNECTED;
        }

        private function onCloseHandler(e : Event) : void {
            // 关闭连接
            this.close("服务器自动关闭");
        }

        private function onIOErrorHandler(e : IOErrorEvent) : void {
            // io 错误
            this.close("IO错误");
        }

        private function onSecurityErrorHandler(e : SecurityErrorEvent) : void {
            // 安全错误
            this.close("安全错误");
        }

        private function onReceiveHandler(e : ProgressEvent) : void {
            if (STATE_CONNECTED != this._state) {
                // 已经不在连接状态
                return;
            }
            this._data.position = 0;
            this._socket.readBytes(this._data);
        }
    }
}
