package com.rpgGame.netData.monster.message{
	import com.rpgGame.netData.monster.bean.BossDamageInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送玩家对BOSS伤害排行列表
	 */
	public class ResBossDamageInfosToClientMessage extends Message {
	
		//玩家对BOSS伤害列表
		private var _BossDamageInfos: Vector.<BossDamageInfo> = new Vector.<BossDamageInfo>();
		//boss的id
		private var _monsterModelId: int;
		
		//总伤害
		private var _totalDamage: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//玩家对BOSS伤害列表
			writeShort(_BossDamageInfos.length);
			for (i = 0; i < _BossDamageInfos.length; i++) {
				writeBean(_BossDamageInfos[i]);
			}
			//boss的id
			writeInt(_monsterModelId);
			//总伤害
			writeInt(_totalDamage);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//玩家对BOSS伤害列表
			var BossDamageInfos_length : int = readShort();
			for (i = 0; i < BossDamageInfos_length; i++) {
				_BossDamageInfos[i] = readBean(BossDamageInfo) as BossDamageInfo;
			}
			//boss的id
			_monsterModelId = readInt();
			//总伤害
			_totalDamage = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 114115;
		}
		
		/**
		 * get 玩家对BOSS伤害列表
		 * @return 
		 */
		public function get BossDamageInfos(): Vector.<BossDamageInfo>{
			return _BossDamageInfos;
		}
		
		/**
		 * set 玩家对BOSS伤害列表
		 */
		public function set BossDamageInfos(value: Vector.<BossDamageInfo>): void{
			this._BossDamageInfos = value;
		}
		
		/**
		 * get boss的id
		 * @return 
		 */
		public function get monsterModelId(): int{
			return _monsterModelId;
		}
		
		/**
		 * set boss的id
		 */
		public function set monsterModelId(value: int): void{
			this._monsterModelId = value;
		}
		
		/**
		 * get 总伤害
		 * @return 
		 */
		public function get totalDamage(): int{
			return _totalDamage;
		}
		
		/**
		 * set 总伤害
		 */
		public function set totalDamage(value: int): void{
			this._totalDamage = value;
		}
		
	}
}