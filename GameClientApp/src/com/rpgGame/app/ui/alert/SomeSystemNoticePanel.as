package com.rpgGame.app.ui.alert
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.app.AppInfo;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.utils.UIUtil;
	import com.rpgGame.coreData.enum.EmFunctionID;
	
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.common.alert.AlertUp;
	
	import starling.display.DisplayObject;
	
	public class SomeSystemNoticePanel extends SkinUIPanel
	{
		public static const SYS_HORSE:int=1;
		public static const SYS_SKILL:int=2;
		public static const SYS_ZHANHUN:int=3;
		private static const TIME_OUT:int=10*60*1000;
		private static const timeHash:HashMap=new HashMap();
		private static const pool:Array=[];
		private var _skin:AlertUp;
		private var _data:Object;
		private static const _showDic:Dictionary=new Dictionary();
		private static const _functionIdList:Object = {1:EmFunctionID.EM_ZUOQI,
			2:EmFunctionID.EM_JINENG,
			3:EmFunctionID.EM_ZHANHUN};
		public function SomeSystemNoticePanel()
		{
			_skin=new AlertUp();
			super(_skin);
		}
		/**
		 * obj类型数据包含以下属性 sys:系统id自定义，desc:描述，btnText:按钮描述，callBack:点击按钮回调
		 * @param data 
		 * 
		 */		
		private function setData(data:Object):void
		{
			this._data=data;
			var sys:int=_data.sys;
			var desc:String=_data.desc;
			var btnLab:String=_data.btnText;
			
			var url:String="";
			switch(sys)
			{
				case SYS_HORSE:
				{
					url="ui/common/icon/erjikuang/zuoqijinjie.png";
					break;
				}
					
				default:
				{
					url="ui/common/icon/erjikuang/zuoqijinjie.png";
					break;
				}
			}
			
			_skin.icons.styleName=url;
			_skin.labContent.text=desc;
			_skin.btn_ok.label=btnLab;
			_skin.chk_ok.isSelected=false;
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			if (target==_skin.btn_ok) 
			{
				if (_data.callBack) 
				{
					_data.callBack();
				}else{
					var id:String  = _functionIdList[_data.sys] as String;
					FunctionOpenManager.openAppPaneById(id,null,false);
				}
				hide();
			}
			super.onTouchTarget(target);
		}
		override protected function onHide():void
		{
			super.onHide();
			if (_skin.chk_ok.isSelected) 
			{
				timeHash.put(_data.sys,getTimer());
			}
			else
			{
				timeHash.remove(_data.sys);
			}
			delete _showDic[_data.sys];
			_data=null;
			pool.push(this);
			
		}
		public static function addEvent():void
		{
			EventManager.addEvent(MainPlayerEvent.SYS_CAN_LEVEL_UP,onShowNotice);
		}
		public static function checkInBlack(sys:int):Boolean
		{
			var time:int=timeHash.getValue(sys);
			if (time==0) 
			{
				return false;
			}
			if (getTimer()-time<TIME_OUT) 
			{
				return true;
			}
			timeHash.remove(sys);
			return false;
		}
		private static function onShowNotice(...arg):void
		{
			// TODO Auto Generated method stub
			var data:Object=arg[0];
			if (checkInBlack(data.sys)) 
			{
				return;
			}
			
			if(checkPanleIsOpen(data.sys))
			{
				return ;
			}
			if (_showDic[data.sys]!=undefined) 
			{
				return;
			}
			var panel:SomeSystemNoticePanel=null;
			if (pool.length>0) 
			{
				panel=pool.pop();
			}
			else
			{
				panel=new SomeSystemNoticePanel();
			}
			StarlingLayerManager.appUILayer.addChild(panel);
			UIUtil.alignToStageRightBottom(panel);
			panel.setData(data);
			_showDic[data.sys]=1;
		}
		public static function checkPanleIsOpen(sys:int):Boolean
		{
			var id:String  = _functionIdList[sys] as String;
			var appinfo:AppInfo = FunctionOpenManager.getAppInfoByFunctionId(id);
			if(appinfo == null)
				return true;
			return AppManager.isAppInScene(appinfo.appName);
		}
		override protected function onStageResize(sw:int, sh:int):void
		{
			UIUtil.alignToStageRightBottom(this);
		}
	}
}