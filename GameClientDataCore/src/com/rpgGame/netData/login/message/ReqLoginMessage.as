package com.rpgGame.netData.login.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 内部登陆
	 */
	public class ReqLoginMessage extends Message {
	
		//平台标识
		private var _agent: String;
		
		//服务器Id
		private var _serverId: int;
		
		//玩家用户名
		private var _name: String;
		
		//玩家密码
		private var _password: String;
		
		//窗口高像素
		private var _win_high: int;
		
		//窗口宽像素
		private var _win_width: int;
		
		//重连
		private var _relogin: int;
		
		//37wan手机令牌，vip等级 json 格式
		private var _ptData: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//平台标识
			writeString(_agent);
			//服务器Id
			writeInt(_serverId);
			//玩家用户名
			writeString(_name);
			//玩家密码
			writeString(_password);
			//窗口高像素
			writeInt(_win_high);
			//窗口宽像素
			writeInt(_win_width);
			//重连
			writeByte(_relogin);
			//37wan手机令牌，vip等级 json 格式
			writeString(_ptData);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//平台标识
			_agent = readString();
			//服务器Id
			_serverId = readInt();
			//玩家用户名
			_name = readString();
			//玩家密码
			_password = readString();
			//窗口高像素
			_win_high = readInt();
			//窗口宽像素
			_win_width = readInt();
			//重连
			_relogin = readByte();
			//37wan手机令牌，vip等级 json 格式
			_ptData = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 100201;
		}
		
		/**
		 * get 平台标识
		 * @return 
		 */
		public function get agent(): String{
			return _agent;
		}
		
		/**
		 * set 平台标识
		 */
		public function set agent(value: String): void{
			this._agent = value;
		}
		
		/**
		 * get 服务器Id
		 * @return 
		 */
		public function get serverId(): int{
			return _serverId;
		}
		
		/**
		 * set 服务器Id
		 */
		public function set serverId(value: int): void{
			this._serverId = value;
		}
		
		/**
		 * get 玩家用户名
		 * @return 
		 */
		public function get name(): String{
			return _name;
		}
		
		/**
		 * set 玩家用户名
		 */
		public function set name(value: String): void{
			this._name = value;
		}
		
		/**
		 * get 玩家密码
		 * @return 
		 */
		public function get password(): String{
			return _password;
		}
		
		/**
		 * set 玩家密码
		 */
		public function set password(value: String): void{
			this._password = value;
		}
		
		/**
		 * get 窗口高像素
		 * @return 
		 */
		public function get win_high(): int{
			return _win_high;
		}
		
		/**
		 * set 窗口高像素
		 */
		public function set win_high(value: int): void{
			this._win_high = value;
		}
		
		/**
		 * get 窗口宽像素
		 * @return 
		 */
		public function get win_width(): int{
			return _win_width;
		}
		
		/**
		 * set 窗口宽像素
		 */
		public function set win_width(value: int): void{
			this._win_width = value;
		}
		
		/**
		 * get 重连
		 * @return 
		 */
		public function get relogin(): int{
			return _relogin;
		}
		
		/**
		 * set 重连
		 */
		public function set relogin(value: int): void{
			this._relogin = value;
		}
		
		/**
		 * get 37wan手机令牌，vip等级 json 格式
		 * @return 
		 */
		public function get ptData(): String{
			return _ptData;
		}
		
		/**
		 * set 37wan手机令牌，vip等级 json 格式
		 */
		public function set ptData(value: String): void{
			this._ptData = value;
		}
		
	}
}