package com.editor.manager
{
	import com.editor.cfg.ProjectConfig;
	import com.editor.ctrl.AppMenu;
	import com.editor.data.VersionItemData;
	import com.editor.ui.ReleaseVersionDesignationView;
	import com.editor.ui.ReleaseVersionSetUpView;
	import com.editor.utils.FileLoader;
	import com.editor.utils.FileUtil;

	import flash.desktop.NativeProcess;
	import flash.desktop.NativeProcessStartupInfo;
	import flash.events.NativeProcessExitEvent;
	import flash.filesystem.File;

	import mx.controls.Alert;
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;

	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 发行版本管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2016-4-5 下午2:22:16
	 *
	 */
	public class ReleaseVersionManager
	{
		private static var slaveVersionToolLoadPath : String = "http://168.168.1.142/samba/ReleaseVersionTool_update/SlaveVersionTool.air"; //"http://168.168.1.41/stable/tool/versionTool/SlaveVersionTool.air";
		private static var bpgConvertToolLoadPath : String = "http://168.168.1.142/samba/BpgConvertTool_update/BpgConvertTool.exe";
		private static var slaveVersionToolFile : File = new File("C:/Program Files (x86)/SlaveVersionTool/SlaveVersionTool.exe");
		private static var bpgToolFile : File = new File("C:/Program Files (x86)/BpgConvertTool/BpgConvertTool.exe");

		private static var _instance : ReleaseVersionManager;

		public static function getInstance() : ReleaseVersionManager
		{
			if (!_instance)
			{
				_instance = new ReleaseVersionManager();
			}
			return _instance;
		}

		private var _versions : Array;
		private var _selectedReleaseVersion : VersionItemData = null;
		private var _bpgReleaseDire : String;
		private var _loadAlert : Alert;

		public function ReleaseVersionManager()
		{
			_versions = [];
			EventManager.addEvent(AppMenu.RELEASE_VERSION_ITEM, onSelectReleaseVersionItem);
		}

		public function initVersions(datas : Vector.<VersionItemData>) : void
		{
			VersionItemData.UID = 0;
			_versions.length = 0;
			for each (var version : VersionItemData in datas)
			{
				_versions.push(version);
				if (version.versionId > VersionItemData.UID)
					VersionItemData.UID = version.versionId;
			}
			_versions.sort(onSortVersions);
			AppMenu.getInstance().updateReleaseVersionMenu(_versions);
		}

		public function addVersion(versionName : String) : VersionItemData
		{
			var version : VersionItemData = getVersion(versionName);
			if (version)
				return null;
			VersionItemData.UID++;
			version = new VersionItemData();
			version.versionId = VersionItemData.UID;
			version.versionName = versionName;
			_versions.push(version);
			_versions.sort(onSortVersions);
			AppMenu.getInstance().updateReleaseVersionMenu(_versions);
			return version;
		}

		public function removeVersion(versionName : String) : void
		{
			var len : int = _versions.length;
			for (var i : int = 0; i < len; i++)
			{
				var version : VersionItemData = _versions[i];
				if (version.versionName == versionName)
				{
					_versions.splice(i, 1);
					return;
				}
			}
		}

		public function getVersion(versionName : String) : VersionItemData
		{
			for each (var version : VersionItemData in _versions)
			{
				if (version.versionName == versionName)
				{
					return version;
				}
			}
			return null;
		}

		public function saveVersions() : void
		{
			AppMenu.getInstance().updateReleaseVersionMenu(_versions);
			ProjectConfig.saveSetting();
		}

		private function onSortVersions(a : VersionItemData, b : VersionItemData) : Number
		{
			if (a && b)
			{
				if (a.versionId > 0)
				{
					if (a.versionId > b.versionId)
						return 1;
					else
						return -1;
				}
				else if (a.versionId < 0)
				{
					if (a.versionId > b.versionId)
						return -1;
					else
						return 1;
				}
			}
			return 0;
		}

		private function onSelectReleaseVersionItem(data : VersionItemData) : void
		{
			_selectedReleaseVersion = data;
			if (_selectedReleaseVersion.versionId == 0)
			{
				ReleaseVersionSetUpView.open();
				_selectedReleaseVersion = null;
			}
			else
			{
				if (!slaveVersionToolFile.exists)
				{
					Alert.show("没有安装版本发行插件，是否前去安装？", "提示", Alert.OK | Alert.CANCEL, null, onAlertInstallVersionToolHandler);
					return;
				}
				if (!bpgToolFile.exists)
				{
					Alert.show("没有安装BPG转换插件，是否前去安装？", "提示", Alert.OK | Alert.CANCEL, null, onAlertInstallBpgToolHandler);
					return;
				}
				Alert.show("注意：执行发行版本前请确认所有程序均已编译为release版本，确定发行版本【" + _selectedReleaseVersion.versionName + "】到【" + _selectedReleaseVersion.releaseDire + "】吗！", "提示", Alert.OK | Alert.CANCEL, null, onAlertClickHandler);
			}
		}

		private function onAlertClickHandler(event : CloseEvent) : void
		{
			if (event.detail == Alert.OK)
			{
				runBpgVersion();
			}
		}

		private function runBpgVersion() : void
		{
			var clientResPath : String = _selectedReleaseVersion.svnRootDire;
			var initVersionPath : String = clientResPath + '/initVersion/bpgVersion.swf';
			_bpgReleaseDire = clientResPath + '/initVersion/bpgVersion_' + getNextNewBpgVersion();
			var includeExt : String = 'png,jpg';
			runSlaveVersionTool(initVersionPath, _bpgReleaseDire, includeExt, onBpgVersionExit, true);
		}

		private function onBpgVersionExit(e : NativeProcessExitEvent) : void
		{
			Alert.show("是否需要转换BPG文件？（从主版本拷贝的分支版本首次发行时，建议直接用已有的BPG不需要再次转换！）", "提示", Alert.OK | Alert.CANCEL, null, onAlertRunBpgVersionHandler);
		}

		private function onAlertRunBpgVersionHandler(event : CloseEvent) : void
		{
			if (event.detail == Alert.OK)
			{
				runBpgConvert();
			}
			else
			{
				runReleaseVersion();
			}
		}

		private function onAlertInstallBpgToolHandler(event : CloseEvent) : void
		{
			if (event.detail == Alert.OK)
			{
				var loader : FileLoader = new FileLoader();
				if (_loadAlert)
				{
					PopUpManager.removePopUp(_loadAlert);
					_loadAlert = null;
				}
				_loadAlert = Alert.show("正在下载BPG转换插件，请稍等...", "下载中", Alert.OK);
				loader.load(bpgConvertToolLoadPath, "BpgConvertTool.air", onLoadBpgToolComplete);
			}
		}

		private function onLoadBpgToolComplete(file : File) : void
		{
			if (_loadAlert)
			{
				PopUpManager.removePopUp(_loadAlert);
				_loadAlert = null;
			}
			file.openWithDefaultApplication();
		}

		private function runBpgConvert() : void
		{
			var clientResPath : String = _selectedReleaseVersion.svnRootDire;
			var process : NativeProcess = new NativeProcess();
			process.addEventListener(NativeProcessExitEvent.EXIT, onBpgConvertToolExitHandler);
			var processArg : Vector.<String> = new Vector.<String>();
			processArg[0] = ProjectConfig.getResPath(_bpgReleaseDire);
			processArg[1] = ProjectConfig.getResPath(clientResPath);

			var info : NativeProcessStartupInfo = new NativeProcessStartupInfo();
			info.executable = bpgToolFile;
			info.arguments = processArg;
			process.start(info);
		}

		private function onBpgConvertToolExitHandler(e : NativeProcessExitEvent) : void
		{
			var clientResPath : String = _selectedReleaseVersion.svnRootDire;
			var bpgDireFile : File = new File(_bpgReleaseDire);
			if (bpgDireFile.exists)
			{
				Alert.show("有新转换的BPG文件，请先提交到SVN，再继续执行发行版本！", "提示", Alert.OK | Alert.CANCEL, null, onAlertRunReleaseVersionHandler);
			}
			else
			{
				runReleaseVersion();
			}
		}

		private function onAlertRunReleaseVersionHandler(event : CloseEvent) : void
		{
			if (event.detail == Alert.OK)
			{
				runReleaseVersion();
			}
		}

		private function runReleaseVersion() : void
		{
			if (!_selectedReleaseVersion)
				return;
			var clientResPath : String = _selectedReleaseVersion.svnRootDire;
			var initVersionPath : String = clientResPath + '/initVersion/initVersion_' + _selectedReleaseVersion.versionName + '.swf';
			var includeExt : String = 'swf,png,jpg,data,dat,mp3,awd,atf,pngx,bpg,xml,flv,mp4,inf,ap3';
			var releaseDire : String = _selectedReleaseVersion.releaseDire;
			if (!FileUtil.fileExists(releaseDire))
			{
				Alert.show("发行目录" + releaseDire + "不存在，请检查设置！", "提示");
				return;
			}
			runSlaveVersionTool(initVersionPath, releaseDire, includeExt, onReleaseVersionExit, false);
		}

		private function runSlaveVersionTool(initVersionPath : String, releaseDire : String, includeExt : String, versionToolExitHandler : Function, onlyFileSync : Boolean) : void
		{
			var svnRootPath : String = _selectedReleaseVersion.svnRootDire;
			var svnRootFile : File = FileUtil.pathValid(svnRootPath) ? new File(svnRootPath) : null;
			var resPath : String = svnRootPath;
			var resFile : File = FileUtil.pathValid(resPath) ? new File(resPath) : null;
			var clientResPath : String = (svnRootFile && resFile) ? svnRootFile.getRelativePath(resFile) : "";

			var initVersionFile : File;
			if (FileUtil.pathValid(initVersionPath))
				initVersionFile = new File(initVersionPath);
			var isInit : Boolean = !(initVersionFile && initVersionFile.exists);

			var process : NativeProcess = new NativeProcess();
			process.addEventListener(NativeProcessExitEvent.EXIT, versionToolExitHandler);
			var processArg : Vector.<String> = new Vector.<String>();
			processArg[0] = getVersionToolProcessArgStr(svnRootPath, releaseDire, clientResPath, initVersionPath, includeExt, isInit, onlyFileSync);

			var info : NativeProcessStartupInfo = new NativeProcessStartupInfo();
			info.executable = slaveVersionToolFile;
			info.arguments = processArg;
			process.start(info);
		}

		private function getVersionToolProcessArgStr(svnRootDir : String, releaseDir : String, clientResPath : String, initVersionFile : String, includeExt : String, initVer : Boolean, onlyFileSync : Boolean) : String
		{
			var dbRul : String = svnRootDir + '/.svn/wc.db';
			var gapDir : String = clientResPath;
			var workDir : String = svnRootDir;
			var rootPath : String = clientResPath ? clientResPath + '/res' : 'res';
			var defaultVersion : String = '1';
			var releaseExt : String = '';
			var unincludeDir : String = 'res/xxxxxxxxxxxxxx';
			var isInit : String = initVer ? 'true' : 'false';
			var isWriteByte : String = 'false';
			var isProcessMp3 : String = 'true';
			var isCheckFileName : String = 'true';
			var finishExit : String = 'true';
			var isFileSync : String = onlyFileSync ? 'true' : 'false';
			var outDir : String = releaseDir;

			var str : String = "dbRul=" + dbRul + //
				"&gapDir=" + gapDir + //
				"&initVersionFile=" + initVersionFile + //
				"&workDir=" + workDir + //
				"&releaseDir=" + releaseDir + //
				"&rootPath=" + rootPath + //
				"&defaultVersion=" + defaultVersion + //
				"&releaseExt=" + releaseExt + //
				"&includeExt=" + includeExt + //
				"&unincludeDir=" + unincludeDir + //
				"&isInit=" + isInit + //
				"&isWriteByte=" + isWriteByte + //
				"&isProcessMp3=" + isProcessMp3 + //
				"&isCheckFileName=" + isCheckFileName + //
				"&finishExit=" + finishExit + //
				"&isFileSync=" + isFileSync + //
				"&outDir=" + outDir;
			return str;
		}

		private function onAlertInstallVersionToolHandler(event : CloseEvent) : void
		{
			if (event.detail == Alert.OK)
			{
				var loader : FileLoader = new FileLoader();
				if (_loadAlert)
				{
					PopUpManager.removePopUp(_loadAlert);
					_loadAlert = null;
				}
				_loadAlert = Alert.show("正在下载版本发行插件，请稍等...", "下载中", Alert.OK);
				loader.load(slaveVersionToolLoadPath, "SlaveVersionTool.air", onLoadVersionToolComplete);
			}
		}

		private function onLoadVersionToolComplete(file : File) : void
		{
			if (_loadAlert)
			{
				PopUpManager.removePopUp(_loadAlert);
				_loadAlert = null;
			}
			file.openWithDefaultApplication();
		}

		private function onReleaseVersionExit(e : NativeProcessExitEvent) : void
		{
			ReleaseVersionDesignationView.open();
		}

		public function endReleaseVersion(clientVersion : int, loaderVersion : int) : void
		{
			var file : File = new File(_selectedReleaseVersion.releaseDire);
			if (file.exists)
			{
				var clientResPath : String = _selectedReleaseVersion.svnRootDire;
				var versionDire : File = file.resolvePath("version" + clientVersion);
				if (!versionDire.exists)
				{
					versionDire.createDirectory();
				}
				var clientVersionFile : File = file.resolvePath("version.swf");
				if (clientVersionFile.exists)
				{
					clientVersionFile.copyTo(versionDire.resolvePath("version.swf"), true);
				}
				else
				{
					Alert.show("异常：客户端版本文件不存在！", "提示");
				}
				////////////////////////////////
				var gameClientDllPath : String = ProjectConfig.getGameClientDllPath(clientResPath);
				var gameClientDllFile : File = gameClientDllPath ? new File(gameClientDllPath) : null;
				if (gameClientDllFile && gameClientDllFile.exists)
				{
					gameClientDllFile.copyTo(versionDire.resolvePath("GameClientDll.swf"), true);
				}
				else
				{
					Alert.show("异常：客户端程序文件不存在！", "提示");
				}
				////////////////////////////////
				var loaderDire : File = file.resolvePath("loader_" + loaderVersion);
				if (!loaderDire.exists)
				{
					loaderDire.createDirectory();
				}

				var loaderDirePath : String = ProjectConfig.getLoaderDirePath(clientResPath);
				var loaderDireFile : File = loaderDirePath ? new File(loaderDirePath) : null;
				if (loaderDireFile && loaderDireFile.exists)
				{
					loaderDireFile.copyTo(loaderDire, true);
				}
				else
				{
					Alert.show("异常：客户端加载器文件夹不存在！", "提示");
				}
					////////////////////////////////
				/*var gameClientPath : String = ProjectConfig.getGameClientPath(clientResPath);
				var gameClientFile : File = gameClientPath ? new File(gameClientPath) : null;
				if (gameClientFile && gameClientFile.exists)
				{
					gameClientFile.copyTo(loaderDire.resolvePath("GameClient.swf"), true);
				}
				else
				{
					Alert.show("异常：客户端加载器不存在！", "提示");
				}*/
			}
			else
			{
				Alert.show("异常：发行目录不存在！", "提示");
			}
			_selectedReleaseVersion = null;
			Alert.show("发行版本完成！", "提示");
		}

		public function get versions() : Array
		{
			return _versions;
		}

		public function getLatestClientVersion() : int
		{
			if (_selectedReleaseVersion)
			{
				if (FileUtil.pathValid(_selectedReleaseVersion.releaseDire))
				{
					var file : File = new File(_selectedReleaseVersion.releaseDire);
					if (file.exists)
					{
						var maxVersion : int = 0;
						var files : Array = file.getDirectoryListing();
						for each (var direFile : File in files)
						{
							if (direFile.isDirectory && direFile.name.indexOf("version") == 0)
							{
								var version : int = int(direFile.name.substr(("version").length));
								if (version > maxVersion)
									maxVersion = version;
							}
						}
						return maxVersion;
					}
				}
			}
			return 0;
		}

		public function getNextNewClientVersion() : int
		{
			return getLatestClientVersion() + 1;
		}

		public function getLatestLoaderVersion() : int
		{
			if (_selectedReleaseVersion)
			{
				if (FileUtil.pathValid(_selectedReleaseVersion.releaseDire))
				{
					var file : File = new File(_selectedReleaseVersion.releaseDire);
					if (file.exists)
					{
						var maxVersion : int = 0;
						var files : Array = file.getDirectoryListing();
						for each (var direFile : File in files)
						{
							if (direFile.isDirectory && direFile.name.indexOf("loader_") == 0)
							{
								var version : int = int(direFile.name.substr(("loader_").length));
								if (version > maxVersion)
									maxVersion = version;
							}
						}
						return maxVersion;
					}
				}
			}
			return 0;
		}

		public function getNextNewLoaderVersion() : int
		{
			return getLatestLoaderVersion() + 1;
		}

		public function getLatestBpgVersion() : int
		{
			var clientResPath : String = _selectedReleaseVersion.svnRootDire;
			var bpgDire : String = clientResPath + '/initVersion';
			if (FileUtil.pathValid(bpgDire))
			{
				var file : File = new File(bpgDire);
				if (file.exists)
				{
					var maxVersion : int = 0;
					var files : Array = file.getDirectoryListing();
					for each (var direFile : File in files)
					{
						if (direFile.isDirectory && direFile.name.indexOf("bpgVersion_") == 0)
						{
							var version : int = int(direFile.name.substr(("bpgVersion_").length));
							if (version > maxVersion)
								maxVersion = version;
						}
					}
					return maxVersion;
				}
			}
			return 0;
		}

		public function getNextNewBpgVersion() : int
		{
			return getLatestBpgVersion() + 1;
		}
	}
}
