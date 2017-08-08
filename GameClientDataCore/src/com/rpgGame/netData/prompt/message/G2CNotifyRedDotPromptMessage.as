package com.rpgGame.netData.prompt.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 通知红点
	 */
	public class G2CNotifyRedDotPromptMessage extends Message {
	
		//红点类型列表
		private var _typeList: Vector.<int> = new Vector.<int>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//红点类型列表
			writeShort(_typeList.length);
			for (i = 0; i < _typeList.length; i++) {
				writeInt(_typeList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//红点类型列表
			var typeList_length : int = readShort();
			for (i = 0; i < typeList_length; i++) {
				_typeList[i] = readInt();
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 256100;
		}
		
		/**
		 * get 红点类型列表
		 * @return 
		 */
		public function get typeList(): Vector.<int>{
			return _typeList;
		}
		
		/**
		 * set 红点类型列表
		 */
		public function set typeList(value: Vector.<int>): void{
			this._typeList = value;
		}
		
	}
}