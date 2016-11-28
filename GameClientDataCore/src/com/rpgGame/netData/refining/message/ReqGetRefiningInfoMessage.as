package com.rpgGame.netData.refining.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求获得锻造系统数据
	 */
	public class ReqGetRefiningInfoMessage extends Message {
	
		//1 锻造装备失败缓存
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//1 锻造装备失败缓存
			writeInt(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//1 锻造装备失败缓存
			_type = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 204209;
		}
		
		/**
		 * get 1 锻造装备失败缓存
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 1 锻造装备失败缓存
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}