package com.rpgGame.netData.redreward.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 红包基本数据信息
	 */
	public class RedRewardDataInfo extends Bean {
	
		//发送者id,id为空则表示系统红包
		private var _sendPlayerId: long;
		
		//发送者名字
		private var _sendPlayerName: String;
		
		//发送者职业
		private var _sendPlayerJob: int;
		
		//发送者性别(1男，2女)
		private var _sendPlayerSex: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//发送者id,id为空则表示系统红包
			writeLong(_sendPlayerId);
			//发送者名字
			writeString(_sendPlayerName);
			//发送者职业
			writeByte(_sendPlayerJob);
			//发送者性别(1男，2女)
			writeByte(_sendPlayerSex);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//发送者id,id为空则表示系统红包
			_sendPlayerId = readLong();
			//发送者名字
			_sendPlayerName = readString();
			//发送者职业
			_sendPlayerJob = readByte();
			//发送者性别(1男，2女)
			_sendPlayerSex = readByte();
			return true;
		}
		
		/**
		 * get 发送者id,id为空则表示系统红包
		 * @return 
		 */
		public function get sendPlayerId(): long{
			return _sendPlayerId;
		}
		
		/**
		 * set 发送者id,id为空则表示系统红包
		 */
		public function set sendPlayerId(value: long): void{
			this._sendPlayerId = value;
		}
		
		/**
		 * get 发送者名字
		 * @return 
		 */
		public function get sendPlayerName(): String{
			return _sendPlayerName;
		}
		
		/**
		 * set 发送者名字
		 */
		public function set sendPlayerName(value: String): void{
			this._sendPlayerName = value;
		}
		
		/**
		 * get 发送者职业
		 * @return 
		 */
		public function get sendPlayerJob(): int{
			return _sendPlayerJob;
		}
		
		/**
		 * set 发送者职业
		 */
		public function set sendPlayerJob(value: int): void{
			this._sendPlayerJob = value;
		}
		
		/**
		 * get 发送者性别(1男，2女)
		 * @return 
		 */
		public function get sendPlayerSex(): int{
			return _sendPlayerSex;
		}
		
		/**
		 * set 发送者性别(1男，2女)
		 */
		public function set sendPlayerSex(value: int): void{
			this._sendPlayerSex = value;
		}
		
	}
}