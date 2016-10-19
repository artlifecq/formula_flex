package  com.rpgGame.core.view.uiComponent.face.cd
{
	import flash.events.Event;
	
	public class CDDataEvent extends Event
	{
		public static const START:String = "CDDataEvent.start";
		public static const UPDATE:String = "CDDataEvent.update";
		public static const COMPLETE:String = "CDDataEvent.complete";
		
		private var _cdData:CDData;
		
		public function CDDataEvent(type:String,$cdData:CDData)
		{
			super(type, bubbles, cancelable);
			_cdData = $cdData;
		}

		public function get cdData():CDData
		{
			return _cdData;
		}

	}
}