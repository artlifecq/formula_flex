package com.rpgGame.netData.guild.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 分配奖励
	 */
	public class ReqGotGuildBossAwardMessage extends Message {
	
		//地图Id
		private var _mapModelId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//地图Id
			writeInt(_mapModelId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//地图Id
			_mapModelId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111601;
		}
		
		/**
		 * get 地图Id
		 * @return 
		 */
		public function get mapModelId(): int{
			return _mapModelId;
		}
		
		/**
		 * set 地图Id
		 */
		public function set mapModelId(value: int): void{
			this._mapModelId = value;
		}
		
	}
}