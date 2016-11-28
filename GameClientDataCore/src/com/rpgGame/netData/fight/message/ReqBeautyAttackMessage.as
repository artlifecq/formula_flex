package com.rpgGame.netData.fight.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 美人请求攻击
	 */
	public class ReqBeautyAttackMessage extends Message {
	
		//目标类型(0怪物 1玩家)
		private var _targetType: int;
		
		//攻击目标
		private var _fightTarget: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//目标类型(0怪物 1玩家)
			writeByte(_targetType);
			//攻击目标
			writeLong(_fightTarget);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//目标类型(0怪物 1玩家)
			_targetType = readByte();
			//攻击目标
			_fightTarget = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 102208;
		}
		
		/**
		 * get 目标类型(0怪物 1玩家)
		 * @return 
		 */
		public function get targetType(): int{
			return _targetType;
		}
		
		/**
		 * set 目标类型(0怪物 1玩家)
		 */
		public function set targetType(value: int): void{
			this._targetType = value;
		}
		
		/**
		 * get 攻击目标
		 * @return 
		 */
		public function get fightTarget(): long{
			return _fightTarget;
		}
		
		/**
		 * set 攻击目标
		 */
		public function set fightTarget(value: long): void{
			this._fightTarget = value;
		}
		
	}
}