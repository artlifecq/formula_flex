package com.rpgGame.netData.junjie.bean{
	import com.rpgGame.netData.junjie.bean.JunJieConditionInfo;
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 军阶对象数据
	 */
	public class JunJieInfo extends Bean {
	
		//军阶模板ID
		private var _modelId: int;
		
		//军阶状态 0 不可激活  1 可以激活     2 已激活
		private var _state: int;
		
		//条件
		private var _junJieConditionInfos: Vector.<JunJieConditionInfo> = new Vector.<JunJieConditionInfo>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//军阶模板ID
			writeInt(_modelId);
			//军阶状态 0 不可激活  1 可以激活     2 已激活
			writeInt(_state);
			//条件
			writeShort(_junJieConditionInfos.length);
			for (var i: int = 0; i < _junJieConditionInfos.length; i++) {
				writeBean(_junJieConditionInfos[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//军阶模板ID
			_modelId = readInt();
			//军阶状态 0 不可激活  1 可以激活     2 已激活
			_state = readInt();
			//条件
			var junJieConditionInfos_length : int = readShort();
			for (var i: int = 0; i < junJieConditionInfos_length; i++) {
				_junJieConditionInfos[i] = readBean(JunJieConditionInfo) as JunJieConditionInfo;
			}
			return true;
		}
		
		/**
		 * get 军阶模板ID
		 * @return 
		 */
		public function get modelId(): int{
			return _modelId;
		}
		
		/**
		 * set 军阶模板ID
		 */
		public function set modelId(value: int): void{
			this._modelId = value;
		}
		
		/**
		 * get 军阶状态 0 不可激活  1 可以激活     2 已激活
		 * @return 
		 */
		public function get state(): int{
			return _state;
		}
		
		/**
		 * set 军阶状态 0 不可激活  1 可以激活     2 已激活
		 */
		public function set state(value: int): void{
			this._state = value;
		}
		
		/**
		 * get 条件
		 * @return 
		 */
		public function get junJieConditionInfos(): Vector.<JunJieConditionInfo>{
			return _junJieConditionInfos;
		}
		
		/**
		 * set 条件
		 */
		public function set junJieConditionInfos(value: Vector.<JunJieConditionInfo>): void{
			this._junJieConditionInfos = value;
		}
		
	}
}