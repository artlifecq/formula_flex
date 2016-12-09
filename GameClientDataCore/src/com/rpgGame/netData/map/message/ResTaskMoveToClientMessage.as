package com.rpgGame.netData.map.message{
	import com.rpgGame.netData.structs.Position;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 任务移动 剧情用
	 */
	public class ResTaskMoveToClientMessage extends Message {
	
		//任务modelId
		private var _taskmodel: int;
		
		//改变坐标
		private var _position: com.rpgGame.netData.structs.Position;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//任务modelId
			writeInt(_taskmodel);
			//改变坐标
			writeBean(_position);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//任务modelId
			_taskmodel = readInt();
			//改变坐标
			_position = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 101142;
		}
		
		/**
		 * get 任务modelId
		 * @return 
		 */
		public function get taskmodel(): int{
			return _taskmodel;
		}
		
		/**
		 * set 任务modelId
		 */
		public function set taskmodel(value: int): void{
			this._taskmodel = value;
		}
		
		/**
		 * get 改变坐标
		 * @return 
		 */
		public function get position(): com.rpgGame.netData.structs.Position{
			return _position;
		}
		
		/**
		 * set 改变坐标
		 */
		public function set position(value: com.rpgGame.netData.structs.Position): void{
			this._position = value;
		}
		
	}
}