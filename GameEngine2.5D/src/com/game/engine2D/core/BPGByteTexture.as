package com.game.engine2D.core
{
	import flash.display3D.textures.TextureBase;
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import away3d.core.managers.Stage3DProxy;
	import away3d.textures.ATFData;
	import away3d.textures.BGRAData;
	import away3d.textures.BPGData;
	import away3d.textures.Texture2DBase;
	
	import worker.CustomMainToWorker;
	import worker.parser.WorkerProtocol;
	
	/**
	 * BPG资源异步解析 
	 * @author guoqing.wen
	 * 
	 */
	public class BPGByteTexture extends Texture2DBase
	{
		private var _isReady:Boolean = false;
		private var _bpgTexture:TextureBase;
		/** 紧释放显存，可能还会在使用 */
		private var _isDisposeTexture:Boolean = false;
		/** 释放显存及销毁，不会在使用 */
		private var _isDispose:Boolean = false;
		private var _atfData:ATFData;
		private var _isParseAtfData:Boolean;
		private var _bgraData:BGRAData;
		private var _isParseBgraData:Boolean;
		private var _bpgData:BPGData;
		private var _path:String;
		
		public function BPGByteTexture(byteArray:ByteArray, path:String = null)
		{
			super();
			_path = path;
			parseBpg2Bgra(new BPGData(byteArray));
			this.autoRecycleEnable = true;
			this.autoRecycleDataEnable = false;
		}
		
		private function parseBpg2Bgra(bpgData:BPGData):void
		{
			_isParseBgraData = true;
			_bpgData = bpgData;
			_width = bpgData.width;
			_height = bpgData.height;
			var tag:int = CustomMainToWorker.getInstance().sendData(
				WorkerProtocol.MW_BPGFile2BgraBmdBytes, 
				bpgData.data, 
				bgp2BgraByteCompelte
			);
		}
		
		private function bgp2BgraByteCompelte(cmd:int, tag:int, bytes:ByteArray, releaseTime:int):void
		{
			CONFIG::BPG_Debug {
				trace("parse bpg2Bgra time:",releaseTime, this.width, this.height);
			}
			_isParseBgraData = false;
			if (_isDispose){
				bytes.clear();
			}
			else{
				_bgraData = new BGRAData(bytes,_bpgData.width, _bpgData.height, _bpgData.hasAlpha);
				_compressed = true;
				_hasAlpha = _bgraData.hasAlpha;
				_hasMipmaps = false;
				this.textureData = _bgraData;
				parseBgra2Atf(_bgraData);
				if (this.hasEventListener(Event.COMPLETE)){
					this.dispatchEventWith(Event.COMPLETE);
				}
			}
			if (_bpgData)_bpgData.data.clear();
			_bpgData = null;
		}
		
		private function parseBgra2Atf(bpgData:BGRAData):void
		{
			_isParseAtfData = true;
			var tag:int = CustomMainToWorker.getInstance().sendData(
				WorkerProtocol.MW_BgraBmdBytes2ATF, 
				bpgData.bgraBytes, 
				bgra2AtfByteCompelte
			);
		}
		
		private function bgra2AtfByteCompelte(cmd:int, tag:int, atfBytes:ByteArray, releaseTime:int):void
		{
			CONFIG::BPG_Debug {
				trace("parse bpg2atf time:",releaseTime, this.width, this.height);
			}
			_isParseAtfData = false;
			if (_isDispose){
				if(_bgraData)_bgraData.dispose();
				_bgraData = null;
				atfBytes.clear();
			}
			else{
				var data:ATFByteData = new ATFByteData(atfBytes);
				data.isAsync = false;
				this.atfData = data;
			}
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
		
		public function get isAsync():Boolean
		{
			if (atfData is ATFByteData)
				return ATFByteData(atfData).isAsync;
			return false;
		}
		
		override protected function createTexture(stage3DProxy:Stage3DProxy):TextureBase
		{
			_isDisposeTexture = false;
			if (isAsync)
			{
				_bpgTexture = super.createTexture(stage3DProxy);
				_bpgTexture.addEventListener(Event.TEXTURE_READY, onTextureReady);
				return _bpgTexture;
			}
			return super.createTexture(stage3DProxy);
		}
		
		protected function onTextureReady(event:Event):void
		{
			if (_bpgTexture)
			{
				_bpgTexture.removeEventListener(Event.TEXTURE_READY, onTextureReady);
				_isReady = true;
				if (_isDispose)
				{
					disposeByteTexture();
				}
				else if (_isDisposeTexture)//仅释放显存
				{
					super.invalidateContent();
					_bpgTexture = null;
				}
			}
		}
		
		override protected function uploadContent(texture:TextureBase):void
		{
			_isReady = false;
			super.uploadContent(texture);
		}
		
		/** 仅释放显存 */
		override public function invalidateContent():void
		{
			if (_bpgTexture && isAsync) 
			{
				_isDisposeTexture = !_isReady;
				if (_isReady)
				{
					super.invalidateContent();
					_bpgTexture = null;
				}
			}
			else
			{
				super.invalidateContent();
				_bpgTexture = null;
			}
		}

		public function get isParseBgraData():Boolean
		{
			return _isParseBgraData;
		}
		
		/** 销毁及释放显存 */
		private function disposeByteTexture():void
		{
			if (_atfData)_atfData.dispose();
			_atfData = null;
			if (_bgraData)_bgraData.dispose();
			_bgraData = null;
			_bpgData = null;
			_bpgTexture = null;
			super.dispose();
		}

		override public function dispose():void
		{
			_isDispose = true;
			if (_isReady){
				disposeByteTexture();
			}
			_atfData = null;
		}
	}
}