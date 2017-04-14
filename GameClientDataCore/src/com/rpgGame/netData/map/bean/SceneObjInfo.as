package com.rpgGame.netData.map.bean{
	
	import flash.utils.ByteArray;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 场景对象数据
	 */
	public class SceneObjInfo extends Bean {
		
		//对象类型
		private var _objType: int;
		
		//场景对象具体数据(二进制数组在列表第一个位置)
		private var _bytesList: Vector.<ByteArray> = new Vector.<ByteArray>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//对象类型
			writeByte(_objType);
			//场景对象具体数据(二进制数组在列表第一个位置)
			writeShort(_bytesList.length);
			for (var i: int = 0; i < _bytesList.length; i++) {
				//场景对象具体数据(二进制数组在列表第一个位置)
				writeShort(_bytesList[i].length);
				writeBytes(_bytesList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//对象类型
			_objType = readByte();
			//场景对象具体数据(二进制数组在列表第一个位置)
			var bytesList_length : int = readShort();
			for (var i: int = 0; i < bytesList_length; i++) {
				//场景对象具体数据(二进制数组在列表第一个位置)
				_bytesList[i] = readBytes();
			}
			return true;
		}
		
		/**
		 * get 对象类型
		 * @return 
		 */
		public function get objType(): int{
			return _objType;
		}
		
		/**
		 * set 对象类型
		 */
		public function set objType(value: int): void{
			this._objType = value;
		}
		
		/**
		 * get 场景对象具体数据(二进制数组在列表第一个位置)
		 * @return 
		 */
		public function get bytesList(): Vector.<ByteArray>{
			return _bytesList;
		}
		
		/**
		 * set 场景对象具体数据(二进制数组在列表第一个位置)
		 */
		public function set bytesList(value: Vector.<ByteArray>): void{
			this._bytesList = value;
		}
		
	}
}
