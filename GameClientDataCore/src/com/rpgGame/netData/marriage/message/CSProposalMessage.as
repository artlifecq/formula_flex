package com.rpgGame.netData.marriage.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 求婚
	 */
	public class CSProposalMessage extends Message {
	
		//求婚对象
		private var _targetName: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//求婚对象
			writeString(_targetName);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//求婚对象
			_targetName = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 150101;
		}
		
		/**
		 * get 求婚对象
		 * @return 
		 */
		public function get targetName(): String{
			return _targetName;
		}
		
		/**
		 * set 求婚对象
		 */
		public function set targetName(value: String): void{
			this._targetName = value;
		}
		
	}
}