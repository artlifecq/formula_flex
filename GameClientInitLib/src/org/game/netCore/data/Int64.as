package org.game.netCore.data
{
	import flash.utils.ByteArray;
	
	/**
	 * 64位数据类型，相当于QWORD，主要用于和服务器对接
	 * @author tyevlag
	 */
	public class Int64
	{
		protected var _hValue:uint;
		protected var _lValue:uint;
		protected var _hexValue:String = "0000000000000000";
		
		private static const hexTable:String = "0123456789abcdef";
		private static const BYTESIZE:int = 8;
		private static const HEX_STR_LEN:int = 16;
		
		public static const ZERO:String = "0000000000000000";
		public static const MAX:String =  "ffffffffffffffff";
		
		public static const ZERO_VALUE:Int64 = new Int64("0000000000000000");
		public static const MAX_VALUE:Int64 = new Int64("ffffffffffffffff");
		
		public function Int64(value:* = 0)
		{
			if (value is String)
				hexValue = value;
			else if (value != 0)
				intValue = value;
		}
		
		public function set intValue(value:int) : void
		{
			if (value < 0)
			{
				_hValue = uint.MAX_VALUE;
				_lValue = value;
				_hexValue = (MAX + MAX + _lValue.toString(16)).substr(-16, 16);
			}
			else
			{
				_hValue = 0;
				_lValue = value;
				_hexValue = (ZERO + ZERO + _lValue.toString(16)).substr(-16, 16);
			}
		}
		
		public function SetRawData(l:int, h:int, s:String):void
		{
			_hValue = _hValue;
			_lValue = _lValue;
			_hexValue = new String(s);
		}
		
		public function set bytes(value:ByteArray) : void
		{
			value.position = 0;
			_hValue = value.readInt();
			_lValue = value.readInt();
			_hexValue = (ZERO + _hValue.toString(16)).substr(-8, 8) + (ZERO + _lValue.toString(16)).substr(-8, 8);
		}
		
		public function get bytes() : ByteArray
		{
			var ret:ByteArray = new ByteArray();
			ret.writeInt(_hValue);
			ret.writeInt(_lValue);
			return ret;
		}
		
		public function get hexValue():String
		{
			return _hexValue;
		}
		
		public function set hexValue(str:String):void
		{
			var _bytes:ByteArray = new ByteArray();
			_bytes.writeInt(0);
			_bytes.writeInt(0);
			_hexValue = (ZERO + ZERO + str).substr(-16, 16);
			
			for(var i:int = 0; i < BYTESIZE; ++i)
			{
				var char:String = _hexValue.substr(i*2, 2);
				var num:int = parseInt(char, HEX_STR_LEN);
				//_bytes.writeByte(num);
				_bytes[i] = num;
			}
			
			_bytes.position = 0;
			_hValue = _bytes.readInt();
			_lValue = _bytes.readInt();
		}
		
		/**
		 * 得到十进制数字
		 */
		public function get fValue():Number
		{
			return ((_hValue) * uint.MAX_VALUE) + _lValue;
		}
		
		/**
		 * 深拷贝
		 */
		public function CloneInt64():Int64
		{
			var ret:Int64 = new Int64();
			ret._hValue = _hValue;
			ret._lValue = _lValue;
			ret._hexValue = new String(_hexValue);
			return ret;
		}
		
		/**
		 * 大小比比看
		 * 大于   1
		 * 等于   0
		 * 小于 -1
		 */
		public function CompareTo(value:Int64):uint
		{
			if (value == null)
				return 1;
			
			if (_hValue > value._hValue)
			{
				return 1;
			}
			else if (_hValue < value._hValue)
			{
				return -1;
			}
			
			if (_lValue > value._lValue)
			{
				return 1;
			}
			else if (_lValue < value._lValue)
			{
				return -1;
			}
			
			return 0;
		}
		
		/**
		 * 是否相等 
		 * @param value
		 * @return 
		 * 
		 */
		public function EqualTo(value:Int64):Boolean
		{
			return (CompareTo(value) == 0);
		}
		
		/**
		 * 是0 
		 * @return 
		 * 
		 */
		public function IsZero():Boolean
		{
			return (_lValue == 0 && _hValue == 0);
		}
		
		/**
		 * 是最大 -1 
		 * @return 
		 * 
		 */
		public function IsMax():Boolean
		{
			return (_lValue == uint.MAX_VALUE && _hValue == uint.MAX_VALUE);
		}
		
		public function Clear():void
		{
			intValue = 0;
		}
		
		public function ToString():String
		{
			return _hexValue;
		}
		
		public function ToGID():uint
		{
			return LongIdMap.ToGID(this);
		}
		
		public static function ChangeGID(oldSid:Int64, newSid:Int64):uint
		{
			return LongIdMap.ChangeGID(oldSid,newSid);
		}
		
		public function get hValue():uint
		{
			return _hValue;
		}
		
		public function get lValue():uint
		{
			return _lValue;
		}
		
		public function set hValue(value:uint):void
		{
			_hValue = value;
		}
		
		public function set lValue(value:uint):void
		{
			_lValue = value;
		}
		
		public function ShowValue():String
		{
			var high:int = _hValue;
			var low:int = _lValue;
			var temp : String;
			if ( low < 0 )
				temp = Addition(String(low), "4294967296");
			else
				temp = String(low);
			
			return Addition(Multiplication(String(high), "4294967296"), temp);
		}
		
		/**
		 * 位掩码检测
		 * @param state
		 * @param isH
		 * @return 
		 * 
		 */
		public function BitMaskTest(state:int, isH:Boolean = false):Boolean
		{
			if (isH)
				return ((_hValue & state) != 0);
			
			return ((_lValue & state) != 0);
		}
		
		/**
		 * and位掩码
		 * @param state
		 * @param isH
		 * @return 
		 * 
		 */
		public function BitMaskAnd(state:int, isH:Boolean = false):void
		{
			if (isH)
				_hValue &= state;
			
			_lValue &= state;
			_hexValue = (ZERO + _hValue.toString(16) + _lValue.toString(16)).substr(-16, 16);
		}
		
		/**
		 * or位掩码
		 * @param state
		 * @param isH
		 * @return 
		 * 
		 */
		public function BitMaskOr(state:int, isH:Boolean = false):void
		{
			if (isH)
				_hValue |= state;
			
			_lValue |= state;
			_hexValue = (ZERO + _hValue.toString(16) + _lValue.toString(16)).substr(-16, 16);
		}
		
		
		//加法
		private static var ADDITION:String = "00000000";
		//乘法
		private static var MULTIPLY:String = "0000";
		/**
		 * 乘法
		 */
		public static function Multiplication(a:String, b:String):String
		{
			//是否正负相同
			var same:Boolean = true;
			
			var a_array:Array = new Array();
			var b_array:Array = new Array();
			
			//a是否为负数
			if ( a.charAt(0) == "-" )
			{
				a = a.substring(1);
				same = !same;
			}
			
			//把a按固定长度分割，压入数组
			while ( a.length > MULTIPLY.length )
			{
				a_array.push(a.substring(a.length - MULTIPLY.length));
				a = a.substring(0, a.length - MULTIPLY.length);
			}
			a_array.push( a );
			
			//b是否为负数
			if ( b.charAt(0) == "-" )
			{
				b = b.substring(1);
				same = !same;
			}
			
			//把b按固定长度分割，压入数组
			while(b.length > MULTIPLY.length)
			{
				b_array.push( b.substring(b.length - MULTIPLY.length));
				b = b.substring(0, b.length - MULTIPLY.length);
			}
			b_array.push(b);
			
			var result:String = "0";
			var x:int;
			var y:int;
			var temp:String;
			
			for (var i : int = 0; i < a_array.length; i++) 
			{
				for ( var j : int = 0; j < b_array.length; j++) 
				{
					x = int(a_array[i]);
					y = int(b_array[j]);
					temp = String(x * y);
					for (var k : int = 0; k < i + j; k++) 
					{
						temp += MULTIPLY;
					}
					result = Addition(temp, result);
				}
			}
			
			if ( !same )
				result = "-" + result;
			
			return result;
		}
		
		/**
		 * 加法
		 */
		public static function Addition(a:String, b:String):String
		{
			//是否正负相同
			var same:Boolean = true;
			//结果是否为负数
			var negative:Boolean = false;
			
			var a_array:Array = new Array();
			var b_array:Array = new Array();
			
			//a是否为负数
			if ( a.charAt(0) == "-" )
			{
				a = a.substring(1);
				same = !same;
				negative = true;
			}
			
			//把a按固定长度分割，压入数组
			while ( a.length > ADDITION.length )
			{
				a_array.unshift(a.substring(a.length - ADDITION.length));
				a = a.substring(0, a.length - ADDITION.length);
			}
			a_array.unshift(a);
			
			//b是否为负数
			if ( b.charAt(0) == "-" )
			{
				b = b.substring(1);
				same = !same;
			}
			
			//把b按固定长度分割，压入数组
			while ( b.length > ADDITION.length )
			{
				b_array.unshift( b.substring(b.length - ADDITION.length));
				b = b.substring(0, b.length - ADDITION.length);
			}
			b_array.unshift(b);
			
			var result:String = "";
			var x:int;
			var y:int;
			var z:int;
			var temp:int;
			var addition_const:int = int( "1" + ADDITION );
			
			//同符号
			if ( same )
			{
				z = 0;
				while ( a_array.length > 0 || b_array.length > 0 )
				{
					x = 0;
					y = 0;
					if ( a_array.length > 0 )
						x = int( a_array.pop() );
					if ( b_array.length > 0 )
						y = int( b_array.pop() );
					
					temp = x + y + z;
					if ( temp >= addition_const )
					{
						z = 1;
						temp = temp % addition_const;
					}
					else
						z = 0;
					
					result = Format(temp) + result;
				}
				
				if ( z == 1 ) 
					result = "1" + result;
			}
			else
			{
				var results:Array = new Array(); 
				while ( a_array.length > 0 || b_array.length > 0 )
				{
					x = 0;
					y = 0;
					if ( a_array.length > 0 )
						x = int(a_array.pop());
					if ( b_array.length > 0 )
						y = int( b_array.pop() );
					
					temp = x - y;
					results.push( temp );
				}
				
				if ( results.length > 0 )
				{
					x = results.pop();
					while ( x == 0 && results.length > 0)
						x = results.pop();
				}
				
				if ( x == 0 )
					return "0";
				
				results.push( x );
				
				z = 0;
				if ( x > 0 )
				{
					while ( results.length > 0 )
					{
						y = results.shift();
						y = y - z;
						if ( y < 0 )
						{
							z = 1;
							y = addition_const + y;
						}
						else
							z = 0;
						
						result = Format(y) + result;
					}
				}
				else
				{
					negative = !negative;
					while ( results.length > 0 )
					{
						y = results.shift();
						y = y + z;
						if ( y > 0 )
						{
							z = 1;
							y = addition_const - y;
						}
						else
						{
							z = 0;
							y = -y;
						}
						
						result = Format(y) + result;
					}
				}
			}
			
			while ( result.length > 1 )
			{
				if ( result.charAt(0) == "0" )
					result = result.substring(1);
				else
					break;
			}
			
			if ( negative )
				result = "-" + result;
			
			return result;
		}
		
		public static function Format(num: int):String
		{
			var result : String = String(num);
			var size : int = ADDITION.length - result.length;
			if ( size < 0 )
				return result.substring( -size );
			else
			{
				for ( var i : int = 0; i < size; i++) 
					result = "0" + result;
				
				return result;
			}
		}
		/**
		 * 字符转long
		 */
		public function FormString(s:String):Int64 
		{
			return null;
		}
		
	}
	
}
