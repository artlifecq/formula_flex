package com.editor.cfg
{
	import com.editor.utils.FileUtil;

	import flash.filesystem.File;
	import flash.utils.ByteArray;

	/**
	 *
	 * 编辑器配置
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-17 上午10:30:12
	 *
	 */
	public class EditorConfig
	{
		/**
		 * 主目录
		 */
		static public var WORKSPACE_PATH : String = "";
		static public var VERSION : String = "";

		public function EditorConfig()
		{
		}

		public static function load() : void
		{
			var file : File = File.applicationStorageDirectory.resolvePath(".config");
			if (file.exists && !file.isDirectory)
			{
				var bytes : ByteArray = FileUtil.readFile(file);
				var xml : XML = new XML(bytes.toString());
				WORKSPACE_PATH = xml.config.WORKSPACE_PATH;
			}
		}

		static public function save() : void
		{
			var xml : XML = <config/>;
			xml.config.WORKSPACE_PATH = WORKSPACE_PATH;
			var bytes : ByteArray = new ByteArray();
			bytes.writeUTFBytes(xml.toXMLString());
			var file : File = File.applicationStorageDirectory.resolvePath(".config");
			FileUtil.writeToFile(file.nativePath, bytes);
		}
	}
}
