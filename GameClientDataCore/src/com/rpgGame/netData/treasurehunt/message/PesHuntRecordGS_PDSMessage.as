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
	 * 游戏服发送全平台记录到公共服
	 */
	public class PesHuntRecordGS_PDSMessage extends Message {
	
		//新增寻宝记录
		private var _info: TreasureHuntInfo;
		
		//玩家ID
		private var _playerId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//新增寻宝记录
			writeBean(_info);
			//玩家ID
			writeLong(_playerId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//新增寻宝记录
			_info = readBean(TreasureHuntInfo) as TreasureHuntInfo;
			//玩家ID
			_playerId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 160206;
		}
		
		/**
		 * get 新增寻宝记录
		 * @return 
		 */
		public function get info(): TreasureHuntInfo{
			return _info;
		}
		
		/**
		 * set 新增寻宝记录
		 */
		public function set info(value: TreasureHuntInfo): void{
			this._info = value;
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