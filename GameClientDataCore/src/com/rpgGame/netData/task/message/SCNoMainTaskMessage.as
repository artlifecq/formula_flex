package com.rpgGame.netData.task.message{
	import com.rpgGame.netData.task.bean.NoMainTaskInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 卡级提示
	 */
	public class SCNoMainTaskMessage extends Message {
	
		//任务id
		private var _taskModelId: int;
		
		//卡级提示内容
		private var _noMainTaskInfo: Vector.<NoMainTaskInfo> = new Vector.<NoMainTaskInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//任务id
			writeInt(_taskModelId);
			//卡级提示内容
			writeShort(_noMainTaskInfo.length);
			for (i = 0; i < _noMainTaskInfo.length; i++) {
				writeBean(_noMainTaskInfo[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//任务id
			_taskModelId = readInt();
			//卡级提示内容
			var noMainTaskInfo_length : int = readShort();
			for (i = 0; i < noMainTaskInfo_length; i++) {
				_noMainTaskInfo[i] = readBean(NoMainTaskInfo) as NoMainTaskInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 124108;
		}
		
		/**
		 * get 任务id
		 * @return 
		 */
		public function get taskModelId(): int{
			return _taskModelId;
		}
		
		/**
		 * set 任务id
		 */
		public function set taskModelId(value: int): void{
			this._taskModelId = value;
		}
		
		/**
		 * get 卡级提示内容
		 * @return 
		 */
		public function get noMainTaskInfo(): Vector.<NoMainTaskInfo>{
			return _noMainTaskInfo;
		}
		
		/**
		 * set 卡级提示内容
		 */
		public function set noMainTaskInfo(value: Vector.<NoMainTaskInfo>): void{
			this._noMainTaskInfo = value;
		}
		
	}
}