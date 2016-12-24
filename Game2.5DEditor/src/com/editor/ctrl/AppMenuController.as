package com.editor.ctrl
{
	import com.editor.cfg.ProjectConfig;
	import com.editor.core.ConfigCodeCreater;
	import com.editor.core.ConfigPackCreater;
	import com.editor.core.LangCodeCreater;
	import com.editor.core.LangPackCreater;
	import com.editor.events.MapEvent;
	import com.editor.manager.DataManager;
	import com.editor.ui.AreaMapView;
	import com.editor.ui.AvatarFileListView;
	import com.editor.ui.CheckFilesView;
	import com.editor.ui.DataStructuresView;
	import com.editor.ui.GlobalSettingConfigView;
	import com.editor.ui.LangConfigView;
	import com.editor.ui.MapMouseInfoView;
	import com.editor.ui.MiniMapView;
	import com.editor.ui.PreferenceView;
	import com.editor.ui.SceneMapBlockCreaterView;
	import com.editor.ui.SelectWorkspaceView;
	import com.editor.ui.UnitTestView;
	import com.editor.utils.FileLoader;
	import com.editor.utils.FileUtil;
	
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.utils.Dictionary;
	
	import mx.controls.Alert;
	import mx.managers.PopUpManager;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 菜单控制器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-17 上午10:30:12
	 *
	 */
	public class AppMenuController
	{
		private static var _instance : AppMenuController;

		public static function getInstance() : AppMenuController
		{
			if (!_instance)
				_instance = new AppMenuController();
			return _instance;
		}

		public function AppMenuController()
		{
		}

		public function setup() : void
		{
			AppMenu.getInstance().addEventListener(AppMenu.EXPORT_MAP_BLOCK_INFO, onExportMapBlockInfo);
			AppMenu.getInstance().addEventListener(AppMenu.EXPORT_CONFIG, onExportConfig);
			AppMenu.getInstance().addEventListener(AppMenu.EXPORT_LANG, onExportLang);
			AppMenu.getInstance().addEventListener(AppMenu.SAVE_FILE, onSaveFile);
			AppMenu.getInstance().addEventListener(AppMenu.SWITCH_WORKSPACE, onSwitchWorkspace);
			AppMenu.getInstance().addEventListener(AppMenu.CHECK_FILES, onCheckFiles);
			AppMenu.getInstance().addEventListener(AppMenu.PREFERENCE, onPreference);
			AppMenu.getInstance().addEventListener(AppMenu.TOGGLE_DATA_STRUCTURES_VIEW, onToggleDataStructuresView);
			AppMenu.getInstance().addEventListener(AppMenu.TOGGLE_MAP_MOUSE_INFO_VIEW, onToggleMapMouseInfoView);
			AppMenu.getInstance().addEventListener(AppMenu.TOGGLE_AVATAR_FILE_LIST_VIEW, onToggleAvatarFileListView);
			AppMenu.getInstance().addEventListener(AppMenu.TOGGLE_MINI_MAP_VIEW, onToggleMiniMapView);
			AppMenu.getInstance().addEventListener(AppMenu.TOGGLE_ARAE_MAP_VIEW, onToggleAreaMapView);
			AppMenu.getInstance().addEventListener(AppMenu.TOGGLE_MINI_MAP_CORRECT_VIEW, onToggleMiniMapCorrectView);
			AppMenu.getInstance().addEventListener(AppMenu.TOGGLE_LANG_CONFIG_VIEW, onToggleLangConfigView);
			AppMenu.getInstance().addEventListener(AppMenu.TOGGLE_GLOBAL_SETTING_CONFIG_VIEW, onToggleGlobalSettingConfigView);
			AppMenu.getInstance().addEventListener(AppMenu.TOGGLE_UNIT_TEST_VIEW, onToggleUnitTestView);
			AppMenu.getInstance().addEventListener(AppMenu.HELP_DATA_STRUCTURES_VIEW, onHelpDataStructuresView);
			AppMenu.getInstance().addEventListener(AppMenu.HELP_DECORATE_ENTITY_VIEW, onHelpDecorateEntityView);
            
            // v2
            AppMenu.getInstance().addEventListener(AppMenu.MENUEVENT_SHOWTABLE, onShowTableView);
            AppMenu.getInstance().addEventListener(AppMenu.MENUEVENT_EXPORTTABLE, onExportTable);
            // end v2
		}

		private function onExportMapBlockInfo(e : Event) : void
		{
			SceneMapBlockCreaterView.open();
		}

		private function onExportConfig(e : Event) : void
		{
			var generated : Boolean = ConfigCodeCreater.getInstance().generate();
			var exported : Boolean = ConfigPackCreater.getInstance().export();
			if (generated && exported)
				Alert.show("生成代码并导出配置成功！", "提示");
			else if (exported)
				Alert.show("导出配置成功！", "提示");
			else
				Alert.show("发生错误，导出配置失败！", "提示");
		}

		private function onExportLang(e : Event) : void
		{
			var generated : Boolean = LangCodeCreater.getInstance().generate();
			var exported : Boolean = LangPackCreater.getInstance().export();
			if (generated && exported)
				Alert.show("生成代码并导出语言成功！", "提示");
			else if (exported)
				Alert.show("导出语言成功！", "提示");
			else
				Alert.show("发生错误，导出语言失败！", "提示");
		}

		private function onSaveFile(e : Event) : void
		{
			try
			{
				ProjectConfig.save();
			}
			catch (e : Error)
			{
				Alert.show("保存项目配置时发生错误！" + "\n" + e.message + "\n" + e.getStackTrace(), "错误");
			}
			DataManager.getInstance().saveProjectData();
			Alert.show("保存成功！", "提示");
		}

		private function onCheckFiles(e : Event) : void
		{
			CheckFilesView.open();

			var fileList : Dictionary = FileUtil.getDirectoryFiles(ProjectConfig.getResPath(ProjectConfig.clientResPath), null, true, currAsyncComplete);
			function currAsyncComplete(list : Array) : void
			{
				var errorInfos : Array = [];
				for each (var file : File in list)
				{
					var isPass : Boolean = FileUtil.checkFileName(file.name);
					if (!isPass)
						errorInfos.push("文件名非法：" + file.nativePath);
				}
				if (errorInfos.length > 0)
				{
					CheckFilesView.window.addError(errorInfos.join("<br>"));
				}
			}
		}

		private function onSwitchWorkspace(e : Event) : void
		{
			SelectWorkspaceView.open();
		}

		private function onPreference(e : Event) : void
		{
			PreferenceView.open();
		}

		private function onToggleDataStructuresView(e : Event) : void
		{
			if (AppMenu.getInstance().toggleDataStructuresView.checked)
				DataStructuresView.open();
			else
				DataStructuresView.close();
		}

		private function onToggleMapMouseInfoView(e : Event) : void
		{
			if (AppMenu.getInstance().toggleMapMouseInfoView.checked)
				MapMouseInfoView.open();
			else
				MapMouseInfoView.close();
		}

		private function onToggleAvatarFileListView(e : Event) : void
		{
			if (AppMenu.getInstance().toggleAvatarFileListView.checked)
				AvatarFileListView.open();
			else
				AvatarFileListView.close();
		}

		private function onToggleMiniMapView(e : Event) : void
		{
			if (AppMenu.getInstance().toggleMiniMapView.checked)
				MiniMapView.open();
			else
				MiniMapView.close();
		}

		private function onToggleAreaMapView(e : Event) : void
		{
			if (AppMenu.getInstance().toggleAreaMapView.checked)
				AreaMapView.open();
			else
				AreaMapView.close();
		}

		private function onToggleMiniMapCorrectView(e : Event) : void
		{
			EventManager.dispatchEvent(MapEvent.SHOW_MINI_MAP_CORRECT_VIEW, AppMenu.getInstance().toggleMiniMapCorrectView.checked);
		}

		private function onToggleLangConfigView(e : Event) : void
		{
			if (AppMenu.getInstance().toggleLangConfigView.checked)
				LangConfigView.open();
			else
				LangConfigView.close();
		}

		private function onToggleGlobalSettingConfigView(e : Event) : void
		{
			if (AppMenu.getInstance().toggleGlobalSettingConfigView.checked)
				GlobalSettingConfigView.open();
			else
				GlobalSettingConfigView.close();
		}

		private function onToggleUnitTestView(e : Event) : void
		{
			if (AppMenu.getInstance().toggleUnitTestView.checked)
				UnitTestView.open();
			else
				UnitTestView.close();
		}

		private function onHelpDataStructuresView(e : Event) : void
		{
			openHelpDoc("docs/help_data_structures.pdf");
		}

		private function onHelpDecorateEntityView(e : Event) : void
		{
			openHelpDoc("docs/help_decorate_entity.pdf");
		}

		private function openHelpDoc(filePath : String) : void
		{
			var file : File = File.applicationStorageDirectory.resolvePath(filePath);
			if (file.exists)
			{
				file.openWithDefaultApplication();
			}
			else
			{
				var alert : Alert = Alert.show("正在下载帮助文档，请稍等...", "下载中", Alert.OK);
				var fileLoader : FileLoader = new FileLoader();
				fileLoader.load("http://168.168.1.142/samba/Game3DEditor_update/" + filePath, filePath, function(file : File) : void
				{
					PopUpManager.removePopUp(alert);
					if (file.exists)
						file.openWithDefaultApplication();
				}); //www.devil3d.com
			}
		}
        
        // v2
        private function onShowTableView(e : Event) : void {
            
        }
        
        private function onExportTable(e : Event) : void {
        }
        // end v2
	}
}
