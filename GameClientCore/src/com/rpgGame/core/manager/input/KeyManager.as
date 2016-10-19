package com.rpgGame.core.manager.input
{
	import com.game.mainCore.core.utils.StringConstants;
	import com.rpgGame.coreData.cfg.KeyCodeXMLInfo;
	import com.rpgGame.coreData.info.key.KeyInfo;
	import com.rpgGame.coreData.info.key.MulitKeyInfo;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import org.client.mainCore.ds.HashMap;
	
	/**
	 * 键位配置（用户设置后的键位，如果没有设置的会选用默认键位）
	 * @author carver
	 *
	 */
	public class KeyManager
	{
		/** 单键HashMap **/
		private static var _singleHash:HashMap = new HashMap();
		/** 组合键HashMap **/
		private static var _mixHash:HashMap = new HashMap();
		/** 顺序键HashMap **/
		private static var _orderHash:HashMap = new HashMap();
		
		private static var _evtDispatcher:EventDispatcher = new EventDispatcher();
		
		public static function reset():void
		{
			_singleHash = KeyCodeXMLInfo.cloneSingleHash();
			_mixHash = KeyCodeXMLInfo.cloneMixHash();
			_orderHash = KeyCodeXMLInfo.cloneOrderHash();
		}
		reset();
		/**
		 * 获取单键位对应的操作ID
		 * @param key
		 * @return
		 *
		 */
		public static function getSingleInfo(key:uint):KeyInfo
		{
			var info:KeyInfo = _singleHash.getValue(key);
			if(info)
			{
				return info;
			}
			return null;
		}

		/**
		 * 获取组合键对应的操作ID
		 * @param key
		 * @return
		 *
		 */
		public static function getMixInfo(keyList:Vector.<uint>):MulitKeyInfo
		{
			var funcs:Array = [];
			var kInfo:KeyInfo;
			keyList.forEach(function(keyCode:uint,index:int,array:Vector.<uint>):void
				{
					kInfo = _singleHash.getValue(keyCode);
					if(kInfo)
					{
						funcs.push(kInfo.funcID);
					}
				});
			funcs.sort(Array.NUMERIC);
			return _mixHash.getValue(funcs.join(StringConstants.SIGN));
		}

		/**
		 * 获取顺序键对应的操作ID
		 * @param key
		 * @return
		 *
		 */
		public static function getOrderInfo(keyList:Vector.<uint>):MulitKeyInfo
		{
			var funcs:Array = [];
			var kInfo:KeyInfo;
			keyList.forEach(function(keyCode:uint,index:int,array:Vector.<uint>):void
				{
					kInfo = _singleHash.getValue(keyCode);
					if(kInfo)
					{  
						funcs.push(kInfo.funcID);
					}
				});
			return _orderHash.getValue(funcs.join(StringConstants.SIGN));
		}

		/**
		 * 设置单键对应的操作ID
		 * @param key
		 * @param funcID
		 *
		 */
		public static function setSingleKey(keyCode:uint,info:KeyInfo):void
		{
			if(KeyCodeXMLInfo.isLegal(keyCode))
			{
				_singleHash.add(keyCode,info.clone());
			}
		}

		public static function getSingleInfoForFuncID(funcID:uint):KeyInfo
		{
			var info:KeyInfo;
			_singleHash.some(function(key:uint,value:KeyInfo):Boolean
				{
					if(value.funcID == funcID)
					{
						info = value;
						return true;
					}
					return false;
				});
			return info;
		}

		public static function getMixInfoForFuncID(funcID:String):MulitKeyInfo
		{
			var info:MulitKeyInfo;
			_mixHash.some(function(key:uint,value:MulitKeyInfo):Boolean
				{
					if(value.funcID == funcID)
					{
						info = value;
						return true;
					}
					return false;
				});
			return info;
		}

		public static function getOrderInfoForFuncID(funcID:String):MulitKeyInfo
		{
			var info:MulitKeyInfo;
			_orderHash.some(function(key:uint,value:MulitKeyInfo):Boolean
				{
					if(value.funcID == funcID)
					{
						info = value;
						return true;
					}
					return false;
				});
			return info;
		}

		private static function dispatchEvent(evtType:String):void
		{
			_evtDispatcher.dispatchEvent(new Event(evtType));
		}
		
		public static function addEventListener(evtType:String, listener:Function):void
		{
			_evtDispatcher.addEventListener(evtType, listener);
		}
		
		public static function removeEventListener(evtType:String, listener:Function):void
		{
			_evtDispatcher.removeEventListener(evtType, listener);
		}
		
	/**
	 * 设置组合键对应的操作ID
	 * @param keyList
	 * @param funcID
	 *
	 */ /* public static function setMixKey(keyList:Array,funcID:uint):void
	   {
	   keyList.sort(Array.NUMERIC);
	 } */
	}
}