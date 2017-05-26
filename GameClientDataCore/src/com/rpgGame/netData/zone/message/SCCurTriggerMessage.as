package com.rpgGame.netData.zone.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 当前触发信息
	 */
	public class SCCurTriggerMessage extends Message {
	
		//当前已经触发ID列表
		private var _curTriggerIds: Vector.<int> = new Vector.<int>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//当前已经触发ID列表
			writeShort(_curTriggerIds.length);
			for (i = 0; i < _curTriggerIds.length; i++) {
				writeInt(_curTriggerIds[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//当前已经触发ID列表
			var curTriggerIds_length : int = readShort();
			for (i = 0; i < curTriggerIds_length; i++) {
				_curTriggerIds[i] = readInt();
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155143;
		}
		
		/**
		 * get 当前已经触发ID列表
		 * @return 
		 */
		public function get curTriggerIds(): Vector.<int>{
			return _curTriggerIds;
		}
		
		/**
		 * set 当前已经触发ID列表
		 */
		public function set curTriggerIds(value: Vector.<int>): void{
			this._curTriggerIds = value;
		}
		
	}
}