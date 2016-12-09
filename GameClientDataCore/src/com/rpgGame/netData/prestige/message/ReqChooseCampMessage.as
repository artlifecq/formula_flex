package com.rpgGame.netData.prestige.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 选择阵营
	 */
	public class ReqChooseCampMessage extends Message {
	
		//声望阵营 0未选择，1东厂，2西厂
		private var _campType: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//声望阵营 0未选择，1东厂，2西厂
			writeByte(_campType);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//声望阵营 0未选择，1东厂，2西厂
			_campType = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 212201;
		}
		
		/**
		 * get 声望阵营 0未选择，1东厂，2西厂
		 * @return 
		 */
		public function get campType(): int{
			return _campType;
		}
		
		/**
		 * set 声望阵营 0未选择，1东厂，2西厂
		 */
		public function set campType(value: int): void{
			this._campType = value;
		}
		
	}
}