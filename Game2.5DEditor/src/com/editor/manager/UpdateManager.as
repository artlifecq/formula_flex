package com.editor.manager
{
	import com.editor.utils.FileLoader;
	import com.editor.utils.FileUtil;

	import flash.desktop.NativeApplication;
	import flash.desktop.Updater;
	import flash.filesystem.File;
	import flash.net.URLStream;
	import flash.utils.ByteArray;
	import flash.utils.setTimeout;

	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.events.CloseEvent;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	import spark.components.WindowedApplication;

	public class UpdateManager
	{
		/**
		 *  @private
		 *  URL of the remote version.xml file
		 */
		private var versionURL : String;
		/**
		 *  @private
		 *  stores the applicationDescriptor
		 */
		private var appXML : XML = NativeApplication.nativeApplication.applicationDescriptor;
		/**
		 *  @private
		 *  stores the Namespace property of the applicationDescriptor
		 */
		private var ns : Namespace = appXML.namespace();
		/**
		 *  @public
		 *  stores the version property of the Namespace
		 */
		[Bindable]
		public var currentVersion : String = appXML.ns::version;
		/**
		 *  @public
		 *  stores the version property of the remote version.xml file
		 */
		private var version : XML;
		/**
		 *  @public
		 *  used in the updating process
		 */
		private var urlStream : URLStream = new URLStream();
		/**
		 *  @public
		 *  used in the updating process
		 */
		private var fileData : ByteArray = new ByteArray();

		private var _updateCompleteHandler : Function = null;
		private var _forceUpdate : Boolean = false;

		/**
		 *  Constructor.
		 */
		public function UpdateManager(versionURL : String, autoCheck : Boolean = true, completeHandler : Function = null) : void
		{
			currentVersion = appXML.ns::versionNumber;
			this.versionURL = versionURL;
			_updateCompleteHandler = completeHandler;
			if (autoCheck)
			{
				loadRemoteFile();
			}
			else
			{
				onUpdateComplete();
			}
		}

		private function onUpdateComplete() : void
		{
			if (_updateCompleteHandler != null)
				_updateCompleteHandler();
		}

		/**
		 *  @private
		 *  get the remote version.xml file
		 */
		private function loadRemoteFile() : void
		{
			var http : HTTPService = new HTTPService();
			http.url = this.versionURL;
			http.useProxy = false;
			http.method = "GET";
			http.resultFormat = "xml";
			http.addEventListener(ResultEvent.RESULT, testVersion);
			http.addEventListener(FaultEvent.FAULT, versionLoadFailure);
			http.send();
		}

		/**
		 *  @public
		 *  test the currentVersion against the remote version file and
		 *  either alert     the user of
		 *  an update available or force the update, if no update available,
		 *  alert user when showAlert is true
		 */
		public function checkForUpdate(showAlert : Boolean = true) : Boolean
		{
			if (version == null)
			{
				this.loadRemoteFile();
				return true;
			}
			if ((currentVersion != String(version.@version)) && String(version.@forceUpdate) == "true")
			{
				Alert.show("有新版本可用啦,\n请点击yes开始更新,或者点击no关闭此程序 " + "\n\n更新内容:\n" + version.@message, "是否更新", 3, null, alertClickHandlerForce);
			}
			else if (currentVersion != String(version.@version))
			{
				Alert.show("有新版本可用啦,\nwould you like to " + "get it now? \n\nDetails:\n" + version.@message, "Choose Yes or No", 3, null, alertClickHandlerChoice);
			}
			else
			{
				if (showAlert)
					Alert.show("There are no new updates available", "NOTICE");
			}
			return true;
		}

		/**
		 * @public
		 * test the currentVersion against the remote version file and
		 * either alert the user of
		 * an update available or force the update
		 */
		private function testVersion(event : ResultEvent) : void
		{
			version = XML(event.result);
			_forceUpdate = String(version.@forceUpdate) == "true";
			if (currentVersion != String(version.@version))
			{
				getUpdate();
			}
			else
			{
				onUpdateComplete();
			}
		}

		/**
		 * @private
		 * Alert user if the version.xml file can't be loaded
		 */
		private function versionLoadFailure(event : FaultEvent) : void
		{
			trace("Failed to load version.xml file from " + this.versionURL, "ERROR");
			loadRemoteFile();
		}

		/**
		 * @private
		 * get the new version from the remote server
		 */
		private function getUpdate() : void
		{
			var loader : FileLoader = new FileLoader();
			loader.load(FileUtil.isMacOS() ? String(version.@downloadLocationForMac) : String(version.@downloadLocation), FileUtil.isMacOS() ? "Update.air" : "Update.exe", onLoadComplete);
		}

		/**
		 * @private
		 * after the write is complete, call the update method on the Updater class
		 * 修改成发行版更新@L.L.M.Sunny 20151118
		 */
		private function onLoadComplete(file : File) : void
		{
			var alertStr : String;
			if (_forceUpdate)
			{
				alertStr = "有新版本可用！\n请点击确定开始更新,或者点击取消关闭此程序。" + "\n\n更新内容:\n" + version.@message;
				alertStr = alertStr.replace(/\\n/g, "\n");
				Alert.show(alertStr, "更新版本", 3, null, alertClickHandlerForce);
			}
			else
			{
				alertStr = "有新版本可用！\n请点击确定开始更新,或者点击取消忽略此更新。" + "\n\n更新内容:\n" + version.@message;
				alertStr = alertStr.replace(/\\n/g, "\n");
				Alert.show(alertStr, "更新版本", 3, null, alertClickHandlerChoice);
			}
		}

		private function alertClickHandlerForce(event : CloseEvent) : void
		{
			if (event.detail == Alert.YES)
			{
				startUpdate();
			}
			else
			{
				FlexGlobals.topLevelApplication.nativeWindow.close();
			}
		}

		private function alertClickHandlerChoice(event : CloseEvent) : void
		{
			if (event.detail == Alert.YES)
			{
				startUpdate();
			}
		}

		private function startUpdate() : void
		{
			var docsFile : File = File.applicationStorageDirectory.resolvePath("docs");
			if (docsFile.exists)
			{
				docsFile.deleteDirectory(true);
			}

			if (FileUtil.isMacOS())
			{
				var updater : Updater = new Updater();
				var airFile : File = File.applicationStorageDirectory.resolvePath("Update.air");
				updater.update(airFile, version.@version);
			}
			else
			{
				var batCode : String = "@echo off\n" + //
					"ping /n 1 127.0.0.1 >nul\n" + //
					"start \"BpgConvertTool Update...\" \"" + File.applicationStorageDirectory.nativePath + File.separator + "Update.exe\"";
				var batFile : File = File.applicationStorageDirectory.resolvePath("update.bat");
				FileUtil.writeToFile(batFile.nativePath, batCode, "ANSI");
				batFile.openWithDefaultApplication();
				setTimeout(function() : void
				{
					var app : WindowedApplication = WindowedApplication(FlexGlobals.topLevelApplication);
					app.close();
				}, 200);
			}
		}
	}
}
