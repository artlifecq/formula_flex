package com.rpgGame.netData.client.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 测试info
	 */
	public class TestInfo extends Bean {
	
		//测试
		private var _testString: String;
		
		//测试
		private var _testint: int;
		
		//测试
		private var _testlong: long;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//测试
			writeString(_testString);
			//测试
			writeInt(_testint);
			//测试
			writeLong(_testlong);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//测试
			_testString = readString();
			//测试
			_testint = readInt();
			//测试
			_testlong = readLong();
			return true;
		}
		
		/**
		 * get 测试
		 * @return 
		 */
		public function get testString(): String{
			return _testString;
		}
		
		/**
		 * set 测试
		 */
		public function set testString(value: String): void{
			this._testString = value;
		}
		
		/**
		 * get 测试
		 * @return 
		 */
		public function get testint(): int{
			return _testint;
		}
		
		/**
		 * set 测试
		 */
		public function set testint(value: int): void{
			this._testint = value;
		}
		
		/**
		 * get 测试
		 * @return 
		 */
		public function get testlong(): long{
			return _testlong;
		}
		
		/**
		 * set 测试
		 */
		public function set testlong(value: long): void{
			this._testlong = value;
		}
		
	}
}