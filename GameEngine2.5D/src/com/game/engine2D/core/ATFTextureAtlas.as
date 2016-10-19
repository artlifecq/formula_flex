package com.game.engine2D.core
{
	import com.game.engine2D.config.GlobalConfig2D;
	import com.game.engine2D.utils.MaterialUtils;
	
	import flash.display3D.Context3DTextureFormat;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	/**
	 * ATFTexture贴图集 
	 * @author guoqing.wen
	 * 
	 */
	public class ATFTextureAtlas
	{
		static private var count:uint = 0;
		private var _texturePack:TexturePack;
		private var _atlasTextures:Vector.<ITextureMaterial>;
		private var _textureInfos:Dictionary;
		private var _subTextures:Dictionary;
		
		public function ATFTextureAtlas(pack:TexturePack)
		{
			super();
			_texturePack = pack;
			_atlasTextures = new Vector.<ITextureMaterial>();
			_subTextures = new Dictionary();
			_textureInfos = new Dictionary();
			
			//解析配置
			parseAtfData(_texturePack);
			parseAtlasConfig(_texturePack.texturesConfig);
		}
		
		private function parseAtfData(pack:TexturePack):void
		{
			var len:int = pack.atfDataArr.length;
			for (var i:int = 0; i < len; i++) 
			{
				var texture:ITextureMaterial = null;
				if (GlobalConfig2D.avatarResExtension == ".zatf")
					texture = MaterialUtils.getAtfMaterialByData(pack.atfDataArr[i]);
				else 
					texture = MaterialUtils.getBpgMaterialByData(pack.atfDataArr[i],pack.path);
				_atlasTextures.push(texture);
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
		public function getTexture(name:String):ATFSubTexture
		{
			var info:TextureInfo = _textureInfos[name];
			
			if (info == null) return null;
			else
			{
				var texture:ATFSubTexture = _subTextures[name];
				
				if (texture)
				{
					return texture;
				}
				texture = new ATFSubTexture(
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
		public function getTextureAtlas(index:uint):ITextureMaterial { return _atlasTextures[index]; }
		
		/** Disposes the atlas texture. */
		public function dispose():void
		{
			if (_texturePack)
			{
				_texturePack.dispose();
			}
			for each (var sub:ATFSubTexture in _subTextures) 
			{
				sub.dispose();
			}
			for each (var texture:ITextureMaterial in _atlasTextures) 
			{
				texture.texture.dispose();
				texture.dispose();
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