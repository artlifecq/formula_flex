package com.game.engine2D.utils
{
	import com.game.engine2D.core.TexturePack;
	
	
	import org.client.mainCore.manager.EventManager;
	import flash.utils.ByteArray;
	
	/**
	 * 纹理包格式控制
	 * @author guoqing.wen
	 * 
	 */
	public class AnalysisTexture
	{
		static public const ANALYSIS_TEXTURE_ERROR:String = "ANALYSIS_TEXTURE_ERROR";
		
		public function AnalysisTexture()
		{
		}
		
		static public function compressTexture(config:Object, atfArrs:Array, dataBytes:ByteArray, hinderBytes:ByteArray = null):ByteArray
		{
			var atfBytes:ByteArray = null;
			var fileBytes:ByteArray = new ByteArray();
			var tmpBytes:ByteArray = new ByteArray();
			
			tmpBytes.writeUTFBytes(JSON.stringify(config));
			tmpBytes.compress("lzma");//7z压缩
			dataBytes.compress("lzma");
			
			writeFileHead(fileBytes, 1);//version 从2开始使用zlib压缩，解压缩效率高
			
			fileBytes.writeByte(atfArrs.length);
			for (var i:int = 0; i < atfArrs.length; i++) 
			{
				atfBytes = atfArrs[i];
				fileBytes.writeUnsignedInt(atfBytes.length);
				fileBytes.writeBytes(atfBytes);
			}
			
			fileBytes.writeUnsignedInt(dataBytes.length);
			fileBytes.writeBytes(dataBytes);
			fileBytes.writeUnsignedInt(tmpBytes.length);
			fileBytes.writeBytes(tmpBytes);
			if (hinderBytes)
			{
				hinderBytes.compress("lzma");
				fileBytes.writeUnsignedInt(hinderBytes.length);
				fileBytes.writeBytes(hinderBytes);
			}
			else
			{
				fileBytes.writeUnsignedInt(0);
			}
			tmpBytes.clear();
			
			return fileBytes;
		}
		
		static public function decompressTexturePack(fileBytes:ByteArray, path:String):TexturePack
		{
			var config:Object = null;
			var hinderBytes:ByteArray = new ByteArray();
			var dataBytes:ByteArray = new ByteArray();
			var tmpBytes:ByteArray = new ByteArray();
			var len:int = 0;
			var pack:TexturePack = null;
			var atfBytes:ByteArray = null;
			try
			{
				var head:FileHead = getReadHead(fileBytes);
				if (head)
				{
					pack = new TexturePack();
					
					var count:int = fileBytes.readByte();
					while(count-- > 0)
					{
						atfBytes = new ByteArray();
						len = fileBytes.readUnsignedInt();
						fileBytes.readBytes(atfBytes, 0, len);
						pack.addAtfData(atfBytes);
					}
					len = fileBytes.readUnsignedInt();
					fileBytes.readBytes(dataBytes, 0, len);
					len = fileBytes.readUnsignedInt();
					fileBytes.readBytes(tmpBytes, 0, len);
					len = fileBytes.readUnsignedInt();
					fileBytes.readBytes(hinderBytes, 0, len);
					
					tmpBytes.uncompress("lzma");
					dataBytes.uncompress("lzma");
					hinderBytes.uncompress("lzma");
					
					config = JSON.parse(tmpBytes.readUTFBytes(tmpBytes.length));
					pack.setConfig(path, config, dataBytes, hinderBytes);
					tmpBytes.clear();
					tmpBytes = null;
					fileBytes.clear();
					fileBytes = null;
					
					return pack;
				}
				else
				{
					EventManager.dispatchEvent(ANALYSIS_TEXTURE_ERROR,"avatar文件头错误:"+path);
				}
			}
			catch(error:Error)
			{
				EventManager.dispatchEvent(ANALYSIS_TEXTURE_ERROR,"非法avatar文件:"+path);
			}
			return null;
		}
		
		/**
		 * 读取文件头,根据文件头标志，如果有就读，没有返加null 
		 * @param FileHead
		 */
		static public function getReadHead(fileBytes:ByteArray):FileHead
		{
			fileBytes.position = 0;
			var head:FileHead = null;
			if(fileBytes.length < 2)
			{
				trace("非法文件长度")
				return null;
			}
			var headFlag:int = fileBytes.readShort();
			if (headFlag == FileHead.HEAD_FLAG)
			{
				head = new FileHead()
				head.head = headFlag;
				head.compressType = fileBytes.readByte();
				head.version = fileBytes.readByte();
				fileBytes.position = FileHead.HEAD_LENGTH;
				return head;
			}
			fileBytes.position = 0;
			return head;
		}
		
		static public  function writeFileHead(fileBytes:ByteArray, version:int = 0):void
		{
			var head:ByteArray = new ByteArray();
			head.length = 8;
			head.position = 0;
			head.writeShort(FileHead.HEAD_FLAG);
			head.writeByte(1);
			head.writeByte(version);
			fileBytes.writeBytes(head);
			head.clear();
			head = null;
		}
	}
}