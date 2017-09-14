package com.rpgGame.netData.gameactivities.message{
	import com.rpgGame.netData.gameactivities.bean.SevenDayInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送七日豪礼消息
	 */
	public class SCSevenDayGiftinfoMessage extends Message {
	
		//玩家七日豪礼信息
		private var _info: Vector.<SevenDayInfo> = new Vector.<SevenDayInfo>();
		//总共登录的天数
		private var _loginDay: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//玩家七日豪礼信息
			writeShort(_info.length);
			for (i = 0; i < _info.length; i++) {
				writeBean(_info[i]);
			}
			//总共登录的天数
			writeInt(_loginDay);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//玩家七日豪礼信息
			var info_length : int = readShort();
			for (i = 0; i < info_length; i++) {
				_info[i] = readBean(SevenDayInfo) as SevenDayInfo;
			}
			//总共登录的天数
			_loginDay = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 410101;
		}
		
		/**
		 * get 玩家七日豪礼信息
		 * @return 
		 */
		public function get info(): Vector.<SevenDayInfo>{
			return _info;
		}
		
		/**
		 * set 玩家七日豪礼信息
		 */
		public function set info(value: Vector.<SevenDayInfo>): void{
			this._info = value;
		}
		
		/**
		 * get 总共登录的天数
		 * @return 
		 */
		public function get loginDay(): int{
			return _loginDay;
		}
		
		/**
		 * set 总共登录的天数
		 */
		public function set loginDay(value: int): void{
			this._loginDay = value;
		}
		
	}
}