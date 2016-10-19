package com.client.loader
{
	public class XMLFileInfo
	{
		public var name:String;
		public var path:String;
		public var size:uint;
		public var isCompress:Boolean = false;
		public var data:XML;
		public var completeFun:Function;
		
		public function XMLFileInfo(name:String = "",path:String = "",completeFun:Function = null)
		{
			this.name = name;
			this.path = path;
			this.completeFun = completeFun;
		}
	}
}