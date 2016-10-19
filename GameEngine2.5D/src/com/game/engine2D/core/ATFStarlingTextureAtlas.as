package com.game.engine2D.core
{
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	import starling.textures.IStarlingTexture;
	import starling.textures.SubTexture;
	import starling.textures.TextureFactory;
	
	/**
	 * ATFTexture贴图集 
	 * @author guoqing.wen
	 * 
	 */
	public class ATFStarlingTextureAtlas
	{
		static private var count:uint = 0;
		private var _texturePack:TexturePack;
		private var _atlasTextures:Vector.<IStarlingTexture>;
		private var _textureInfos:Dictionary;
		private var _subTextures:Dictionary;
		private var _callTextures:Dictionary;
		private var _texturesFlag:Dictionary;//标识是否dispose 或异步加载完成
		
		/** helper objects */
		private static var sNames:Vector.<String> = new <String>[];
		
		public function ATFStarlingTextureAtlas(pack:TexturePack)
		{
			super();
			_texturePack = pack;
			_atlasTextures = new Vector.<IStarlingTexture>();
			_subTextures = new Dictionary();
			_textureInfos = new Dictionary();
			_callTextures = new Dictionary();
			_texturesFlag = new Dictionary();
			
			//解析配置
			parseAtfData(_texturePack);
			parseAtlasConfig(_texturePack.texturesConfig);
		}
		
		private function parseAtfData(pack:TexturePack):void
		{
			var texture:IStarlingTexture = null;
			var len:int = pack.atfDataArr.length;
			var isAsync:Boolean = false;//是否异步
			
			for (var i:int = 0; i < len; i++) 
			{
				texture = TextureFactory.fromAtfBytes(pack.atfDataArr[i],false);
				_atlasTextures.push(texture);
				_texturesFlag[texture] = !isAsync;
			}
			count += len;
		}
		
		protected function parseAtlasConfig(textureObj:Object):void
		{
			var subTexture:Object;
			
			for (var key:String in textureObj)
			{
				subTexture = textureObj[key];
				if (subTexture)
				{
					addRegion(key, subTexture);
				}
			}
		}
		public function getDataBytes():ByteArray
		{
			if (_texturePack)
			{
				return _texturePack.dataBytes;
			}
			return null;
		}
		
		public function clearDataBytes():void
		{
			if (_texturePack)
			{
				_texturePack.clearData();
			}
		}
		
		/** Retrieves a subtexture by name. Returns <code>null</code> if it is not found. */
		public function getTexture(name:String):ATFStarlingTexture
		{
			var info:TextureInfo = _textureInfos[name];
			
			if (info == null) return null;
			else
			{
				var texture:ATFStarlingTexture = _subTextures[name];
				
				if (texture)
				{
					return texture;
				}
				texture = new ATFStarlingTexture(
					getTextureAtlas(info.textureIndex),  
					info.region,
					_texturePack.hinderBytes, 
					info.hinderStart, 
					_texturePack.hinderHitSize,
					_texturePack.path
				);
				_subTextures[name] = texture;
				
				return texture;
			}
		}
		
		/** Returns all textures that start with a certain string, sorted alphabetically
		 *  (especially useful for "MovieClip"). */
		public function getTextures(prefix:String="", result:Vector.<SubTexture>=null):Vector.<SubTexture>
		{
			if (result == null) result = new <SubTexture>[];
			
			for each (var name:String in getNames(prefix, sNames)) 
			{
				result.push(getTexture(name)); 
			}
			
			sNames.length = 0;
			return result;
		}
		
		/** Returns all texture names that start with a certain string, sorted alphabetically. */
		public function getNames(prefix:String="", result:Vector.<String>=null):Vector.<String>
		{
			if (result == null) result = new <String>[];
			
			for (var name:String in _textureInfos)
				if (name.indexOf(prefix) == 0)
					result.push(name);
			
			result.sort(Array.CASEINSENSITIVE);
			return result;
		}
		
		/** Returns the region rectangle associated with a specific name. */
		public function getRegion(name:String):Rectangle
		{
			var info:TextureInfo = _textureInfos[name];
			return info ? info.region : null;
		}
		
		/** Adds a named region for a subtexture (described by rectangle with coordinates in 
		 *  pixels) with an optional frame. */
		public function addRegion(name:String, data:Object, frame:Rectangle=null,
								  rotated:Boolean=false):void
		{
			_textureInfos[name] = new TextureInfo(data, frame, rotated);
		}
		
		/** Removes a region with a certain name. */
		public function removeRegion(name:String):void
		{
			delete _textureInfos[name];
		}
		
		/** The base texture that makes up the atlas. */
		private function getTextureAtlas(index:uint):IStarlingTexture { return _atlasTextures[index]; }
		
		/** Disposes the atlas texture. */
		public function dispose():void
		{
			if (_texturePack)
			{
				_texturePack.dispose();
			}
			for each (var sub:SubTexture in _subTextures) 
			{
				sub.dispose();
			}
			for each (var texture:IStarlingTexture in _atlasTextures) 
			{
				if (_texturesFlag[texture])//若为true  代表已经异步上传完成  直接调用dispose方法
				{
					texture.dispose();
					delete _texturesFlag[texture];
				}
				else
				{
					_texturesFlag[texture] = true;//否则标识为已经dispose,待异步回调完成 直接dispose
				}
			}
			count -=  _atlasTextures.length;
			if (_atlasTextures)
			{
				_atlasTextures.splice(0, _atlasTextures.length);
			}
			_atlasTextures = null;
			_textureInfos = null;
			_texturePack = null;
			_subTextures = null;
			_callTextures = null;
		}
	}
}
import flash.geom.Rectangle;


class TextureInfo
{
	public var region:Rectangle;
	public var frame:Rectangle;
	public var rotated:Boolean;
	public var hinderStart:uint;
	public var textureIndex:uint;
	
	public function TextureInfo(data:Object, frame:Rectangle, rotated:Boolean)
	{
		this.frame = frame;
		this.rotated = rotated;       
		this.textureIndex = data.index;//第几张大图
		this.hinderStart = data.hinderStart;//障碍数据位置
		this.region = new Rectangle(data.x, data.y, data.w, data.h);//在大图中的位置region
	}
}