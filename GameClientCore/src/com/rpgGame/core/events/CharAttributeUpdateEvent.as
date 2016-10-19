package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;
	
	import flash.events.Event;
	
	
	public class CharAttributeUpdateEvent extends Event
	{
		private static const CHAR_ATTRI_EVENT_TYPE:int = UNIQUEID.NEXT;
		
		private var _charID:Number;
		private var _attrType:uint;
		private var _attrValue:*;
		
		public function CharAttributeUpdateEvent($charID:Number,$attrType:int, $value:*)
		{
			var eventType:String = getAttriUpdateEvtType($charID,$attrType);
			super(eventType);
			_charID = $charID;
			_attrType = $attrType;
			_attrValue = $value;
		}
		
		public static function getAttriUpdateEvtType($charID:Number,$attrType:int):String
		{
			return $charID+"_"+ String(CHAR_ATTRI_EVENT_TYPE)+"_"+$attrType;
		}
		
		public function get charID():Number
		{
			return _charID;
		}

		public function get attrType():uint
		{
			return _attrType;
		}

		public function get attrValue():*
		{
			return _attrValue;
		}
	}
}