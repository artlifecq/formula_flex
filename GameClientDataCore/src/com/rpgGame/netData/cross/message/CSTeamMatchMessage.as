package com.rpgGame.netData.cross.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 客户端向服务器发送队伍匹配信息
	 */
	public class CSTeamMatchMessage extends Message {
	
		//匹配副本
		private var _zoneModelId: int;
		
		//0取消匹配，1参与匹配
		private var _matchState: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//匹配副本
			writeInt(_zoneModelId);
			//0取消匹配，1参与匹配
			writeByte(_matchState);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//匹配副本
			_zoneModelId = readInt();
			//0取消匹配，1参与匹配
			_matchState = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 250263;
		}
		
		/**
		 * get 匹配副本
		 * @return 
		 */
		public function get zoneModelId(): int{
			return _zoneModelId;
		}
		
		/**
		 * set 匹配副本
		 */
		public function set zoneModelId(value: int): void{
			this._zoneModelId = value;
		}
		
		/**
		 * get 0取消匹配，1参与匹配
		 * @return 
		 */
		public function get matchState(): int{
			return _matchState;
		}
		
		/**
		 * set 0取消匹配，1参与匹配
		 */
		public function set matchState(value: int): void{
			this._matchState = value;
		}
		
	}
}