package com.rpgGame.netData.top.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 未上榜提示
	 */
	public class SCNoInTopMessage extends Message {
	
		//排行榜类型
		private var _topType: int;
		
		//参数  比如 差1000 战力可以上榜    等
		private var _parameter: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//排行榜类型
			writeInt(_topType);
			//参数  比如 差1000 战力可以上榜    等
			writeInt(_parameter);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//排行榜类型
			_topType = readInt();
			//参数  比如 差1000 战力可以上榜    等
			_parameter = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 141111;
		}
		
		/**
		 * get 排行榜类型
		 * @return 
		 */
		public function get topType(): int{
			return _topType;
		}
		
		/**
		 * set 排行榜类型
		 */
		public function set topType(value: int): void{
			this._topType = value;
		}
		
		/**
		 * get 参数  比如 差1000 战力可以上榜    等
		 * @return 
		 */
		public function get parameter(): int{
			return _parameter;
		}
		
		/**
		 * set 参数  比如 差1000 战力可以上榜    等
		 */
		public function set parameter(value: int): void{
			this._parameter = value;
		}
		
	}
}