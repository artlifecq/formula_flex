package com.editor.manager
{
	import com.editor.cfg.EditorConfig;
	import com.editor.cfg.ProjectConfig;
	import com.editor.ctrl.AppMenu;
	import com.editor.ctrl.AppMenuController;
	import com.editor.events.AppEvent;
	import com.editor.events.AvatarFileListEvent;
	import com.editor.events.EffectFileListEvent;
	import com.editor.events.MapFileListEvent;
	import com.editor.events.PreferenceEvent;
	import com.editor.ui.SelectWorkspaceView;
	import com.editor.ui.scene.PreviewScenePanel;
	import com.editor.ui.scene.ScenePanel;
	import com.editor.utils.FileUtil;
	import com.game.engine2D.Scene;
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.game.mainCore.core.manager.LayerManager;
	
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.geom.Point;
	import flash.system.Capabilities;
	
	import mx.core.FlexGlobals;
	
	import spark.components.WindowedApplication;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 应用管理
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-17 上午10:30:12
	 *
	 */
	public class AppManager
	{
		//www.devil3d.com
		public static const UPDATE_URL : String = "http://168.168.1.142/samba/Game25DEditor_update/update.xml";

		public function AppManager()
		{
		}

		private static var _instance : AppManager;

		public static function getInstance() : AppManager
		{
			if (!_instance)
				_instance = new AppManager();
			return _instance;
		}

		[Bindable]
		public var workspacePath : String = "";
		[Bindable]
		public var version : String = "";
		private var _appRoot : WindowedApplication;
		private var _updateManager : UpdateManager;

		public function init() : void
		{
			if (!Capabilities.isDebugger)
				_updateManager = new UpdateManager(UPDATE_URL, true);
			_appRoot = WindowedApplication(FlexGlobals.topLevelApplication);
			_appRoot.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

			NativeApplication.nativeApplication.autoExit = true;
			AppMenu.getInstance().init(appRoot);
			AppMenuController.getInstance().setup();

			var appXml : XML = NativeApplication.nativeApplication.applicationDescriptor;
			var ns : Namespace = appXml.namespace();
			EditorConfig.VERSION = appXml.ns::versionLabel;

			EventManager.addEvent(AppEvent.READ_PROJECT_CONFIG, onUpdateProjectConfig);
			EventManager.addEvent(AppEvent.SAVE_PROJECT_CONFIG, onSaveProjectConfig);

			EditorConfig.load();
			if (!EditorConfig.WORKSPACE_PATH)
				SelectWorkspaceView.open();
			else
				readWorkspaceData();

			SceneRoleManager.getInstance().init();
			//Resource3DLoader.dabugDelayComplete=5000;
		}

		private function onAddedToStage(e : Event) : void
		{
			_appRoot.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			_appRoot.stage.color = 0;
			KeyboardManager.getInstance().setup(_appRoot.stage);
			MouseManager.getInstance().setup(_appRoot.stage);
			BGMManager.setup();
		}

		public function get appRoot() : WindowedApplication
		{
			return _appRoot;
		}

		public function readWorkspaceData() : void
		{
			workspacePath = EditorConfig.WORKSPACE_PATH;
			version = EditorConfig.VERSION;

			EventManager.dispatchEvent(AppEvent.READ_PROJECT_CONFIG);
			DataManager.getInstance().readProjectData();

			EventManager.dispatchEvent(MapFileListEvent.PULL_MAP_FILE_LIST);
			EventManager.dispatchEvent(AvatarFileListEvent.PULL_AVATAR_FILE_LIST);
			EventManager.dispatchEvent(EffectFileListEvent.PULL_EFFECT_FILE_LIST);
		}

		public function reboot() : void
		{
			if (Capabilities.isDebugger)
				return;
			if (FileUtil.isMacOS())
			{
			}
			else
			{
				var batCode : String = "start \"2.5D游戏编辑器重启中...\" \"" + File.applicationDirectory.nativePath + File.separator + "2.5D游戏编辑器.exe\"";
				var file : File = File.applicationStorageDirectory.resolvePath("reboot.bat");
				FileUtil.writeToFile(file.nativePath, batCode, "ANSI");
				file.openWithDefaultApplication();
				_appRoot.close();
			}
		}

		private function onUpdateProjectConfig() : void
		{
			ProjectConfig.load();
			EventManager.dispatchEvent(PreferenceEvent.PREFERENCE_UPDATE_PROJECT_CONFIG);
		}

		private function onSaveProjectConfig() : void
		{
			DataManager.getInstance().readProjectData();
		}

		public function get appWidth() : int
		{
			return _appRoot.stage.nativeWindow.width;
		}

		public function get appHeight() : int
		{
			return _appRoot.stage.nativeWindow.height;
		}

		public function viewResize() : void
		{
            if (Scene.scene) {
                Scene.scene.reSize(LayerManager.stage.stageWidth, LayerManager.stage.stageHeight);
            }

			var scene : ScenePanel = (AppManager.getInstance().appRoot as Game25DEditor).sceneView;
			var gp : Point = scene.parent.localToGlobal(new Point(scene.x, scene.y));
			Stage3DLayerManager.resizeView(0, 0, AppManager.getInstance().appRoot.width, AppManager.getInstance().appRoot.height, gp.x, AppManager.getInstance().appRoot.width - scene.width, gp.y, 0);
            
			var previewScene : PreviewScenePanel = (AppManager.getInstance().appRoot as Game25DEditor).previewSceneView;
			gp = previewScene.parent.localToGlobal(new Point(previewScene.x, previewScene.y));
			Stage3DLayerManager.resizeScreenView(previewScene.width, previewScene.height, gp.x, 0, gp.y, 0);
		}
	}
}
