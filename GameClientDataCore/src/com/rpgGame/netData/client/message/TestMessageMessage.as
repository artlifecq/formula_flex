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
	 * ≤‚ ‘œ˚œ¢
	 */
	public class TestMessageMessage extends Message {
	
		//≤‚ ‘
		private var _testString: String;
		
		//≤‚ ‘
		private var _testshort: int;
		
		//≤‚ ‘
		private var _testlist: Vector.<String> = new Vector.<String>();
		//≤‚ ‘
		private var _testlistinfo: Vector.<TestInfo> = new Vector.<TestInfo>();
		//≤‚ ‘
		private var _testint: int;
		
		//≤‚ ‘
		private var _testlong: long;
		
		//≤‚ ‘
		private var _testlistint: Vector.<int> = new Vector.<int>();
		//≤‚ ‘
		private var _testinfo: TestInfo;
		
		//≤‚ ‘
		private var _testbyte: int;
		
		
		/**
		 * –¥»Î◊÷Ω⁄ª∫¥Ê
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//≤‚ ‘
			writeString(_testString);
			//≤‚ ‘
			writeShort(_testshort);
			//≤‚ ‘
			writeShort(_testlist.length);
			for (i = 0; i < _testlist.length; i++) {
				writeString(_testlist[i]);
			}
			//≤‚ ‘
			writeShort(_testlistinfo.length);
			for (i = 0; i < _testlistinfo.length; i++) {
				writeBean(_testlistinfo[i]);
			}
			//≤‚ ‘
			writeInt(_testint);
			//≤‚ ‘
			writeLong(_testlong);
			//≤‚ ‘
			writeShort(_testlistint.length);
			for (i = 0; i < _testlistint.length; i++) {
				writeInt(_testlistint[i]);
			}
			//≤‚ ‘
			writeBean(_testinfo);
			//≤‚ ‘
			writeByte(_testbyte);
			return true;
		}
		
		/**
		 * ∂¡»°◊÷Ω⁄ª∫¥Ê
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//≤‚ ‘
			_testString = readString();
			//≤‚ ‘
			_testshort = readShort();
			//≤‚ ‘
			var testlist_length : int = readShort();
			for (i = 0; i < testlist_length; i++) {
				_testlist[i] = readString();
			}
			//≤‚ ‘
			var testlistinfo_length : int = readShort();
			for (i = 0; i < testlistinfo_length; i++) {
				_testlistinfo[i] = readBean(TestInfo) as TestInfo;
			}
			//≤‚ ‘
			_testint = readInt();
			//≤‚ ‘
			_testlong = readLong();
			//≤‚ ‘
			var testlistint_length : int = readShort();
			for (i = 0; i < testlistint_length; i++) {
				_testlistint[i] = readInt();
			}
			//≤‚ ‘
			_testinfo = readBean(TestInfo) as TestInfo;
			//≤‚ ‘
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
		 * get ≤‚ ‘
		 * @return 
		 */
		public function get testString(): String{
			return _testString;
		}
		
		/**
		 * set ≤‚ ‘
		 */
		public function set testString(value: String): void{
			this._testString = value;
		}
		
		/**
		 * get ≤‚ ‘
		 * @return 
		 */
		public function get testshort(): int{
			return _testshort;
		}
		
		/**
		 * set ≤‚ ‘
		 */
		public function set testshort(value: int): void{
			this._testshort = value;
		}
		
		/**
		 * get ≤‚ ‘
		 * @return 
		 */
		public function get testlist(): Vector.<String>{
			return _testlist;
		}
		
		/**
		 * set ≤‚ ‘
		 */
		public function set testlist(value: Vector.<String>): void{
			this._testlist = value;
		}
		
		/**
		 * get ≤‚ ‘
		 * @return 
		 */
		public function get testlistinfo(): Vector.<TestInfo>{
			return _testlistinfo;
		}
		
		/**
		 * set ≤‚ ‘
		 */
		public function set testlistinfo(value: Vector.<TestInfo>): void{
			this._testlistinfo = value;
		}
		
		/**
		 * get ≤‚ ‘
		 * @return 
		 */
		public function get testint(): int{
			return _testint;
		}
		
		/**
		 * set ≤‚ ‘
		 */
		public function set testint(value: int): void{
			this._testint = value;
		}
		
		/**
		 * get ≤‚ ‘
		 * @return 
		 */
		public function get testlong(): long{
			return _testlong;
		}
		
		/**
		 * set ≤‚ ‘
		 */
		public function set testlong(value: long): void{
			this._testlong = value;
		}
		
		/**
		 * get ≤‚ ‘
		 * @return 
		 */
		public function get testlistint(): Vector.<int>{
			return _testlistint;
		}
		
		/**
		 * set ≤‚ ‘
		 */
		public function set testlistint(value: Vector.<int>): void{
			this._testlistint = value;
		}
		
		/**
		 * get ≤‚ ‘
		 * @return 
		 */
		public function get testinfo(): TestInfo{
			return _testinfo;
		}
		
		/**
		 * set ≤‚ ‘
		 */
		public function set testinfo(value: TestInfo): void{
			this._testinfo = value;
		}
		
		/**
		 * get ≤‚ ‘
		 * @return 
		 */
		public function get testbyte(): int{
			return _testbyte;
		}
		
		/**
		 * set ≤‚ ‘
		 */
		public function set testbyte(value: int): void{
			this._testbyte = value;
		}
		
	}
}