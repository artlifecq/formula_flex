package com.rpgGame.netData.task.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 任务完成进度消息
	 */
	public class TaskSubRateInfo extends Bean {
	
		//任务对象模板id(可能是道具ID,也可能是怪物ID,这个要看任务子类型是什么)
		private var _modelId: int;
		
		//完成进度
		private var _num: int;
		
		//最大值
		private var _maxNum: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//任务对象模板id(可能是道具ID,也可能是怪物ID,这个要看任务子类型是什么)
			writeInt(_modelId);
			//完成进度
			writeInt(_num);
			//最大值
			writeInt(_maxNum);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//任务对象模板id(可能是道具ID,也可能是怪物ID,这个要看任务子类型是什么)
			_modelId = readInt();
			//完成进度
			_num = readInt();
			//最大值
			_maxNum = readInt();
			return true;
		}
		
		/**
		 * get 任务对象模板id(可能是道具ID,也可能是怪物ID,这个要看任务子类型是什么)
		 * @return 
		 */
		public function get modelId(): int{
			return _modelId;
		}
		
		/**
		 * set 任务对象模板id(可能是道具ID,也可能是怪物ID,这个要看任务子类型是什么)
		 */
		public function set modelId(value: int): void{
			this._modelId = value;
		}
		
		/**
		 * get 完成进度
		 * @return 
		 */
		public function get num(): int{
			return _num;
		}
		
		/**
		 * set 完成进度
		 */
		public function set num(value: int): void{
			this._num = value;
		}
		
		/**
		 * get 最大值
		 * @return 
		 */
		public function get maxNum(): int{
			return _maxNum;
		}
		
		/**
		 * set 最大值
		 */
		public function set maxNum(value: int): void{
			this._maxNum = value;
		}
		
	}
}