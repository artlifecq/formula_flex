package com.rpgGame.core.app
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.coreData.cfg.WindowInfoData;
	import com.rpgGame.coreData.clientConfig.Q_windowInfo;
	
	import feathers.themes.GuiTheme;
	
	import org.client.mainCore.ds.HashMap;
	
	import starling.display.DisplayObjectContainer;
	
	/**
	 * app应用管理
	 * @author fly
	 * 
	 */	
	public class AppManager
	{
		private static var _moduleMap:HashMap = new HashMap();
		
		
		/**
		 * 打开某个app  
		 * @param appInfo		指定打开哪个面板
		 * @param data			打开时给面板传入的参数
		 * @param openTable		要打开面板的哪个标签页 ,确定面板里调用了setMainTableBar方法设置主tableBar
		 * @param parentContiner app的父容器对象
		 * @author 卢国征 2015-5-22
		 */			
		public static function showApp( appName:String, data:Object = null, openTable:String = "", parentContiner:DisplayObjectContainer = null ):void
		{GameLog.addShow("showApp-1");
			var appInfo:AppInfo = AppConstant.getAppinfoByAppName( appName );
			preTurnModule( appInfo, data, openTable, parentContiner, false, true );
		}
		
		/**
		 * 打开某个app 但是不关闭其他app 
		 * @param appInfo		指定打开哪个面板
		 * @param data			打开时给面板传入的参数
		 * @param openTable		要打开面板的哪个标签页 ,确定面板里调用了setMainTableBar方法设置主tableBar
		 * @author 卢国征 2015-5-22
		 */		
		public static function showAppNoCloseAll( appName:String, data:Object = null, openTable:String = "", parentContiner:DisplayObjectContainer = null ):void
		{
			var appInfo:AppInfo = AppConstant.getAppinfoByAppName( appName );
			preTurnModule( appInfo, data, openTable, parentContiner, false, true );
		}
		
		/**
		 * 打开某个app如果app当前是显示状态。则不关闭 
		 * @param appInfo		指定打开哪个面板
		 * @param data			打开时给面板传入的参数
		 * @param openTable		要打开面板的哪个标签页 ,确定面板里调用了setMainTableBar方法设置主tableBar
		 * @author 卢国征 2015-5-22
		 */		
		public static function showAppNoHide( appName:String, data:Object = null, openTable:String = "", parentContiner:DisplayObjectContainer = null ):void
		{
			var appInfo:AppInfo = AppConstant.getAppinfoByAppName( appName );
			preTurnModule( appInfo, data, openTable, parentContiner, true, false);
		}
		
		/**
		 * 隐藏某个app 
		 * @author 卢国征 2015-5-22
		 */		
		public static function hideApp( appName:String ):void
		{
			var appPanel:AppPanel = _moduleMap.getValue( appName );
			
			if(appPanel != null)
				appPanel.hide();
		}
		
		/**
		 * 显示引导关闭面板 
		 * @param appInfo
		 * @param isShowBg
		 * @author 卢国征 2015-5-22
		 */		
		public static function showCloseGuide( appName:String, isShowBg:Boolean, bgAlpha:Number ):void
		{
			if( isAppInScene( appName ) )
			{
				var appPanel:AppPanel = _moduleMap.getValue( appName );
				if( appPanel != null )
					appPanel.showCloseGuide(isShowBg,bgAlpha);
			}
		}
		
		/**
		 * 获取app的宽 
		 * @author 卢国征 2015-5-22
		 */		
		public static function getAppWidth( appName:String ):Number
		{
			var appPanel:AppPanel = _moduleMap.getValue( appName );
			if( appPanel != null )
				return appPanel.getAppWidth();
			
			return 0;
		}
		
		/**
		 * 获取app 的高 
		 * @author 卢国征 2015-5-22
		 */		
		public static function getAppHeight( appName:String ):Number
		{
			var appPanel:AppPanel = _moduleMap.getValue( appName );
			if( appPanel != null )
				return appPanel.getAppHeight();

			return 0;
		}
		
		/**
		 * 获取app 的x
		 * @author 卢国征 2015-5-22
		 */		
		public static function getAppPosX( appInfo:AppInfo ):Number
		{
			var appPanel:AppPanel = _moduleMap.getValue( appInfo.appName );
			if(appPanel != null)
				return appPanel.appPosX;
			
			return 0;
		}
		
		/**
		 * 获取app 的y 
		 * @author 卢国征 2015-5-22
		 */		
		public static function getAppPosY( appInfo:AppInfo ):Number
		{
			var appPanel:AppPanel = _moduleMap.getValue( appInfo.appName );
			if( appPanel != null )
				return appPanel.appPosY;

			return 0;
		}
		
		/**
		 * 设置面板的X坐标
		 * @param appName
		 * @param value
		 * @author 卢国征 2015-5-22
		 */		
		public static function setAppPosX( appName:String, value:int ):void
		{
			var appPanel:AppPanel = _moduleMap.getValue( appName );
			if( appPanel != null )
				appPanel.setAppPosX( value );
		}
		
		/**
		 * 设置面板的Y坐标
		 * @param appName
		 * @param value
		 * @author 卢国征 2015-5-22
		 */		
		public static function setAppPosY( appName:String, value:int ):void
		{
			var appPanel:AppPanel = _moduleMap.getValue( appName );
			if( appPanel != null )
				appPanel.setAppPosY(value);
		}
		
		/**
		 * 把app面板缓动到目标x坐标 
		 * @param appName
		 * @param value
		 * @author 卢国征 2015-5-22
		 */		
		public static function setAppTweenPosX( appName:String, value:int ):void
		{
			var appPanel:AppPanel = _moduleMap.getValue( appName );
			if( appPanel != null )
				appPanel.setAppTweenPosX(value);
		}
		
		/**
		 * 把app面板缓动到目标Y坐标  
		 * @param appName
		 * @param value
		 * @author 卢国征 2015-5-22
		 */		
		public static function setAppTweenPosY( appName:String, value:int ):void
		{
			var appPanel:AppPanel = _moduleMap.getValue(appName);
			if( appPanel )
				appPanel.setAppTweenPosY(value);
		}
		
		/**
		 * 销毁一个面板，以后再次打开时会重新创建所有面板里的所有对象 
		 * @param appInfo
		 * @author 卢国征 2015-5-22
		 */		
		public static function dispose( appInfo:AppInfo ):void
		{
			var appPanel:AppPanel = _moduleMap.remove( appInfo.appName );
			if( appPanel != null )
			{
				appPanel.dispose();
				appPanel = null;
				
				GuiTheme.ins.popDynamicTexture(appInfo.resName);
			}
		}
		
		/**
		 * 关闭所有当前在舞台上显示的app 
		 * @author 卢国征 2015-5-22
		 */		
		public static function closeAllApp( unCloseArr:Array = null ):void
		{
			var arr:Array = _moduleMap.getValues();
			for each ( var appPanel:AppPanel in arr )
			{
				if( appPanel != null && appPanel.hasParent )
				{
					var isClose:Boolean = true;
					if( unCloseArr != null )
					{
						for each ( var appName:String in unCloseArr ) 
						{
							if( appPanel.appInfo.appName == appName )
							{
								isClose = false;
								continue;
							}
						}
					}
					if( isClose )
					{
						if( appPanel.appInfo.isSpecialInCloseAll == false )
							appPanel.hide();
					}
				}
			}
		}
		
		/**
		 * 判断某个app是否在舞台显示中。。。 
		 * @author 卢国征 2015-5-22
		 */		
		public static function isAppInScene( appName:String ):Boolean
		{
			var appPanel:AppPanel = _moduleMap.getValue( appName );
			if( appPanel != null )
			{
				if( appPanel.isShowing() )
					return true;
			}
			return false;
		}
		
		/**
		 * 判断当前是否有app是在打开状态 
		 * @author 卢国征 2015-5-22
		 */		
		public static function isHaveAppShowing():Boolean
		{
			var arr:Array = _moduleMap.getValues();
			for each ( var appPanel:AppPanel in arr )
			{
				if( appPanel != null && appPanel.hasParent )
				{
					return true;
				}
			}
			return false;
		}
		
		/**
		 * 把一个app面板设置到所在父容器的最顶层
		 * @param appName
		 * @author 卢国征 2015-5-22
		 */
		public static function bringToTop( appName:String ):void
		{
			if( isHaveAppShowing() )
			{
				var appPanel:AppPanel = _moduleMap.getValue( appName );
				if( appPanel != null )
					appPanel.bringToTop();
			}
		}
		
		/**
		 * 判断指定的坐标点是否和面板有碰撞,
		 * 可以用来判断当前鼠标是否点击了某个面板 
		 * @param appName	要判定的面板名称
		 * @param xPos		要判定的x坐标
		 * @param yPos		要判定的y坐标
		 * @author 卢国征 2015-5-22
		 */		
		public static function hitTestApp( appName:String, xPos:Number, yPos:Number ):Boolean
		{
			if( isAppInScene( appName ) )
			{
				var appPanel:AppPanel = _moduleMap.getValue( appName );
				if( appPanel != null )
					return appPanel.hitTest(xPos, yPos);
			}
			return false;
		}
		
		/**
		 * 判断是否可显示面板
		 * @param appInfo
		 * @param data
		 * @param openTable
		 * @param parentContiner
		 * @param isCloseAll
		 * @param isAutoHide
		 * @author 卢国征 2015-5-22
		 */		
		private static function preTurnModule( appInfo:AppInfo, data:Object, openTable:String, parentContiner:DisplayObjectContainer, isCloseAll:Boolean, isAutoHide:Boolean ):void
		{GameLog.addShow("showApp-2");
			if( AppOpenUtil.isCanOpenApp(appInfo.appName,data,openTable) )
				turnModule( appInfo, data, openTable, parentContiner, isCloseAll, isAutoHide );
		}
		
		/**
		 * 判断显示面板、加载面板等
		 * @param appInfo		要打开的app信息
		 * @param data			给打开的app传递的参数
		 * @param isCloseAll	是否要关闭掉其他已打开的app
		 * @param isAutoHide	如果要打开的app已经是在打开状态，是否要执行对打开的app执行关闭
		 * @author 卢国征 2015-5-22
		 */		
		private static function turnModule( appInfo:AppInfo, data:Object, openTable:String, parentContiner:DisplayObjectContainer, isCloseAll:Boolean, isAutoHide:Boolean ):void
		{GameLog.addShow("showApp-3");
			if( appInfo != null )
			{
				var moduleName:String = appInfo.appName;
				var appPanel:AppPanel = _moduleMap.getValue( moduleName );
				if(appPanel)
				{GameLog.addShow("showApp-4");
					if(appPanel.isShowing() && isAutoHide)
					{GameLog.addShow("showApp-6");
						appPanel.hide();
					}
					else
					{GameLog.addShow("showApp-7");
						appPanel.init( data, openTable, parentContiner );
						toShowApp( appPanel, isCloseAll );
					}
				}
				else
				{GameLog.addShow("showApp-5");
					appPanel = new AppPanel( appInfo );
					appPanel.depth = _moduleMap.length;
					_moduleMap.add( moduleName, appPanel );
					appPanel.init( data, openTable, parentContiner );
					appPanel.setup();
				}
			}
		}
		
		/**
		 * 显示面板
		 * @param appPanel
		 * @param isCloseAll
		 * @author 卢国征 2015-5-22
		 */		
		private static function toShowApp( appPanel:AppPanel, isCloseAll:Boolean ):void
		{GameLog.addShow("showApp-8");
			appPanel.show();
		}
		
		/**
		 * 跳转面板
		 * 
		 * @author 甘能文 2017-5-17
		 * */
		public static function showAppById(windid:int,...args):void
		{GameLog.addShow("showApp-9");
			var winInfo:Q_windowInfo = WindowInfoData.getInfobyId(windid);
			if(winInfo!=null&&winInfo.q_islink==1)
			{
				AppManager.showApp(winInfo.q_windCodeId,winInfo.q_arg);
			}
		}
	}
}
