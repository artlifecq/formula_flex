package com.rpgGame.app.manager
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.sender.HeroMiscSender;
	import com.rpgGame.coreData.enum.EnumCustomTagType;
	
	public class SystemSetManager
	{		
		private static var gameSetObj:Object;
		
		/**生命值按钮选中*/
		private static var _hpSelect:Boolean=false;
		/**生命值百分比*/
		private static var _hpValue:int=85;
		/**自动购买按钮选中*/
		private static var _lifeSelect:Boolean=false;
		/**攻击距离*/
		private static var _hookValue:int=10;
		/**自动拾取所有按钮选中（与拾取互斥）*/
		private static var _autoSelect:Boolean=false;
		/**拾取按钮选中（与自动拾取互斥）*/
		private static var _pickUpSelect:Boolean=false;
		/**拾取职业*/
		private static var _job:int=0;
		/**拾取品质*/
		private static var _quality:int=0;
		/**自动原地复活*/
		private static var _autoResurrection:Boolean=false;
		
		public static function initData(dataStr:String):void
		{
			gameSetObj=JSONUtil.decode(dataStr)[0];
			
			if(gameSetObj!=null)
			{
				hpSelect=gameSetObj.guajiset.hpSelect;
				hpValue=gameSetObj.guajiset.hpValue;
				lifeSelect=gameSetObj.guajiset.lifeSelect;
				hookValue=gameSetObj.guajiset.hookValue;
				autoSelect=gameSetObj.guajiset.autoSelect;
				pickUpSelect=gameSetObj.guajiset.pickUpSelect;
				job=gameSetObj.guajiset.job;
				quality=gameSetObj.guajiset.quality;
				autoResurrection=gameSetObj.guajiset.autoResurrection;
			}
		}
		
		public static function set hpSelect(bool:Boolean):void
		{
			_hpSelect=bool;
		}
		
		public static function get hpSelect():Boolean
		{
			return _hpSelect;
		}
		
		public static function set hpValue(value:int):void
		{
			_hpValue=value;
		}
		
		public static function get hpValue():int
		{
			return _hpValue;
		}
		
		public static function set lifeSelect(bool:Boolean):void
		{
			_lifeSelect=bool;
		}
		
		public static function get lifeSelect():Boolean
		{
			return _lifeSelect;
		}
		
		public static function set hookValue(value:int):void
		{
			_hookValue=value;
		}
		
		public static function get hookValue():int
		{
			return _hookValue;
		}
			
		public static function set autoSelect(bool:Boolean):void
		{
			_autoSelect=bool;
		}
		
		public static function get autoSelect():Boolean
		{
			return _autoSelect;
		}
				
		public static function set pickUpSelect(bool:Boolean):void
		{
			_pickUpSelect=bool;
		}
		
		public static function get pickUpSelect():Boolean
		{
			return _pickUpSelect;
		}	
		
		public static function set job(value:int):void
		{
			_job=value;
		}
		
		public static function get job():int
		{
			return _job;
		}
		
		public static function set quality(value:int):void
		{
			_quality=value;
		}
		
		public static function get quality():int
		{
			return _quality;
		}
		
		public static function set autoResurrection(bool:Boolean):void
		{
			_autoResurrection=bool;
		}
		
		public static function get autoResurrection():Boolean
		{
			return _autoResurrection;
		}
		
		public static function saveData():void
		{
			var nowValue:String = getAllValueToString();
			HeroMiscSender.reqSetClientCustomTag(EnumCustomTagType.SYSTEM_GUAJI_SET , nowValue);
		}
		
		private static function getAllValueToString():String
		{
			var value:String;		
			var data:Array=[];
			data.push({guajiset:{hpSelect:hpSelect,hpValue:hpValue,lifeSelect:lifeSelect,
				hookValue:hookValue,autoSelect:autoSelect,pickUpSelect:pickUpSelect,
				job:job,quality:quality,autoResurrection:autoResurrection}});
			value=JSONUtil.encode(data);
			return value;
		}
	}
}