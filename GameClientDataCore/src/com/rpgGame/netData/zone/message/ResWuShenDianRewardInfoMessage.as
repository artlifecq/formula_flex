package com.rpgGame.netData.zone.message{
	import com.rpgGame.netData.zone.bean.WuShenDianRewardInfo;
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 武神殿奖励面板信息
	 */
	public class ResWuShenDianRewardInfoMessage extends Message {
	
		//我的伤害输出
		private var _damage: int;
		
		//boss唯一ID
		private var _bossId: long;
		
		//玩家对BOSS伤害奖励列表
		private var _rewardInfo: Vector.<WuShenDianRewardInfo> = new Vector.<WuShenDianRewardInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//我的伤害输出
			writeInt(_damage);
			//boss唯一ID
			writeLong(_bossId);
			//玩家对BOSS伤害奖励列表
			writeShort(_rewardInfo.length);
			for (i = 0; i < _rewardInfo.length; i++) {
				writeBean(_rewardInfo[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//我的伤害输出
			_damage = readInt();
			//boss唯一ID
			_bossId = readLong();
			//玩家对BOSS伤害奖励列表
			var rewardInfo_length : int = readShort();
			for (i = 0; i < rewardInfo_length; i++) {
				_rewardInfo[i] = readBean(WuShenDianRewardInfo) as WuShenDianRewardInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155133;
		}
		
		/**
		 * get 我的伤害输出
		 * @return 
		 */
		public function get damage(): int{
			return _damage;
		}
		
		/**
		 * set 我的伤害输出
		 */
		public function set damage(value: int): void{
			this._damage = value;
		}
		
		/**
		 * get boss唯一ID
		 * @return 
		 */
		public function get bossId(): long{
			return _bossId;
		}
		
		/**
		 * set boss唯一ID
		 */
		public function set bossId(value: long): void{
			this._bossId = value;
		}
		
		/**
		 * get 玩家对BOSS伤害奖励列表
		 * @return 
		 */
		public function get rewardInfo(): Vector.<WuShenDianRewardInfo>{
			return _rewardInfo;
		}
		
		/**
		 * set 玩家对BOSS伤害奖励列表
		 */
		public function set rewardInfo(value: Vector.<WuShenDianRewardInfo>): void{
			this._rewardInfo = value;
		}
		
	}
}