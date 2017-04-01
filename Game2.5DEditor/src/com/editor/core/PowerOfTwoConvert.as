package com.editor.core
{
	import com.editor.utils.FileUtil;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.geom.Point;
	import flash.utils.ByteArray;

	import mx.graphics.codec.JPEGEncoder;
	import mx.graphics.codec.PNGEncoder;

	/**
	 *
	 * 2的幂数转换器
	 * @author L.L.M.Sunny
	 * 创建时间：2016-6-24 上午10:26:37
	 *
	 */
	public class PowerOfTwoConvert
	{
		private var _jpgLoader : Loader;

		public function PowerOfTwoConvert()
		{
			_jpgLoader = new Loader();
		}

		public function convert(path : String, onComplete : Function = null) : void
		{
			if (!FileUtil.fileExists(path))
			{
				return;
			}
			var bytes : ByteArray = FileUtil.readFile(new File(path));

			_jpgLoader = new Loader();
			_jpgLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoaderComplete);
			_jpgLoader.loadBytes(bytes);

			function onLoaderComplete(event : Event) : void
			{
				var bd : BitmapData = Bitmap(_jpgLoader.content).bitmapData;

				var pw : Number = getNextPowerOfTwo(bd.width);
				var ph : Number = getNextPowerOfTwo(bd.height);
				var bdBytes : ByteArray = null;
				var dotIndex : int = path.lastIndexOf(".");
				var extension : String = path.substring(dotIndex + 1);
				var isPng : Boolean = extension.toLowerCase() == "png";
				var jpegEncoder : JPEGEncoder;
				var pngEncoder : PNGEncoder;

				if (bd.width == pw && bd.height == ph)
				{
					if (isPng)
					{
						pngEncoder = new PNGEncoder();
						bdBytes = pngEncoder.encode(bd);
					}
					else
					{
						jpegEncoder = new JPEGEncoder(90);
						bdBytes = jpegEncoder.encode(bd);
					}
					bd.dispose();
				}
				else
				{
					var newBd : BitmapData;
					if (isPng)
					{
						newBd = new BitmapData(pw, ph, true, 0);
						newBd.copyPixels(bd, bd.rect, new Point());
						bd.dispose();
						pngEncoder = new PNGEncoder();
						bdBytes = pngEncoder.encode(newBd);
					}
					else
					{
						newBd = new BitmapData(pw, ph, false, 0xffffff);
						newBd.copyPixels(bd, bd.rect, new Point());
						bd.dispose();
						jpegEncoder = new JPEGEncoder(90);
						bdBytes = jpegEncoder.encode(newBd);
					}
					newBd.dispose();
				}
				var toPath : String = path.substring(0, dotIndex) + "_normal" + (isPng ? ".png" : ".jpg");
				FileUtil.writeToFile(toPath, bdBytes);
				bdBytes.clear();
				if (onComplete != null)
					onComplete();
			}
		}

		/** Returns the next power of two that is equal to or bigger than the specified number. */
		public function getNextPowerOfTwo(number : Number) : int
		{
			if (number is int && number > 0 && (number & (number - 1)) == 0) // see: http://goo.gl/D9kPj
				return number;
			else
			{
				var result : int = 1;
				number -= 0.000000001; // avoid floating point rounding errors

				while (result < number)
					result <<= 1;
				return result;
			}
		}
	}
}
