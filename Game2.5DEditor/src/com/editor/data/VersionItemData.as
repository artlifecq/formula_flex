package com.editor.data
{
	import com.editor.cfg.EditorConfig;
	import com.editor.utils.FileUtil;

	import flash.filesystem.File;

	/**
	 *
	 * 版本项目数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-4-5 下午2:03:17
	 *
	 */
	public class VersionItemData
	{
		public static var UID : int = 0;

		public var versionId : int = 0;
		public var versionName : String = "";
		private var _releaseDire : String = "";
		private var _svnRootDire : String = "";

		public function VersionItemData()
		{
		}

		public function get svnRootDire() : String
		{
			if (_svnRootDire)
			{
				if (FileUtil.pathValid(_svnRootDire))
					return _svnRootDire;
				if (EditorConfig.WORKSPACE_PATH)
				{
					var workDire : File = new File(EditorConfig.WORKSPACE_PATH);
					var file : File = workDire.resolvePath(_svnRootDire);
					if (file)
						return filePathDeal(file.nativePath);
				}
			}
			return "";
		}

		public function set svnRootDire(value : String) : void
		{
			if (!value)
			{
				_svnRootDire = "";
				return;
			}
			if (EditorConfig.WORKSPACE_PATH)
			{
				var file : File = new File(value);
				var workDire : File = new File(EditorConfig.WORKSPACE_PATH);
				var relativePath : String = workDire.getRelativePath(file, true);
				if (relativePath)
					_svnRootDire = relativePath;
				else
					_svnRootDire = value;
			}
			else
			{
				_svnRootDire = value;
			}
		}

		public function get releaseDire() : String
		{
			if (_releaseDire)
			{
				if (FileUtil.pathValid(_releaseDire))
					return _releaseDire;
				if (EditorConfig.WORKSPACE_PATH)
				{
					var workDire : File = new File(EditorConfig.WORKSPACE_PATH);
					var file : File = workDire.resolvePath(_releaseDire);
					if (file)
						return filePathDeal(file.nativePath);
				}
			}
			return "";
		}

		public function set releaseDire(value : String) : void
		{
			if (!value)
			{
				_releaseDire = "";
				return;
			}
			if (EditorConfig.WORKSPACE_PATH)
			{
				var file : File = new File(value);
				var workDire : File = new File(EditorConfig.WORKSPACE_PATH);
				var relativePath : String = workDire.getRelativePath(file, true);
				if (relativePath)
					_releaseDire = relativePath;
				else
					_releaseDire = value;
			}
			else
			{
				_releaseDire = value;
			}
		}

		public static function filePathDeal(path : String) : String
		{
			if (!path)
				return "";
			path = path.replace(/\\/g, "/");
			return path;
		}
	}
}
