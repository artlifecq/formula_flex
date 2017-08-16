package  com.rpgGame.core.utils
{   
	import com.gameClient.utils.JSONUtil;
	
	import flash.utils.ByteArray;
    
    /**
     * @author Administrator
     */
    public class TextUtil
    {
		/**
		 * 服务器发来的时刻秒 转换为 字符串
		 *
		 */
		public static function getDateTimeAt(seconds:int, fullmodel:int = 0, noyear:Boolean = false):String
		{
			var date:Date = new Date();
			date.time = seconds * 1000;
			var str:String = "";
			var tmp:String = "";
			
			if ( noyear == false ) 
				str = TextUtil.ConectParam("{1}年{2}月{3}日 ", [ date.getFullYear(), (date.getMonth() + 1), date.getDate() ] );
			else
				str = TextUtil.ConectParam( "{1}月{2}日 ", [ (date.getMonth() + 1), date.getDate() ] );
			
			if (fullmodel == 1)
			{
				tmp = date.getHours().toString();
				if (tmp.length == 1)
					tmp = "0" + tmp;
				str += " " + tmp;
				
				tmp = date.getMinutes().toString();
				if (tmp.length == 1)
					tmp = "0" + tmp;
				
				str += ":" + tmp;
				
				tmp = date.getSeconds().toString();
				if (tmp.length == 1)
					tmp = "0" + tmp;
				
				str += ":" + tmp;
			}
			else if(fullmodel == 2)
			{
				tmp = date.getHours().toString();
				str += TextUtil.ConectParam( "{1}时", [ tmp ] );
			}
			else if ( fullmodel == 3 )
			{
				tmp = date.getHours().toString();
				if (tmp.length == 1)
					tmp = "0" + tmp;
				str += " " + tmp;
				
				tmp = date.getMinutes().toString();
				if (tmp.length == 1)
					tmp = "0" + tmp;
				str += ":" + tmp;
			}
			else if(fullmodel == 4)
			{
				str += TextUtil.ConectParam( "{1}时{2}分", [ date.getHours(), date.getMinutes() ] );
			}
			
			return str;
		}
		public static function splitStr(_icon:String, type:int):Array
		{
			// TODO Auto Generated method stub
			var arr:Array = [];
			if ( _icon == null )
				return arr;
			
			var splitmark:String = "_";
			switch ( type )
			{
				case 1:
					splitmark = "_";
					break;
				case 2:
					splitmark = ";";
					break;
				case 3:
					splitmark = ",";
					break;
				case 4:
					splitmark = "|";
					break;
			}
			arr = _icon.split(splitmark);
			return arr;
		}
		/**
		 * 字符串分拆成数组,主要是全数字型的字符串有用
		 * @param str
		 * @return 
		 */		
		public static function strToArr( str:String ):Array
		{
			var num:Array = [];
			for ( var i:int = 0; i < str.length; i++ )
			{
				num.push( int( str.substr(i, 1) ) );
			}
			return num;
		}

		
		/**
		 * 专门解析服务器的带link的字符串，0号位置是原串
		 * @param str
		 */
		public static function ParseJsonLinkStr( jsonstr :String, param :Object = null ):Vector.<String>
		{
			try
			{
				var pa :Object = ( param == null ) ? {} : param;
				
				//var str :String = '{"t" :"abcdefg{@}hijklmn", "ps" :[{"name" :"[dian]","url" :"q.37wan.com","type" :4}]}';
				
				var ret :Vector.<String> = new Vector.<String>();
				var o :Object = JSONUtil.decode( jsonstr );
				ret.push( o["t"] );
				var ps :Array = o["ps"];
				var rret :Vector.<String>;
				if ( ps != null )
				{
					rret = ret.concat( ParseJsonLinks( ps, pa ) );
				}
				else
				{
					return ret;
				}
				
				return rret;
			}
			catch ( err :Error )
			{
				return Vector.<String>( [jsonstr] );
			}
			
			return null;
		}
		
		/**
		 * 专门解析服务器的带link的字符串参数，返回构造好的超链接数组
		 * @param str
		 */
		private static function ParseJsonLinks( ps :Array, param :Object = null ):Vector.<String>
		{
			var ret :Vector.<String> = new Vector.<String>();
			if ( ps == null )
				return ret;
			
			try
			{
				var pa :Object = ( param == null ) ? {} : param;
				
				for ( var i :int = 0; i < ps.length; i++ )
				{
					var o :Object = ps[i];
					var link :String;
					// 玩家
					//					if ( o.type == 1 )
					//					{
					//						link = ChatUtil.createNameLink( o.name, o.pid );
					//					}
					//						// 地图
					//					else if ( o.type == 2 )
					//					{
					//						link = ChatUtil.createMapLink( o.mapid, o.x, o.y, o.line, pa.mapname );
					//					}
					//					else if ( o.type == 3 )
					//					{// 付费引导
					//						//						link = ChatUtil.createVIPPointLink( o.viplv, o.idx );
					//						link = ChatUtil.createGuideLink( o );
					//					}
					//					else if ( o.type == 4 )
					//					{// wang ye 
					//						link = ChatUtil.createNetLink( o.name, o.url );
					//					}					
					//					else
					{
						continue;
					}
					ret.push( link );
				}
			}
			catch ( err :Error )
			{
				return new Vector.<String>;
			}
			//var str :String = '{"ps" :[{"name" :"aaaa","pid" :1111111111,"type" :1},{"name" :"bbbbb","pid" :222222222222222,"type" :1},{"line" :1,"mapid" :1000,"type" :2,"x" :100,"y" :100}],"t" :"[我的帮派]帮会被{@}创建。{@}创建2.{@}创建3."}';
			return ret;
		}
		
		public static function getImgUrl( str :String ):String
		{
			var myPattern :RegExp = /\//g;
			return str.replace( myPattern, "_" );
		}
		
		// ===============================================================================================================================
		// =================================================================================================================== 转换字符串
		// ===============================================================================================================================
		/** 转换HTML字符串 - ty*/
		private static var getHtmlStr_Pattern :RegExp = /0x/gi;
		public static function GetHtmlStr( str :String, color :* = "#ffffff", size :int = 12, isChangeLine :Boolean = false, font :String = "SimSun,宋体"/*GameFont.DEFAULT*/ ):String
		{
			if ( str == null )
				return "";
			
			str = ReplaceEnter( str,true );
			// 这个转义字符必须转掉，性能原因，就转第一个吧
			//            if ( str.indexOf( "<" ) == 0 && str.length == 1 )
			//                str = str.replace( "<", "&lt;" );
			
			var htmlStr :String = "";
			if( color is String ){
				color=color.replace( getHtmlStr_Pattern,"#" );
				if( color.charAt( 0 )!='#' ){
					color="#"+color;
				}
			}
			else if ( color != null && isNaN( color ) == false )
			{
				color = "#" + ( color as uint ).toString( 16 );
			}
			htmlStr += "<font ";
			htmlStr += "face ='" + font + "'";
			if ( size != -1 )
			{
				htmlStr += "size = '" + size.toString() + "' ";
			}
			
			if ( color != null )
			{
				htmlStr += "color='" + color.toString() +  "'";
			}
			
			htmlStr += ">";
			htmlStr += str;
			htmlStr += "</font>";
			
			if( isChangeLine )
				htmlStr += "<br>";
			
			return htmlStr;
		}
		
		/**
		 * 生成一个链接字符串，不包含颜色设置。。 
		 * @param key 链接事件ID
		 * @param str 链接文本
		 * @param underline
		 * @return 
		 */		
		public static function CreateLinkStr( key :String, str :String, underline :Boolean = true ):String
		{
			str = "<a href='event:" + key + "'>" + str + "</a>";
			
			if ( underline )
				str = "<u>" + str + "</u>";
			
			return str;
		}
		
		/**
		 * 生成一个链接字符串，包含颜色设置 
		 * @param key 链接事件ID
		 * @param str 链接文本
		 * @param underline
		 * @return 
		 */		
		public static function CreateLinkColorStr( key :String, str :String, color = "#00ff00", underline :Boolean = true ):String
		{
			str = "<a href='event:" + key + "'>" + str + "</a>";
			
			if ( underline )
				str = "<u>" + str + "</u>";
			
			str = GetHtmlStr(str, color);
			return str;
		}
		
		/**
		 * 替换文本中的\N换行 
		 * @param str
		 * @param str1
		 * @return 
		 */
		public static function ReplaceEnter( str :String,isHtmlText :Boolean = false ):String
		{
			var ret :String = str;
			var replaceStr :String = '\n';
			if ( isHtmlText )
				replaceStr = '<br>';
			
			while ( ret.indexOf( "\\N" ) != -1 )
			{
				ret = ret.replace( "\\N", replaceStr );
			}
			
			while ( ret.indexOf( "\\n" ) != -1 )
			{
				ret = ret.replace( "\\n", replaceStr );
			}
			
			return ret;
		}
		
		/** 删除HTML标签*/		
		public static function RemoveHTMLTag( text :String ):String
		{
			return text == null ? text : text.replace( /<.*?>/g,"" );
		}
		
	
		
		
		/** 是html*/		
		public static function isHtml( str :String ):Boolean 
		{
			var reg :RegExp = /<.*?>/g;
			return reg.test( str );
		}
		
		/** 为中文*/		
		public static function isCn( str :String ):Boolean 
		{
			var reg :RegExp = /^[一-龟]+$/;
			return reg.test( str );
		}
		
		/** 为中文加数字*/		
		public static function isCnn( str :String ):Boolean 
		{
			var reg :RegExp = /^[一-龟0-9]+$/;
			return reg.test( str );
		}
		
		/** 为英文*/		
		public static function isEn( str :String ):Boolean 
		{
			var reg :RegExp = /^[a-zA-Z]+$/;
			return reg.test( str );
		}
		
		/** 为中英文数字（合法用户名）*/		
		public static function isCnEn( str :String ):Boolean 
		{
			var reg :RegExp = /^[a-zA-Z一-龟0-9]+$/;
			return reg.test( str );
		}
		
		public static function isJson( str :String ):Boolean
		{
			if ( str == null )
				return false;
			
			if ( str.indexOf( "{" ) == 0 && str.lastIndexOf( "}" ) == ( str.length - 1 ) )
			{
				return JSONUtil.isJson( str );
			}
			
			return false;
		}
		
		public static function isContainNumber( str :String ):Boolean
		{
			if ( str == null || str == "" ) 
				return false;
			
			var len :int = str.length;
			
			for ( var i:int = 0; i < len; i++ ) 
			{
				if ( str.charCodeAt(i) >= 48 && str.charCodeAt(i) <= 57 ) 
					return true;
			}
			
			return false;
		}
		
		public static function isContainLetter( str :String ):Boolean
		{
			if ( str == null || str == "" ) 
				return false;
			
			var testStr :String = str.toLocaleLowerCase();
			var len :int = testStr.length;
			
			for ( var i:int = 0; i < len; i++ ) 
			{
				if ( str.charCodeAt(i) >= 65 && str.charCodeAt(i) <= 90 ) 
					return true;
			}
			
			return false;
		}
		
		// ===============================================================================================================================
		// =================================================================================================================== 时间相关
		// ===============================================================================================================================
		/**
		 * 秒时间戳转化为   2001-07-11 12 :59:00
		 */
		public static function GetWalletLogDate( secondTime :int ):String
		{
			var date :Date = new Date( secondTime * 1000 );
			return date.getFullYear()+"-"+GetDoubleNumStr( date.getMonth() + 1 ) + '-' + GetDoubleNumStr( date.getDate() ) + ' ' + GetDoubleNumStr( date.getHours() ) + ':' + GetDoubleNumStr( date.getMinutes() )+":"+GetDoubleNumStr( date.getSeconds() );
		}
		/**
		 * 秒时间戳转化为  07-11 12 :59
		 */
		public static function GetWalletLogDate2( secondTime :int ):String
		{
			var date :Date = new Date( secondTime * 1000 );
			return GetDoubleNumStr( date.getMonth() + 1 ) + '-' + GetDoubleNumStr( date.getDate() ) + ' ' + GetDoubleNumStr( date.getHours() ) + ':' + GetDoubleNumStr( date.getMinutes() );
		}
		public static function GetDoubleNumStr( num :int ):String
		{
			if( num < 10 )
				return '0' + num;
			return num.toString();
		}
		

		/**
		 * 显示如期时间（2015年4月21日 16 :46 :30）
		 * @param ms 时间（毫秒）
		 * @param showType 显示类型（0x111111 [年月日时分秒]）
		 * @param showZero 显示0
		 * @param showToday 显示今天
		 * @return 
		 */		
		public static function GetDateTime( ms :Number, showType :uint, showZero :Boolean = false, showToday :Boolean = false ):String
		{
			
			var date :Date = new Date();
			date.setTime( ms );
			var str :String = "";
			
			if ( showToday && IsToday( date ) )
			{
				str += DateLang.TODAY;
			}
			else
			{
				if ( ( showType & 0x100000 ) == 0x100000 )
					str += date.getFullYear() + DateLang.YEAR;
				
				if ( ( showType & 0x010000 ) == 0x010000 )
					str += ( date.getMonth() + 1 ) + DateLang.MONTN;
				
				if ( ( showType & 0x001000 ) == 0x001000 )
					str += date.getDate() + DateLang.DATE;
			}
			
			var subStr :String = "";
			var tmp :String;
			if ( ( showType & 0x000100 ) == 0x000100 )
			{
				tmp = date.getHours().toString();
				if ( showZero && tmp.length == 1 )
					subStr += "0";
				
				subStr += tmp;
			}
			
			if ( ( showType & 0x000010 ) == 0x000010 )
			{
				if ( subStr.length > 0 )
					subStr += " :";
				
				tmp = date.getMinutes().toString();
				if ( showZero && tmp.length == 1 )
					subStr += "0";
				
				subStr += tmp;
			}
			
			if ( ( showType & 0x000001 ) == 0x000001 )
			{
				if ( subStr.length > 0 )
					subStr += " :";
				
				tmp = date.getSeconds().toString();
				if ( showZero && tmp.length == 1 )
					subStr += "0";
				
				subStr += tmp;
			}
			
			if ( subStr.length > 0 )
				str += ( " " + subStr );
			
			return str;
		}
		
		/** 是不是今天*/
		public static function IsToday( date :Date ):Boolean
		{
			var today :Date = new Date();
			return today.fullYear == date.fullYear && today.month == date.month && today.date == date.date;
		}
		
		/** 是不是明天*/
		public static function IsTomorrow( date :Date ):Boolean
		{
			var last :Date = new Date();
			last.setTime( date.time - 86400000 );
			
			var today :Date = new Date();
			
			return today.fullYear == last.fullYear && today.month == last.month && today.date == last.date;
		}
		
		/**
		 * 显示如期时间（5天1小时46分10秒）
		 * @param ms 时间（秒）
		 * @param showType 显示类型（0x001111 [天时分秒]）
		 * @param showZero 显示0
		 * @param maxn 显示单位最长多少 比如值为2到天了就只显示 XX天XX时
		 * @return 
		 */		
		public static function GetTime( ms :int, showType :uint, showZero :Boolean = false , maxn :int = 4 ):String
		{
			var str :String = "";
			var ti :int;
			
			if ( ( showType & 0x001000 ) == 0x001000 && maxn > 0 )
			{
				ti = ms / ( 24 * 3600 );
				if ( ti > 0 )
				{
					str += ti.toString() + DateLang.DAY;
					maxn--;
				}
			}
			
			if ( ( showType & 0x000100 ) == 0x000100 && maxn > 0 )
			{
				ti = ( ms / 3600 ) % 24;
				if ( ti > 0 || str.length > 0 )
				{
					if ( ti < 9 && showZero )
						str += "0";
					
					str += ti.toString() + DateLang.HOURS;
					maxn--;
				}
			}
			
			if ( ( showType & 0x000010 ) == 0x000010 && maxn > 0 )
			{
				ti = ( ms / 60 ) % 60;
				if ( ti > 0 || str.length > 0 )
				{
					if ( ti < 9 && showZero )
						str += "0";
					
					str += ti.toString() + DateLang.MINUTE;
					maxn--;
				}
			}
			
			if ( ( showType & 0x000001 ) == 0x000001 && maxn > 0 )
			{
				ti = ms % 60;
				if ( ti > 0 || str.length > 0 || ms == 0 )
				{
					if ( ti < 9 && showZero )
						str += "0";
					
					str += ti.toString() + DateLang.SECOND;
					maxn--;
				}
			}
			
			return str;
		}
		
		public static function GetTime2( ms :int, showType :uint, showZero :Boolean = false , maxn :int = 4 ):Array
		{
			var ret:Array=["00","00"];
			var str :String = "";
			var ti :int;
			
			if ( ( showType & 0x001000 ) == 0x001000 && maxn > 0 )
			{
				ti = ms / ( 24 * 3600 );
				if ( ti > 0 )
				{
					str += ti.toString() + DateLang.DAY;
					maxn--;
				}
			}
			
			if ( ( showType & 0x000100 ) == 0x000100 && maxn > 0 )
			{
				ti = ( ms / 3600 ) % 24;
				if ( ti > 0 || str.length > 0 )
				{
					if ( ti < 9 && showZero )
						str += "0";
					
					str += ti.toString() + DateLang.HOURS;
					maxn--;
				}
			}
			
			if ( ( showType & 0x000010 ) == 0x000010 && maxn > 0 )
			{
				ti = ( ms / 60 ) % 60;
				if ( ti > 0 || str.length > 0 )
				{
					var isAddZero:Boolean;
					if ( ti < 9 && showZero ){
						str += "0";
						isAddZero = true;
					}
					str += ti.toString() + DateLang.MINUTE;
					ret[0] = isAddZero?("0"+ti):ti.toString();
					maxn--;
				}
			}
			
			if ( ( showType & 0x000001 ) == 0x000001 && maxn > 0 )
			{
				ti = ms % 60;
				if ( ti > 0 || str.length > 0 || ms == 0 )
				{
					var isAddZero2:Boolean;
					if ( ti < 9 && showZero ){
						str += "0";
						isAddZero2 = true;
					}
					str += ti.toString() + DateLang.SECOND;
					ret[1] = isAddZero2?("0"+ti):ti.toString();
					maxn--;
				}
			}
			
			return ret;
		}
		

		/**
		 * 得到数字小数点后指定有效位数数字符串
		 * @param num
		 * @param validCount
		 */		
		public static function GetValidNumberStr( num :Number , validCount :int = 2 ):String
		{
			var str :String = num.toPrecision( 21 )
			var len :int = str.length;
			var count :int = 0;
			var start :Boolean = false;
			var subIndex :int = -1;
			var pointIdex :int = str.indexOf( "." ) 
			if( pointIdex != -1 && ( pointIdex + 1 ) < len )
			{
				for ( var i :int = pointIdex+1; i < len; i++ ) 
				{
					if( str.charAt( i ) != "0" )
					{
						start = true;
					}
					if( start )
					{
						count ++;
						if( count >= validCount ) 
						{
							subIndex = i;
							break;
						}
					}
				}
			}
			if( subIndex != -1 )
				str = str.substr( 0 , subIndex + 1 );
			len = str.length;
			while( str.length > 1 )
			{
				if( str.charAt( str.length-1 ) == "0" )
					str = str.substr( 0 , str.length -1 );
				else
					break;
			}
			return str;
		}
		
		public static function GetNumberStr( num :Number , afterPointNum :int = 2 ):String
		{
			var tnum:Number = Math.ceil( num );
			if(tnum != num)
			{
				var numStr:String = num.toFixed(afterPointNum);
				var lastChar:String = "";
				var b:Boolean = false;
				do
				{
					lastChar = numStr.charAt( numStr.length -1);
					if(lastChar == "0" || lastChar == ".")
					{
						b = true;
						numStr = numStr.slice(0,numStr.length - 1);
					}
					else
					{
						b = false;
					}
				}while( b );
				return numStr;
			}
			return num.toString();
		}
		

		
		/**
		 * 转成时间（5天1小时46分10秒）
		 * @param ms 时间（秒）
		 * @param showZero 显示0
		 * @return 
		 */
		public static function SecondToDHMS( sec :int, showZero :Boolean = false ):String
		{
			return GetTime( sec, 0x001111, showZero );
		}
		
		/**
		 * 秒转成时间（5天1小时46分）
		 * @param ms 时间（秒）
		 * @param showZero 显示0
		 * @return 
		 */
		public static function SecondToDHM( sec :int, showZero :Boolean = false ):String
		{
			return GetTime( sec, 0x001110, showZero );
		}
		
		/**
		 * 秒转成时间（1小时46分）
		 * @param ms 时间（秒）
		 * @param showZero 显示0
		 * @return 
		 */
		public static function SecondToHM( sec :int, showZero :Boolean = false ):String
		{
			return GetTime( sec, 0x000110, showZero );
		}
		
		/**
		 * 秒转成 时分秒
		 * @param s
		 * @param egZero 忽略0值
		 * @param negSmall 小的是0不忽略 例如 1分0秒
		 */
		public static function SecondToHMS( s :int, egZero :Boolean = false, negSmall :Boolean = false ):String
		{
			var rs :int = s;
			var d :int = 3600;
			
			var m :int = 60;
			var rd :int = s / d;
			// 剩余秒
			
			rs = rs % d;
			
			var rm :int = rs / m;
			
			var rsecond :int = rs % m;
			
			var re :String = "";
			if ( rd != 0 || egZero == false )
				re += String( rd ) + "小时";
			if ( rm != 0 || egZero == false || rd != 0 )
				re += String( rm ) + "分";
			if ( rsecond != 0 || egZero == false || ( rd != 0 || rm != 0 ) )
				re += String( rsecond ) + "秒";
			
			if ( re == "" )
				re = "0秒";
			return re;
		}
		
		/**
		 * 秒转成 00 :00 :00
		 * @param s 秒
		 */
		public static function SecondToHMS2( s :int, egZero :Boolean = false,nos :Boolean=false , baoliuH :Boolean = false ):String
		{
			var rs :int = s;
			var d :int = 3600;
			
			var m :int = 60;
			var rd :int = s / d;
			// 剩余秒
			
			rs = rs % d;
			
			var rm :int = rs / m;
			
			var rsecond :int = rs % m;
			var re :String = "";
			if ( rd != 0 || egZero == false )
			{
				if( !baoliuH )
					re += GetNumStr( rd, 2 ) + " :";
				else
					re += GetNumStr( rd, rd.toString().length ) + " :";
			}
			if ( rm != 0 || egZero == false )
				re += GetNumStr( rm, 2 );
			//if ( rsecond != 0 || egZero == false )
			if( nos==false )
				re +=  " :" + GetNumStr( rsecond, 2 );
			return re;
		}
		/**
		 * 秒转成 xx :00 :00,如果小时为0，则只显示00：00
		 * @param s 秒
		 */
		public static function SecondToHMS3(s:int):String
		{
			var sec :int = s;
			var hourSec :int = 3600;
			
			var mSec :int = 60;
			var hour :int = sec / hourSec;
			// 剩余秒
			
			var leftsec:int = sec % mSec;
			
			var minit :int = sec / mSec;
			minit=minit%mSec;
			var re:String="";
			if (hour>0) 
			{
				re+=GetNumStr(hour,Math.max(String(hour).length,2))+" :";
			}
			re+=GetNumStr(minit,2)+" :";
			re+=GetNumStr(leftsec,2);
			return re;
		}

		
		/**
		 * 转化秒为 年月日时分秒
		 */
		public static function ChangeSecondToDateStr(seconds:int, type:int = 0,isNewLine:Boolean = false):String
		{
			var milliseconds:Number = seconds * 1000;
			var date:Date = new Date(milliseconds);
			
			return ChangeDateToDateStr(date, type,isNewLine);
		}
		
		/**
		 * 转化秒为 年月日时分秒
		 */
		public static function ChangeDateToDateStr(date:Date, type:int = 0,isNewLine:Boolean=false):String
		{
			var str:String = "";
			
			if (type < 1)
			{
				str += date.getFullYear() + "年";
			}
			if (type < 2)
			{
				str += ( date.getMonth() + 1 ) + "月";
			}
			if (type < 3)
			{
				str += date.getDate() + "日";
				if(isNewLine){
					str +="\n"
				}
				
			}
			
			str += (date.getHours()+100).toString().slice(-2) + ":" + (date.getMinutes()+100).toString().slice(-2);
			
			if (type != 4)   
				str += ":" + date.getSeconds();
			
			return str;
		}
		
		/**
		 * 转化特殊时间描述（现比武岛使用）
		 * 
		 * 1.XX月XX日 周XX  XX:XX
		 * 2.明天  XX:XX
		 * 3.今天  XX:XX
		 * 
		 * @param s
		 * @return 
		 */		
		public static function GetTimeT1( ms :Number ):String
		{
			var str :String = "";
			
			var date :Date = new Date();
			date.setTime( ms );
			
			if ( IsToday( date ) )
			{
				str += DateLang.TODAY;
			}
			else if ( IsTomorrow( date ) )
			{
				str += DateLang.TOMORROW;
			}
			else
			{
				str += (( date.getMonth() + 1 ) + DateLang.MONTN + date.getDate() + DateLang.DATE);
				str += (" 周" + GetDayToString(date.getDay()));
			}
			
			str += " ";
			
			var tmp :String;
			
			tmp = date.getHours().toString();
			if ( tmp.length == 1 )
				str += "0" + tmp;
			else
				str += tmp;
			
			str += ":";
			
			tmp = date.getMinutes().toString();
			if ( tmp.length == 1 )
				str += "0" + tmp;
			else
				str += tmp;
			
			return str;
		}
		
		
		/**
		 * 转化特殊时间描述（现帮会新鲜事使用）
		 * 
		 * 今天 - 2016/7/9
		 * 2016/7/9
		 * 
		 * @param s
		 * @return 
		 */		
		public static function GetTimeT3( ms :Number ):String
		{
			var str :String = "";
			
			var date :Date = new Date();
			date.setTime( ms );
			
			if ( IsToday( date ) )
				str += DateLang.TODAY + " —— ";;
			
			str += (date.getFullYear() + "/" + date.getMonth() + "/" + date.getDate());
			
			return str;
		}
		
		// ===============================================================================================================================
		// =================================================================================================================== 文本属性
		// ===============================================================================================================================
		/**
		 * 将string转换为bytearray
		 * @param value 文本
		 * @return 返回一个byte数组
		 * @author masefee
		 * 2012-3-20 
		 */		
		public static function ToByteArray( value :String ):ByteArray
		{  
			var byteArr :ByteArray = new ByteArray();  
			byteArr.writeMultiByte( value, "utf8" );
			byteArr.position = 0; 
			return byteArr;  
		}
		
		/** 得到中文本长度( 中文算2个 )*/
		public static function GetTextByteLen( str :String ):int
		{
			var ba :ByteArray = ToByteArray( str );
			return ba.length;
		}
		
		private static const MAGIC :String = "0000";
		/**
		 * 数字转成字符串 
		 * @param v
		 * @param len
		 * @return 
		 * 
		 */
		public static function GetNumStr( v :int, len :int ):String
		{
			var ret :String = MAGIC + v.toString();
			
			return ret.substr( ret.length - len, len );
		}
		

		
		private static const chineseMapping :Array = ["","一","二","三","四","五","六","七","八","九"];
		private static const chineseLevelMapping :Array = ["","十","百","千"];
		private static const chineseLevel2Mapping :Array = ["","万","亿","兆"];
		private static  const lmNumMappint :Array=["Ⅰ","Ⅱ","Ⅲ","Ⅳ","Ⅴ","Ⅵ","Ⅶ","Ⅷ","Ⅸ","Ⅹ","Ⅺ","Ⅻ"];
		
		public static function ToRomanNumber( n :int ):String
		{
			if ( n<1||n>lmNumMappint.length ) 
			{
				return n.toString();
			}
			return lmNumMappint[n-1];
		}
		
		/**
		 * 转换为汉字数字
		 */		
		public static function ToChineseNumber( n :int ):String
		{
			var result :String = "";
			var level :int = 0;
			while ( n > 0 )
			{
				var v :int = n % 10;
				if ( level % 4 ==0 )
					result = chineseLevel2Mapping[level / 4] + result;
				
				if ( v > 0 )
				{
					if ( level % 4 == 1 && v == 1 ){
						result = chineseLevelMapping[level % 4] + result;
					}else{
						result = chineseMapping[v] + chineseLevelMapping[level % 4] + result;
					}
				}
				else
				{
					result = chineseMapping[v] + result;
				}
				n = n / 10;
				level++;
			}
			
			return result;
		}
		
		/** Date.getDay转换为中文字符*/
		public static function GetDayToString( val :int ):String
		{
			if ( val == 0 )
			{
				return DateLang.DATE;
			}
			else
			{
				return chineseMapping[val];
			}
		}
		
		/**
		 * 数字转换为不超过4位数字至多以万为单位字符串
		 */
		public static function FormatLimit4Dig( num :int, nocomma :Boolean = false ):String
		{
			if ( num < 10000 )
			{
				return nocomma?num.toString():FormatThreeNum( num );
			}
			else
			{
				return ( nocomma?Math.floor( num/10000 ).toString():FormatThreeNum( Math.floor( num/10000 ) ) ) + "万";
			}
		}
		
		/**
		 * 数字转换为三位分节字符串		1,000,000
		 */
		public static function FormatThreeNum( num :int ):String
		{
			var str :String = '';
			var temp :int;
			while( num >= 1000 )
			{
				temp = num % 1000;
				num /= 1000;
				str = ','.concat( GetNumStr( temp, 3 ) ).concat( str );
			}
			str = num.toString().concat( str );
			return str;
		}
		
		public static function ConectParam( html :String, param :Array ):String
		{
			if ( param == null )
				return html;
			
			if ( html == null )
				return null;
			
			if ( html.indexOf( '{@}' ) == -1 )
			{
				for ( var i : int = 0; i < param.length; i++ ) 
				{
					html = html.replace( "{" + i + "}", param[i] );
				}
			}
			else
			{
				for ( i = 0; i < param.length; i++ ) 
				{
					html = html.replace( "{@}", param[i] );
				}
			}
			
			return html;
		}
		/**获取指定字节长度的字符串：英文字符一个字节，中文字符两个字节 */
		public static function sliceToBytelen(name:String,length:int):String
		{
			var str:String="";
			var sliceStr:String="";
			if(name!=""&&length>0)
			{
				for(var i:int=1;i<=name.length;i++)
				{
					sliceStr=name.slice(0,i);
					if(getByteLen(sliceStr)>length)
					{
						return str;
					}
					str=sliceStr;
				}
			}
			return str
		}
		public static function getByteLen(str:String ):int
		{
			var len:int=0;
			if(str!=null&&str!=""){
				var ba:ByteArray =new ByteArray;
				ba.writeMultiByte (str,"");
				len = ba.length;
			}
			return len;
		}
    }
}