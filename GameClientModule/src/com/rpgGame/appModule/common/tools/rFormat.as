package com.rpgGame.appModule.common.tools
{
	

	/**
	 * 用于格式化相关字符串
	 * @author masefee
	 * 2012-2-18 
	 */	
	public class rFormat
	{
		/** 用于去除指定html标签的表达式 **/
		private static const HTML_PATTERN:String = "<\/?.*?[^>]>";
		/** 用于去除指定html标签的表达式对象 **/
		private static const HTML_REG:RegExp = new RegExp( HTML_PATTERN, "gx" );
		/** 字符串格式化0填充，用于提高性能，总共20个 **/
		private static var fill_zeros:Array = [ 
			"",
			"0",
			"00",
			"000",
			"0000",
			"00000",
			"000000",
			"0000000",
			"00000000",
			"000000000",
			"0000000000",
			"00000000000",
			"000000000000",
			"0000000000000",
			"00000000000000",
			"000000000000000",
			"0000000000000000",
			"00000000000000000",
			"000000000000000000",
			"0000000000000000000",
		]
		
		/** 字符串格式化空格填充，用于提高性能，总共32个 **/
		public static var fill_spaces:Array = [ 
			"", 
			" ", 
			"  ", 
			"   ", 
			"    ", 
			"     ", 
			"      ", 
			"       ", 
			"        ",
			"         ",
			"          ",
			"           ",
			"            ",
			"             ",
			"              ",
			"               ",
			"                ",
			"                 ",
			"                  ",
			"                   ",
			"                    ",
			"                     ",
			"                      ",
			"                       ",
			"                        ",
			"                         ",
			"                          ",
			"                           ",
			"                            ",
			"                             ",
			"                              ",
			"                               ",
		]

		/**
		 * 格式化字符串，用于指定字符宽度格式化，为了提高性能，本函数不会检测参数列表的下标范围
		 * sscanf( "你好{5}，你今年有{3}岁吗？", "小花", 20 );<br>
		 *          结果为："你好小花 ，你今年有20 岁吗？"。 [其中含有空格]<br>
		 * sscanf( "你好{5}，你的生日是{02}月{02}日吗？", "小花", 1, 2 );<br>
		 *          结果为："你好小花 ，你的生日是01月02日吗？"。 [其中以0补齐]<br>
		 * @param format 格式化串, {2}中的2表示字符总宽度
		 * @param args 要格式化的参数列表
		 * @return 格式化之后的字符串
		 * @author masefee
		 */		
		public static function sscanf( format:String, ...args ):String
		{
			var format_str:String = "";
			var argIdx:int = 0;
			while ( true )
			{
				var findIdx:int = format.search( "\\{(-?\\d*)\\}" );
				if ( findIdx == -1 )
				{
					format_str += format;
					break;
				}
				
				format_str += format.substr( 0, findIdx );
				format = format.substr( findIdx );
				
				var tail_idx:int = format.search( "}" );
				var num_str:String = format.substr( 1, tail_idx - 1 );
				var field:int = int( num_str );
				var field_abs:int = Math.abs( field );
				var fill_zero:Boolean = ( num_str.charAt( ( field == field_abs ) ? 0 : 1 ) == "0" );
				var fill_str:String = fill_zero ? "0" : " ";
				var fill_arr:Array = fill_zero ? fill_zeros : fill_spaces; 
				var fill_cnt:uint = 0;
				var arg:String = String( args[ argIdx++ ] );
				var charcnt:int = StringTool.getCharCount( remove_html( arg ) );
				var occupied:String = "";
				
				if ( field_abs > charcnt )
				{
					fill_cnt = field_abs - charcnt;
					if ( fill_arr == null || fill_cnt >= fill_arr.length )
					{
						while ( fill_cnt-- > 0 )
							occupied += fill_str;
					}
					else
					{
						occupied = fill_arr[ fill_cnt ];
					}
				}
				
				format_str += ( field > 0 && !fill_zero ) ? ( arg + occupied ) : ( occupied + arg ); 
				format = format.substr( tail_idx + 1 );
			}
			return format_str;
		}
		
		/**
		 * 去除html标签
		 * @param src 源字符串
		 * @return 去除html标签后的字符串
		 * @author masefee
		 * 2012-3-7
		 */		
		public static function remove_html( src:String ):String
		{
			var nohtmlstr:String = src.replace( HTML_REG, "" );
			return nohtmlstr
		}
		
		/**
		 * 连接字符串
		 * @param args
		 * @author 容广杰 2013-9-12
		 */	
		public static function joint( ...args ):String
		{
			return args.join("");
		}
	}
}