package com.rpgGame.netData.mibao.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 积分数量变化
	 */
	public class SCJiFenChangeMessage extends Message {
	
		//累计积分
		private var _jifenNum: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//累计积分
			writeInt(_jifenNum);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//累计积分
			_jifenNum = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 131104;
		}
		
		/**
		 * get 累计积分
		 * @return 
		 */
		public function get jifenNum(): int{
			return _jifenNum;
		}
		
		/**
		 * set 累计积分
		 */
		public function set jifenNum(value: int): void{
			this._jifenNum = value;
		}
		
	}
}