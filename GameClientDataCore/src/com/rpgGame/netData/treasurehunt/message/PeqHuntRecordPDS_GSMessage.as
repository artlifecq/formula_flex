package com.rpgGame.netData.treasurehunt.message{
	import com.rpgGame.netData.treasurehunt.bean.TreasureHuntInfo;
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 公共服同步全平台记录到所有游戏服
	 */
	public class PeqHuntRecordPDS_GSMessage extends Message {
	
		//新增寻宝记录
		private var _infos: Vector.<TreasureHuntInfo> = new Vector.<TreasureHuntInfo>();
		//玩家ID
		private var _playerId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//新增寻宝记录
			writeShort(_infos.length);
			for (i = 0; i < _infos.length; i++) {
				writeBean(_infos[i]);
			}
			//玩家ID
			writeLong(_playerId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//新增寻宝记录
			var infos_length : int = readShort();
			for (i = 0; i < infos_length; i++) {
				_infos[i] = readBean(TreasureHuntInfo) as TreasureHuntInfo;
			}
			//玩家ID
			_playerId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 160207;
		}
		
		/**
		 * get 新增寻宝记录
		 * @return 
		 */
		public function get infos(): Vector.<TreasureHuntInfo>{
			return _infos;
		}
		
		/**
		 * set 新增寻宝记录
		 */
		public function set infos(value: Vector.<TreasureHuntInfo>): void{
			this._infos = value;
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
		
	}
}