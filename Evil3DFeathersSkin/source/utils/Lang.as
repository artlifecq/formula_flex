package utils
{
	import flash.events.Event;
	import flash.net.URLLoaderDataFormat;
	import flash.utils.ByteArray;
	
	import away3d.loaders.multi.MultiLoadData;
	import away3d.loaders.multi.MultiUrlLoadManager;
	
	/**
	 * 国际化语言管理 
	 * @author wewell
	 */	
	public class Lang
	{
		private static const PRE_WORD:String = "$";
		private static var reader:Object;
		private static var complete:Function;
		
		public static function loadFile(url:String, onComplete:Function=null):void
		{
			if(!url)
			{
				throw new Error("Lang loadFile url Error: url is  null");
				return;
			}
			complete = onComplete;
			 var ld:MultiLoadData = new MultiLoadData(url, onInfLoad, null, null, "","",100000, URLLoaderDataFormat.BINARY);
			MultiUrlLoadManager.load(ld);
		}
		
		public static function setLangData(bytes:ByteArray):void
		{
			try
			{
				bytes.position = 0;
				bytes.uncompress();
				reader = bytes.readObject();
			} 
			catch(error:Error) 
			{
				throw new Error("Lang  Error! invalid AMF3 Compressed byteArray!" );
			}
			if(complete != null)complete();
		}
		
		private static function onInfLoad(ld : MultiLoadData, event : flash.events.Event) : void
		{
			setLangData( (event.currentTarget).data);
		}
		
		public static function tr(id:String):String{
			if (reader && id in reader)
			{
				var words:String = reader[id];
				return  words == PRE_WORD ? id : words;
			}
			return id;
		}
		
	}
}