package com.editor.ctrl
{
	import com.editor.data.VersionItemData;
	
	import flash.display.NativeMenu;
	import flash.display.NativeMenuItem;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.controls.FlexNativeMenu;
	
	import spark.components.WindowedApplication;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 菜单
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-17 上午10:30:12
	 *
	 */
	public class AppMenu extends EventDispatcher
	{
		public static const EXPORT_MAP_BLOCK_INFO : String = "EXPORT_MAP_BLOCK_INFO";
		public static const EXPORT_CONFIG : String = "EXPORT_CONFIG";
		public static const EXPORT_LANG : String = "EXPORT_LANG";
		public static const SAVE_FILE : String = "SAVE_FILE";
		public static const SWITCH_WORKSPACE : String = "SWITCH_WORKSPACE";
		public static const CHECK_FILES : String = "CHECK_FILES";
		public static const RELEASE_VERSION_ITEM : String = "RELEASE_VERSION_ITEM";
		public static const PREFERENCE : String = "PREFERENCE";
		public static const HELP_DATA_STRUCTURES_VIEW : String = "HELP_DATA_STRUCTURES_VIEW";
		public static const HELP_DECORATE_ENTITY_VIEW : String = "HELP_DECORATE_ENTITY_VIEW";
		public static const TOGGLE_DATA_STRUCTURES_VIEW : String = "TOGGLE_DATA_STRUCTURES_VIEW";
		public static const TOGGLE_MAP_MOUSE_INFO_VIEW : String = "TOGGLE_MAP_MOUSE_INFO_VIEW";
		public static const TOGGLE_AVATAR_FILE_LIST_VIEW : String = "TOGGLE_AVATAR_FILE_LIST_VIEW";
		public static const TOGGLE_MINI_MAP_VIEW : String = "TOGGLE_MINI_MAP_VIEW";
		public static const TOGGLE_ARAE_MAP_VIEW : String = "TOGGLE_ARAE_MAP_VIEW";
		public static const TOGGLE_MINI_MAP_CORRECT_VIEW : String = "TOGGLE_MINI_MAP_CORRECT_VIEW";
		public static const TOGGLE_LANG_CONFIG_VIEW : String = "TOGGLE_LANG_CONFIG_VIEW";
		public static const TOGGLE_GLOBAL_SETTING_CONFIG_VIEW : String = "TOGGLE_GLOBAL_SETTING_CONFIG_VIEW";
		public static const TOGGLE_UNIT_TEST_VIEW : String = "TOGGLE_UNIT_TEST_VIEW";
        
        // v2版本 table
        public static const MENUEVENT_SHOWTABLE : String = "MENUEVENT_SHOWTABLE";
        public static const MENUEVENT_EXPORTTABLE : String = "MENUEVENT_EXPORTTABLE";

		private static var _instance : AppMenu;

		public static function getInstance() : AppMenu
		{
			if (!_instance)
				_instance = new AppMenu();
			return _instance;
		}

		private var _fileMenu : NativeMenuItem;
		private var _editMenu : NativeMenuItem;
		private var _windowMenu : NativeMenuItem;
        private var _tableMenu : NativeMenuItem;
		private var _helpMenu : NativeMenuItem;

		private var _saveFile : NativeMenuItem;
		private var _exportMapBlockInfo : NativeMenuItem;
		private var _exportConfig : NativeMenuItem;
		private var _exportLang : NativeMenuItem;

		private var _checkFiles : NativeMenuItem;
		private var _releaseVersion : NativeMenuItem;
		/**
		 * 切换工作空间
		 */
		private var _switchWorkspace : NativeMenuItem;
		private var _preference : NativeMenuItem;
		public var toggleDataStructuresView : NativeMenuItem;
		public var toggleMapMouseInfoView : NativeMenuItem;
		public var toggleAvatarFileListView : NativeMenuItem;
		public var toggleMiniMapView : NativeMenuItem;
		public var toggleAreaMapView : NativeMenuItem;
		public var toggleMiniMapCorrectView : NativeMenuItem;
		public var toggleLangConfigView : NativeMenuItem;
		public var toggleGlobalSettingConfigView : NativeMenuItem;
		public var toggleUnitTestView : NativeMenuItem;

		public function AppMenu()
		{
			super();
		}

		public function init(appRoot : WindowedApplication) : void
		{
			var nativeMenu : FlexNativeMenu = createMainMenu();
			appRoot.menu = nativeMenu;
		}

		private function createMainMenu() : FlexNativeMenu
		{
			var nativeMenu : FlexNativeMenu = new FlexNativeMenu();

			_fileMenu = new NativeMenuItem("文件(F)");
			_fileMenu.data = "file";
			_fileMenu.submenu = createFileMenu();
			nativeMenu.nativeMenu.addItem(_fileMenu);

			_editMenu = new NativeMenuItem("编辑(E)");
			_editMenu.data = "edit";
			_editMenu.submenu = createEditMenu();
			nativeMenu.nativeMenu.addItem(_editMenu);

			_windowMenu = new NativeMenuItem("窗口(W)");
			_windowMenu.data = "window";
			_windowMenu.submenu = createWindowMenu();
			nativeMenu.nativeMenu.addItem(_windowMenu);
            
			//this._tableMenu = new NativeMenuItem("表格(T)");
			//this._tableMenu.data = "table";
			//this._tableMenu.submenu = createTableMenu();
			//nativeMenu.nativeMenu.addItem(this._tableMenu);

			_helpMenu = new NativeMenuItem("帮助(H)");
			_helpMenu.data = "help";
			_helpMenu.submenu = createHelpMenu();
			nativeMenu.nativeMenu.addItem(_helpMenu);

			return nativeMenu;
		}

		private function createFileMenu() : NativeMenu
		{
			var menu : FlexNativeMenu = new FlexNativeMenu();

			_saveFile = new NativeMenuItem("保存(S)");
			_saveFile.data = new Event(SAVE_FILE);
			_saveFile.keyEquivalent = "s";
			_saveFile.addEventListener(Event.SELECT, eventHandler);
			menu.nativeMenu.addItem(_saveFile);

			_exportMapBlockInfo = new NativeMenuItem("导出地图块信息(E)");
			_exportMapBlockInfo.data = new Event(EXPORT_MAP_BLOCK_INFO);
			_exportMapBlockInfo.addEventListener(Event.SELECT, eventHandler);
			menu.nativeMenu.addItem(_exportMapBlockInfo);

			_exportConfig = new NativeMenuItem("导出配置(E)");
			_exportConfig.data = new Event(EXPORT_CONFIG);
			_exportConfig.addEventListener(Event.SELECT, eventHandler);
			menu.nativeMenu.addItem(_exportConfig);

			_exportLang = new NativeMenuItem("导出语言(G)");
			_exportLang.data = new Event(EXPORT_LANG);
			_exportLang.addEventListener(Event.SELECT, eventHandler);
			menu.nativeMenu.addItem(_exportLang);

			_switchWorkspace = new NativeMenuItem("切换工作空间(W)");
			_switchWorkspace.data = new Event(SWITCH_WORKSPACE);
			_switchWorkspace.addEventListener(Event.SELECT, eventHandler);
			menu.nativeMenu.addItem(_switchWorkspace);

			_checkFiles = new NativeMenuItem("检查文件(C)");
			_checkFiles.data = new Event(CHECK_FILES);
			_checkFiles.addEventListener(Event.SELECT, eventHandler);
			menu.nativeMenu.addItem(_checkFiles);

			_releaseVersion = new NativeMenuItem("发行版本(R)");
			menu.nativeMenu.addItem(_releaseVersion);

			return menu.nativeMenu;
		}

		public function updateReleaseVersionMenu(datas : Array) : void
		{
			if (_releaseVersion.submenu)
				_releaseVersion.submenu.removeAllItems();
			_releaseVersion.submenu = new NativeMenu();
			var menuItem : NativeMenuItem;
			var data : VersionItemData;
			for each (data in datas)
			{
				menuItem = new NativeMenuItem("版本：" + data.versionName);
				menuItem.data = data;
				menuItem.addEventListener(Event.SELECT, eventHandler);
				_releaseVersion.submenu.addItem(menuItem);
			}
			data = new VersionItemData();
			menuItem = new NativeMenuItem("(发行版本设置)");
			menuItem.data = data;
			menuItem.addEventListener(Event.SELECT, eventHandler);
			_releaseVersion.submenu.addItem(menuItem);
		}

		private function createEditMenu() : NativeMenu
		{
			var menu : FlexNativeMenu = new FlexNativeMenu();
			_preference = new NativeMenuItem("首选项(P)");
			_preference.data = new Event(PREFERENCE);
			_preference.addEventListener(Event.SELECT, eventHandler);
			menu.nativeMenu.addItem(_preference);

			return menu.nativeMenu;
		}

		private function createWindowMenu() : NativeMenu
		{
			var menu : FlexNativeMenu = new FlexNativeMenu();

			toggleDataStructuresView = new NativeMenuItem("显示数据结构(1)");
			toggleDataStructuresView.data = new Event(TOGGLE_DATA_STRUCTURES_VIEW, true);
			toggleDataStructuresView.checked = false;
			toggleDataStructuresView.keyEquivalent = "1";
			toggleDataStructuresView.addEventListener(Event.SELECT, toggleCheckedHandler);
			menu.nativeMenu.addItem(toggleDataStructuresView);

			toggleMapMouseInfoView = new NativeMenuItem("显示地图鼠标信息(2)");
			toggleMapMouseInfoView.data = new Event(TOGGLE_MAP_MOUSE_INFO_VIEW, true);
			toggleMapMouseInfoView.checked = false;
			toggleMapMouseInfoView.keyEquivalent = "2";
			toggleMapMouseInfoView.addEventListener(Event.SELECT, toggleCheckedHandler);
			menu.nativeMenu.addItem(toggleMapMouseInfoView);

			toggleAvatarFileListView = new NativeMenuItem("显示换装资源列表(3)");
			toggleAvatarFileListView.data = new Event(TOGGLE_AVATAR_FILE_LIST_VIEW, true);
			toggleAvatarFileListView.checked = false;
			toggleAvatarFileListView.keyEquivalent = "3";
			toggleAvatarFileListView.addEventListener(Event.SELECT, toggleCheckedHandler);
			menu.nativeMenu.addItem(toggleAvatarFileListView);

			toggleMiniMapView = new NativeMenuItem("显示小地图(5)");
			toggleMiniMapView.data = new Event(TOGGLE_MINI_MAP_VIEW, true);
			toggleMiniMapView.checked = false;
			toggleMiniMapView.keyEquivalent = "5";
			toggleMiniMapView.addEventListener(Event.SELECT, toggleCheckedHandler);
			menu.nativeMenu.addItem(toggleMiniMapView);

			toggleAreaMapView = new NativeMenuItem("显示区域图(9)");
			toggleAreaMapView.data = new Event(TOGGLE_ARAE_MAP_VIEW, true);
			toggleAreaMapView.checked = false;
			toggleAreaMapView.keyEquivalent = "9";
			toggleAreaMapView.addEventListener(Event.SELECT, toggleCheckedHandler);
			menu.nativeMenu.addItem(toggleAreaMapView);

			toggleMiniMapCorrectView = new NativeMenuItem("显示小地图矫正(6)");
			toggleMiniMapCorrectView.data = new Event(TOGGLE_MINI_MAP_CORRECT_VIEW, true);
			toggleMiniMapCorrectView.checked = false;
			toggleMiniMapCorrectView.keyEquivalent = "6";
			toggleMiniMapCorrectView.addEventListener(Event.SELECT, toggleCheckedHandler);
			menu.nativeMenu.addItem(toggleMiniMapCorrectView);

			toggleLangConfigView = new NativeMenuItem("显示语言配置(7)");
			toggleLangConfigView.data = new Event(TOGGLE_LANG_CONFIG_VIEW, true);
			toggleLangConfigView.checked = false;
			toggleLangConfigView.keyEquivalent = "7";
			toggleLangConfigView.addEventListener(Event.SELECT, toggleCheckedHandler);
			menu.nativeMenu.addItem(toggleLangConfigView);

			toggleGlobalSettingConfigView = new NativeMenuItem("显示全局设置配置(8)");
			toggleGlobalSettingConfigView.data = new Event(TOGGLE_GLOBAL_SETTING_CONFIG_VIEW, true);
			toggleGlobalSettingConfigView.checked = false;
			toggleGlobalSettingConfigView.keyEquivalent = "8";
			toggleGlobalSettingConfigView.addEventListener(Event.SELECT, toggleCheckedHandler);
			menu.nativeMenu.addItem(toggleGlobalSettingConfigView);

			toggleUnitTestView = new NativeMenuItem("显示单元测试(9)");
			toggleUnitTestView.data = new Event(TOGGLE_UNIT_TEST_VIEW, true);
			toggleUnitTestView.checked = false;
			toggleUnitTestView.keyEquivalent = "9";
			toggleUnitTestView.addEventListener(Event.SELECT, toggleCheckedHandler);
			menu.nativeMenu.addItem(toggleUnitTestView);
			return menu.nativeMenu;
		}
        
        private function createTableMenu() : NativeMenu {
            var menu : FlexNativeMenu = new FlexNativeMenu();
            var showTable : NativeMenuItem = new NativeMenuItem("显示表格");
            showTable.data = new Event(MENUEVENT_SHOWTABLE, true);
            showTable.addEventListener(Event.SELECT, this.eventHandler);
            menu.nativeMenu.addItem(showTable);
            
            var exportTable : NativeMenuItem = new NativeMenuItem("导出表格");
            exportTable.data = new Event(MENUEVENT_EXPORTTABLE, true);
            exportTable.addEventListener(Event.SELECT, this.eventHandler);
            menu.nativeMenu.addItem(exportTable);
            return menu.nativeMenu;
        }

		private function createHelpMenu() : NativeMenu
		{
			var menu : FlexNativeMenu = new FlexNativeMenu();

			var helpDataStructures : NativeMenuItem = new NativeMenuItem("如何配置数据结构？");
			helpDataStructures.data = new Event(HELP_DATA_STRUCTURES_VIEW, true);
			helpDataStructures.addEventListener(Event.SELECT, eventHandler);
			menu.nativeMenu.addItem(helpDataStructures);

			var helpDecorateEntity : NativeMenuItem = new NativeMenuItem("如何布置场景实体？");
			helpDecorateEntity.data = new Event(HELP_DECORATE_ENTITY_VIEW, true);
			helpDecorateEntity.addEventListener(Event.SELECT, eventHandler);
			menu.nativeMenu.addItem(helpDecorateEntity);

			return menu.nativeMenu;
		}

		private function eventHandler(e : Event) : void
		{
			var ref : NativeMenuItem = e.target as NativeMenuItem;
			if (ref.data is Event)
				dispatchEvent(ref.data as Event);
			else if (ref.data is VersionItemData)
				EventManager.dispatchEvent(RELEASE_VERSION_ITEM, ref.data);
		}

		private function toggleCheckedHandler(e : Event) : void
		{
			var ref : NativeMenuItem = e.target as NativeMenuItem;
			ref.checked = !ref.checked;
			if (ref.data is Event)
				dispatchEvent(ref.data as Event);
		}
	}
}
