package com.client.events
{
	import flash.events.Event;
	
	public class VerEvent extends Event
	{
		public static const SIZE_ERROR:String = "sizeError";
		
		public function VerEvent(type:String)
		{
			super(type);
		}
	}
}