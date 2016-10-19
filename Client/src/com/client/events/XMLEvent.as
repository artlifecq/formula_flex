package com.client.events
{
	import com.client.loader.XMLFileInfo;
	
	import flash.events.Event;
	
	/**
	 * XMLEvent
	 * @author carver
	 * 
	 */
	public class XMLEvent extends Event
	{
		/**
		 * 所有的加载完成 
		 */		
		public static const ALL_COMPLETE:String = "ALL_XML_COMPLETE";
		/**
		 * 加载完成 
		 */		
		public static const COMPLETE:String = Event.COMPLETE;
		
		private var _data:XMLFileInfo;
			
		public function XMLEvent(type:String,data:XMLFileInfo = null)
		{
			super(type);
			_data = data;
		}
		
		public function get data():XMLFileInfo
		{
			return _data;
		}
	}
}