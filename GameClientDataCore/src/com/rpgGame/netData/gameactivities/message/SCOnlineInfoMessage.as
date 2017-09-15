package com.rpgGame.netData.gameactivities.message{
	import com.rpgGame.netData.gameactivities.bean.onlineInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送在线信息
	 */
	public class SCOnlineInfoMessage extends Message {
	
		//玩家在线信息
		private var _info: Vector.<onlineInfo> = new Vector.<onlineInfo>();
		//玩家实际在线时间（秒）
		private var _onlineTime: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//玩家在线信息
			writeShort(_info.length);
			for (i = 0; i < _info.length; i++) {
				writeBean(_info[i]);
			}
			//玩家实际在线时间（秒）
			writeInt(_onlineTime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//玩家在线信息
			var info_length : int = readShort();
			for (i = 0; i < info_length; i++) {
				_info[i] = readBean(onlineInfo) as onlineInfo;
			}
			//玩家实际在线时间（秒）
			_onlineTime = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 411101;
		}
		
		/**
		 * get 玩家在线信息
		 * @return 
		 */
		public function get info(): Vector.<onlineInfo>{
			return _info;
		}
		
		/**
		 * set 玩家在线信息
		 */
		public function set info(value: Vector.<onlineInfo>): void{
			this._info = value;
		}
		
		/**
		 * get 玩家实际在线时间（秒）
		 * @return 
		 */
		public function get onlineTime(): int{
			return _onlineTime;
		}
		
		/**
		 * set 玩家实际在线时间（秒）
		 */
		public function set onlineTime(value: int): void{
			this._onlineTime = value;
		}
		
	}
}