package com.rpgGame.netData.map.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 任务特殊传送
	 */
	public class ReqTaskMoveToGameMessage extends Message {
	
		//任务modelID
		private var _taskModelID: int;
		
		//类型0通用 1特殊
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//任务modelID
			writeInt(_taskModelID);
			//类型0通用 1特殊
			writeByte(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//任务modelID
			_taskModelID = readInt();
			//类型0通用 1特殊
			_type = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 101217;
		}
		
		/**
		 * get 任务modelID
		 * @return 
		 */
		public function get taskModelID(): int{
			return _taskModelID;
		}
		
		/**
		 * set 任务modelID
		 */
		public function set taskModelID(value: int): void{
			this._taskModelID = value;
		}
		
		/**
		 * get 类型0通用 1特殊
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 类型0通用 1特殊
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}