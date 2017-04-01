package com.game.engine2D.core
{
	import com.game.engine2D.config.GlobalConfig2D;
	import com.game.engine3D.manager.Stage3DLayerManager;
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	import away3d.arcane;
	import away3d.core.managers.Stage3DProxy;
	import away3d.premium.ImageAreaAvgScale;
	import away3d.textures.ATFData;
	import away3d.textures.BGRAData;
	import away3d.textures.BPGData;
	import away3d.textures.Texture2DBase;
	
	import worker.CustomMainToWorker;
	import worker.parser.WorkerProtocol;
	
	use namespace arcane;
	
	/**
	 * BPG资源异步解析 
	 * @author guoqing.wen
	 * 
	 */
	public class BPGByteTexture extends Texture2DBase
	{
		/** 释放显存及销毁，不会在使用 */
		private var _isDispose:Boolean = false;
		private var _atfData:ATFData;
		private var _bgraData:BGRAData;
		private var _isParseBgraData:Boolean;
		private var _bpgTextureScale:Boolean;
		private var _bpgTextureScaleValue:Number = 1.0;
		private var _enableTextureScale:Boolean;
		private var _bpgData:BPGData;
		private var _path:String;
		private var _bpgTag:int = 0;
		
		public function BPGByteTexture(byteArray:ByteArray, path:String = null, enableScaleTexture:Boolean = true,autoRecycleEnable:Boolean = true)
		{
			super();
			_path = path;
			_enableTextureScale = enableScaleTexture;
			_bpgData = new BPGData(byteArray);
			parseBpg2Bgra(_bpgData);
			this.autoRecycleEnable = autoRecycleEnable;
			this.autoRecycleDataEnable = false;
		}
		
		private function parseBpg2Bgra(bpgData:BPGData):void
		{
			_isParseBgraData = true;
			_bpgTextureScale = false;
			if (_enableTextureScale && GlobalConfig2D.avatarBpgResScale)
			{
				var proxy:Stage3DProxy = Stage3DLayerManager.stage3DProxy;
				var totalMemory:int = proxy.textureMemory2D + proxy.textureMemory3D;
				var scaleMemory:int = GlobalConfig2D.avatarBpgResScaleMemory;
				if (totalMemory + scaleMemory >= proxy.maxTextureMemory)
				{
					_bpgTextureScale = bpgData.width > 64 && bpgData.height > 64;
					_bpgTextureScaleValue = GlobalConfig2D.avatarBpgResScaleValue;
				}
			}
			_smooth = _bpgTextureScale;
			_width = _bpgTextureScale ? bpgData.width/_bpgTextureScaleValue : bpgData.width;
			_height = _bpgTextureScale ? bpgData.height/_bpgTextureScaleValue : bpgData.height;
			_bpgTag = CustomMainToWorker.getInstance().sendData(
				WorkerProtocol.MW_BPGFile2BgraBmdBytes, 
				bpgData.data, 
				bgp2BgraByteCompelte
			);
		}
		
		private function bgp2BgraByteCompelte(cmd:int, tag:int, bytes:ByteArray, releaseTime:int):void
		{
			_isParseBgraData = false;
			if (_isDispose)
			{
				bytes.clear();
			}
			else
			{
				if (_bpgTextureScale)
				{
					var w:Number = _bpgData.width, h:Number = _bpgData.height;
					var halfW:Number = w/_bpgTextureScaleValue,halfH:Number = h/_bpgTextureScaleValue;
					var scaleBytes:ByteArray = new ByteArray();
					scaleBytes.endian = Endian.LITTLE_ENDIAN;
					ImageAreaAvgScale.scaleToByteArray(bytes,w,h,halfW,halfH,scaleBytes);
					scaleBytes.position = 0;
					bytes.clear();
					_bgraData = new BGRAData(scaleBytes,halfW, halfH, _bpgData.hasAlpha);
				}
				else
				{
					_bgraData = new BGRAData(bytes,_bpgData.width, _bpgData.height, _bpgData.hasAlpha);
				}
				_compressed = true;
				_hasAlpha = _bgraData.hasAlpha;
				_hasMipmaps = false;
				this.textureData = _bgraData;
				if (!_bpgTextureScale)
				{
					parseBgra2Atf(_bgraData);
				}
				if (this.hasEventListener(Event.COMPLETE)){
					this.dispatchEventWith(Event.COMPLETE);
				}
			}
			if (_bpgData)_bpgData.data.clear();
			_bpgData = null;
		}
		
		private function parseBgra2Atf(bpgData:BGRAData):void
		{
			_bpgTag = CustomMainToWorker.getInstance().sendData(
				WorkerProtocol.MW_BgraBmdBytes2ATF, 
				bpgData.bgraBytes, 
				bgra2AtfByteCompelte
			);
		}
		
		private function bgra2AtfByteCompelte(cmd:int, tag:int, atfBytes:ByteArray, releaseTime:int):void
		{
			_bpgTag = 0;
			if (_isDispose){
				atfBytes.clear();
			}
			else{
				var data:ATFByteData = new ATFByteData(atfBytes);
				data.isAsync = false;
				this.atfData = data;
			}
			if(_bgraData)_bgraData.dispose();
			_bgraData = null;
		}
		
		public function get atfData():ATFData
		{
			return _atfData;
		}
		
		public function set atfData(value:ATFData):void
		{
			_atfData = value;
			_compressed = _atfData.compressed;
			_hasAlpha = _atfData.hasAlpha;
			_hasMipmaps = _atfData.numTextures > 1;
			this.textureData = _atfData;
		}
		
		public function get isParseBgraData():Boolean
		{
			return _isParseBgraData;
		}
		
		public function get isTextureScale():Boolean
		{
			return _bpgTextureScale;
		}
		
		public function get textureScale():Number
		{
			return _bpgTextureScaleValue;
		}
		
		override public function dispose():void
		{
			_isDispose = true;
			if (_bpgTag != 0)
				CustomMainToWorker.getInstance().removeTaskByTag(_bpgTag);
			_bpgTag = 0;
			if (_atfData)_atfData.dispose();
			_atfData = null;
			if (_bgraData)_bgraData.dispose();
			_bgraData = null;
			if (_bpgData)_bpgData.data.clear();
			_bpgData = null;
			super.dispose();
		}
	}
}