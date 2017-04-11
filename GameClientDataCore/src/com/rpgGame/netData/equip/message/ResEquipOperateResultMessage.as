package com.rpgGame.netData.equip.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 装备相关操作结果返回
	 */
	public class ResEquipOperateResultMessage extends Message {
	
		//操作Id
		private var _opaque: int;
		
		//操作结果,0:失败,1:成功
		private var _result: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//操作Id
			writeInt(_opaque);
			//操作结果,0:失败,1:成功
			writeByte(_result);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//操作Id
			_opaque = readInt();
			//操作结果,0:失败,1:成功
			_result = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 107106;
		}
		
		/**
		 * get 操作Id
		 * @return 
		 */
		public function get opaque(): int{
			return _opaque;
		}
		
		/**
		 * set 操作Id
		 */
		public function set opaque(value: int): void{
			this._opaque = value;
		}
		
		/**
		 * get 操作结果,0:失败,1:成功
		 * @return 
		 */
		public function get result(): int{
			return _result;
		}
		
		/**
		 * set 操作结果,0:失败,1:成功
		 */
		public function set result(value: int): void{
			this._result = value;
		}
		
	}
}