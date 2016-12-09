package com.rpgGame.netData.client.message{
	import com.rpgGame.netData.client.bean.TestInfo;
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 测试消息
	 */
	public class TestMessageMessage extends Message {
	
		//测试
		private var _testString: String;
		
		//测试
		private var _testshort: int;
		
		//测试
		private var _testlist: Vector.<String> = new Vector.<String>();
		//测试
		private var _testlistinfo: Vector.<TestInfo> = new Vector.<TestInfo>();
		//测试
		private var _testint: int;
		
		//测试
		private var _testlong: long;
		
		//测试
		private var _testlistint: Vector.<int> = new Vector.<int>();
		//测试
		private var _testinfo: TestInfo;
		
		//测试
		private var _testbyte: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//测试
			writeString(_testString);
			//测试
			writeShort(_testshort);
			//测试
			writeShort(_testlist.length);
			for (i = 0; i < _testlist.length; i++) {
				writeString(_testlist[i]);
			}
			//测试
			writeShort(_testlistinfo.length);
			for (i = 0; i < _testlistinfo.length; i++) {
				writeBean(_testlistinfo[i]);
			}
			//测试
			writeInt(_testint);
			//测试
			writeLong(_testlong);
			//测试
			writeShort(_testlistint.length);
			for (i = 0; i < _testlistint.length; i++) {
				writeInt(_testlistint[i]);
			}
			//测试
			writeBean(_testinfo);
			//测试
			writeByte(_testbyte);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//测试
			_testString = readString();
			//测试
			_testshort = readShort();
			//测试
			var testlist_length : int = readShort();
			for (i = 0; i < testlist_length; i++) {
				_testlist[i] = readString();
			}
			//测试
			var testlistinfo_length : int = readShort();
			for (i = 0; i < testlistinfo_length; i++) {
				_testlistinfo[i] = readBean(TestInfo) as TestInfo;
			}
			//测试
			_testint = readInt();
			//测试
			_testlong = readLong();
			//测试
			var testlistint_length : int = readShort();
			for (i = 0; i < testlistint_length; i++) {
				_testlistint[i] = readInt();
			}
			//测试
			_testinfo = readBean(TestInfo) as TestInfo;
			//测试
			_testbyte = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 301133;
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
		public function get testshort(): int{
			return _testshort;
		}
		
		/**
		 * set 测试
		 */
		public function set testshort(value: int): void{
			this._testshort = value;
		}
		
		/**
		 * get 测试
		 * @return 
		 */
		public function get testlist(): Vector.<String>{
			return _testlist;
		}
		
		/**
		 * set 测试
		 */
		public function set testlist(value: Vector.<String>): void{
			this._testlist = value;
		}
		
		/**
		 * get 测试
		 * @return 
		 */
		public function get testlistinfo(): Vector.<TestInfo>{
			return _testlistinfo;
		}
		
		/**
		 * set 测试
		 */
		public function set testlistinfo(value: Vector.<TestInfo>): void{
			this._testlistinfo = value;
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
		
		/**
		 * get 测试
		 * @return 
		 */
		public function get testlistint(): Vector.<int>{
			return _testlistint;
		}
		
		/**
		 * set 测试
		 */
		public function set testlistint(value: Vector.<int>): void{
			this._testlistint = value;
		}
		
		/**
		 * get 测试
		 * @return 
		 */
		public function get testinfo(): TestInfo{
			return _testinfo;
		}
		
		/**
		 * set 测试
		 */
		public function set testinfo(value: TestInfo): void{
			this._testinfo = value;
		}
		
		/**
		 * get 测试
		 * @return 
		 */
		public function get testbyte(): int{
			return _testbyte;
		}
		
		/**
		 * set 测试
		 */
		public function set testbyte(value: int): void{
			this._testbyte = value;
		}
		
	}
}