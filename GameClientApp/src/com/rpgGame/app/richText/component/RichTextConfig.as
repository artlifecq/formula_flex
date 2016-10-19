package com.rpgGame.app.richText.component
{
	
	
	

	/**
	 * 富文本配置
	 * @author GuoDong.Zhang
	 * 
	 */
	public class RichTextConfig
	{
		/** 
		 * 富文本单元的起始符
		 * 富文本单元的数据结构为：ω0:type;1:res;2;label;3:labelColor;4:linkType;5:linkDataω
		 * 以上代码由getCode、getTextLinkCode函数生成，不要自己拼写
		 */
		public static const SEPARATOR : String = "ω";
		/**特殊数据匹配正则表达式*/
		private static const SPECIAL_INFO_REGEXP:RegExp = /ω.*?ω/g;
		
		/**
		 * 代码中各个属性的key名
		 */
		private static const KEY_UNIT_TYPE:String = "0";
		private static const KEY_RES:String = "1";
		private static const KEY_LABEL:String = "2";
		private static const KEY_LABEL_COLOR:String = "3";
		private static const KEY_LINK_TYPE:String = "4";
		private static const KEY_LINK_DATA:String = "5";
		private static const KEY_OFFSET_Y:String = "6";
		
		/**
		 * 获取富文本对象代码
		 * @param unitType 由RichTextCustomUnitType枚举
		 * @param res 对应的富文本单元的资源名称
		 * @param label 显示的标签名
		 * @param labelColor 显示的标签颜色
		 * @param linkType 链接的数据类型
		 * @param linkData 链接的数据
		 * @param offsetY 此单元y坐标偏移量，单位：像素，负数向上，正数向下
		 * @return 
		 * 
		 */
		public static function getCode(unitType:String, res:String, label:String = null, labelColor:Number = -1, linkType:String = null, linkData:String = null, offsetY:int = 0) : String
		{
			var code:String = "ω";
			code += KEY_UNIT_TYPE +":" + unitType;
			if(res != null && res != "")
				code += ";" + KEY_RES + ":" + res;
			
			if(label != null && label != "")
				code += ";" + KEY_LABEL + ":" + label;
			
			if(labelColor  >= 0)
			{
				code += ";" + KEY_LABEL_COLOR + ":" + labelColor.toString();
			}
			
			if(linkType != null && linkType != "")
				code += ";" + KEY_LINK_TYPE + ":" + linkType;
			
			if(linkData != null && linkData != "")
				code += ";" + KEY_LINK_DATA + ":" + linkData;
			
			if(offsetY  != 0)
			{
				code += ";" + KEY_OFFSET_Y + ":" + offsetY.toString();
			}
			
			code += "ω";
			return code;
		}
		
		/**
		 * 把富文本单元的代码替换成普通显示的标签
		 * @param message
		 * @return 
		 * 
		 */
		public static function replaceUnitCodeToLabel(message:String):String
		{
			var keyArr:Array = message.match(SPECIAL_INFO_REGEXP);
			if(keyArr)
			{
				var len:int = keyArr.length;
				for(var i:int = 0; i < len; i++)
				{
					var key:String = keyArr[i];
					var obj:RichTextUnitData = getUnitData(key);
					var label:String = obj.label;
					if(label != null)
					{
						message = message.replace(key,label);
					}
				}
			}
			return message;
		}
		
		/**
		 * 把富文本单元的代码数据转换成一个格式化的数据对象
		 * @param unitCode
		 * @return 
		 * 
		 */
		public static function getUnitData(unitCode:String):RichTextUnitData
		{
			if(unitCode.length < 3 || unitCode.charAt(0) != SEPARATOR || unitCode.charAt(unitCode.length - 1) != SEPARATOR)
			{
				return null;
			}
			var info:String = unitCode.substring(1, unitCode.length - 1);
			var data : RichTextUnitData = new RichTextUnitData();
			data.code = unitCode;
			var arr:Array = info.split(";");
			var len:int = arr.length;
			var key:String = "";
			var value:String;
			var keyValueArr : Array;
			for (var i:int = 0; i < len; i++)
			{
				keyValueArr = String(arr[i]).split(":");
				key = keyValueArr[0];
				value = keyValueArr[1];
				
				if(key == KEY_UNIT_TYPE)
				{
					data.type = value;
				}
				else if(key == KEY_RES)
				{
					data.res = value;
				}
				else if(key == KEY_LABEL)
				{
					data.label = value;
				}
				else if(key == KEY_LABEL_COLOR)
				{
					data.labelColor = parseInt(value);
				}
				else if(key == KEY_LINK_TYPE)
				{
					data.linkType = value;
				}
				else if(key == KEY_LINK_DATA)
				{
					data.linkData = value;
				}
				else if(key == KEY_OFFSET_Y)
				{
					data.offsetY = parseInt(value);
				}
			}
			return data;
		}
		
	}
}
