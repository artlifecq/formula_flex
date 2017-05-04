package com.rpgGame.netData.horse.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送当前坐骑ID给地图周围的玩家(改变外观)
	 */
	public class SCHorseIllusionToClientMessage extends Message {
	
		//玩家ID
		private var _playerId: long;
		
		//坐骑ID
		private var _horseModelid: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家ID
			writeLong(_playerId);
			//坐骑ID
			writeShort(_horseModelid);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家ID
			_playerId = readLong();
			//坐骑ID
			_horseModelid = readShort();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 144103;
		}
		
		/**
		 * get 玩家ID
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 玩家ID
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
		/**
		 * get 坐骑ID
		 * @return 
		 */
		public function get horseModelid(): int{
			return _horseModelid;
		}
		
		/**
		 * set 坐骑ID
		 */
		public function set horseModelid(value: int): void{
			this._horseModelid = value;
		}
		
	}
}