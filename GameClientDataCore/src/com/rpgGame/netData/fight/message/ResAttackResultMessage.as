package com.rpgGame.netData.fight.message{
	import com.rpgGame.netData.fight.bean.AttackResultInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 攻击结果
	 */
	public class ResAttackResultMessage extends Message {
	
		//攻击结果
		private var _state: AttackResultInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//攻击结果
			writeBean(_state);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//攻击结果
			_state = readBean(AttackResultInfo) as AttackResultInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 102102;
		}
		
		/**
		 * get 攻击结果
		 * @return 
		 */
		public function get state(): AttackResultInfo{
			return _state;
		}
		
		/**
		 * set 攻击结果
		 */
		public function set state(value: AttackResultInfo): void{
			this._state = value;
		}
		
	}
}