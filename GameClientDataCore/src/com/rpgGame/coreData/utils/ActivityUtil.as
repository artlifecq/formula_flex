package  com.rpgGame.coreData.utils
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.coreData.info.openActivity.ActivityVo;
	import com.rpgGame.coreData.info.openActivity.EnumCampPanelType;
	
	public class ActivityUtil
	{
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
				str =ConectParam("{0}年{1}月{2}日 ", [ date.getFullYear(), (date.getMonth() + 1), date.getDate() ] );
			else
				str =ConectParam( "{0}月{1}日 ", [ (date.getMonth() + 1), date.getDate() ] );
			
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
				str += ConectParam( "{0}时", [ tmp ] );
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
				str += ConectParam( "{0}时{1}分", [ date.getHours(), date.getMinutes() ] );
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
		 * 判断活动类型是否显示领取标记
		 * */
		public static function needShow( type:int, childType:int = 0 ):Boolean
		{
			//	var showRawardTypeArr:Array = [ 2, 3, 4, 6, 7, 9 ];//要显示活动领奖标签的活动类型
//			if (childType==EnumCampPanelType.SP_37_CLIENT&&!PlatformUtil.platform.isMClinetLogin()) 
//			{
//				return false;
//			}
			return true;
		}
		
		public static function compareSort( a:ActivityVo, b:ActivityVo ):int
		{
			if ( a.activityId < b.activityId )
				return -1;
			else
				return 1;
			
			return 0;
		}
		
		public static function subListSort( a:ActivityVo, b:ActivityVo ):int
		{
		
			
			if ( a.activityId > b.activityId )
				return 1;
			if ( a.activityId < b.activityId )
				return -1;
			
			return 0;
		}
		
		public static function subListSortByID( a:ActivityVo, b:ActivityVo ):int
		{
			if ( a.activityId > b.activityId )
				return 1;
			if ( a.activityId < b.activityId )
				return -1;
			return 0;
		}
		
		public static function parseCampsResData(data:String):Object
		{
			var ret:Object = null;
			if (data == null || data.length < 2)
				return ret;
			
			data = data.replace(/[\f\n\r\t\v]+/g, "");//改下不去掉空格、好支持html格式文本
			
			if (data.charAt(0) == "[" && data.charAt(data.length - 1) == "]")
			{
				data = data.substr(1, data.length - 2);
				
				ret = new Object();
				
				var list:Array = data.split(",");
				for (var i: int = 0; i < list.length; i++)
				{
					var d:Array = (list[i] as String).split(":");
					if (d.length == 2)
					{
						ret[d[0]] = d[1];
					}
				}
			}
			
			return ret;
			
		}
		
		public static function parseCampsResDataForHash(data:String):HashMap
		{
			var ret:HashMap = null;
			if (data == null || data.length < 2)
				return null;
			
			data = data.replace(/\s+/g, "");
			
			if (data.charAt(0) == "[" && data.charAt(data.length - 1) == "]")
			{
				data = data.substr(1, data.length - 2);
				ret = new HashMap();
				
				var list:Array = data.split(",");
				for (var i: int = 0; i < list.length; i++)
				{
					var d:Array = (list[i] as String).split(":");
					if (d.length == 2)
					{
						ret.put(d[0], d[1]);
					}
				}
			}
			
			return ret;
		}
		
		
		public static function isFilterActivity( vos:Vector.<ActivityVo> ):Boolean
		{
			if ( vos == null || vos.length == 0 )
				return true;
			
//			var vo:ActivityVo = vos[0];
//			if (vo.mainPanelType==EnumCampPanelType.M_FIRST_BUY&&vo.status==0) 
//			{
//				return true;
//			}
//			if (vo.mainPanelType==EnumCampPanelType.M_FIRST_BUY_EVERYDAY&&vo.status==0) 
//			{
//				return true;
//			}
			//			else if (vo.mainPanelType==EnumCampPanelType.M_PHONE&&vo.status==1) 
			//			{
			//				return true;
			//			}
			//太长了上面
			return false;
		}
	}
}