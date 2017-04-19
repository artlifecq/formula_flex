package com.rpgGame.netData.fightsoul.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 战魂幻化结果
	 */
	public class SCFightSoulChangeModelResultMessage extends Message {
	
		//幻化后的模型对应等级
		private var _changeModelLv: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//幻化后的模型对应等级
			writeShort(_changeModelLv);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//幻化后的模型对应等级
			_changeModelLv = readShort();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 223005;
		}
		
		/**
		 * get 幻化后的模型对应等级
		 * @return 
		 */
		public function get changeModelLv(): int{
			return _changeModelLv;
		}
		
		/**
		 * set 幻化后的模型对应等级
		 */
		public function set changeModelLv(value: int): void{
			this._changeModelLv = value;
		}
		
	}
}