package com.game.engine2D.core
{
	import flash.utils.ByteArray;
	
	/**
	 * 资源包 
	 * @author guoqing.wen
	 * 
	 */
	public class TexturePack
	{
		public var path:String;
		public var atfDataArr:Vector.<ByteArray>;
		public var dataBytes:ByteArray;
		public var hinderBytes:ByteArray;
		public var enableScaleTexture:Boolean;
		public var autoRecycleEnable:Boolean;
		public var isAsync:Boolean;
		private var config:Object;
		
		public function TexturePack()
		{
		}
		
		public function setConfig(path:String, config:Object, dataByte:ByteArray, hinderByte:ByteArray):void
		{
			this.path = path;
			this.config = config;
			this.dataBytes = dataByte;
			this.hinderBytes = hinderByte;
		}
		
		public function get texturesConfig():Object
		{
			return this.config.data.textures;
		}
		
		public function get hinderHitSize():uint
		{
			return this.config.data.meta.hitSize;
		}
		
		public function addAtfData(atfData:ByteArray):void
		{
			if (atfDataArr == null)
			{
				atfDataArr = new Vector.<ByteArray>();
			}
			atfDataArr.push(atfData);
		}
		
		public function clearData():void
		{
			if (this.dataBytes)
			{
				this.dataBytes.clear();
			}
			this.dataBytes = null;
		}
		
		public function clearAtfData():void
		{
			if (this.atfDataArr)
			{
				for (var i:int = atfDataArr.length - 1; i >= 0 ; i--) 
				{
					this.atfDataArr[i].clear();
				}
			}
			this.atfDataArr = null;
		}
		
		public function dispose():void
		{
			clearAtfData();
			clearData();
			if (hinderBytes)
			{
				hinderBytes.clear();
			}
			config = null;
		}
	}
}