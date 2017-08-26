package com.rpgGame.app.ui.alert
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.app.AppInfo;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.utils.UIUtil;
	import com.rpgGame.coreData.enum.EmFunctionID;
	
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	import org.mokylin.skin.common.alert.AlertUp;
	
	import starling.display.DisplayObject;
	
	public class SomeSystemNoticePanel extends SkinUIPanel
	{
		
		public static const SYS_HORSE:String=EmFunctionID.EM_ZUOQI+"_0";
		public static const SYS_SKILLL_LEVEL_UP:String=EmFunctionID.EM_JINENG+"_0";
		public static const SYS_ZHANHUN:String=EmFunctionID.EM_ZHANHUN+"_0";
		public static const SYS_ZHANQI:String=EmFunctionID.EM_ZHANQI+"_0";
		public static const SYS_SKILLL_GRADE_UP:String=EmFunctionID.EM_JINENG+"_1";
		//勾选了10分钟弹一次
		private static const TIME_OUT_BLACK:int=10*60*1000;
		//没5分钟弹一次
		private static const  TIME_OUT_NORMAL:int=5*60*1000;
		private static const _normal_timeHash:HashMap=new HashMap();
		private static const _black_timeHash:HashMap=new HashMap();
		private static const pool:Array=[];
		private var _skin:AlertUp;
		private var _data:Object;
		private static const _showDic:Dictionary=new Dictionary();
		
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
			var sys:String=_data.sys;
			var desc:String=_data.desc;
			var btnLab:String=_data.btnText;
			_skin.chk_ok.isSelected=false;
			var url:String="";
			switch(sys)
			{
				case SYS_HORSE:
				{
					url="ui/icon/erjikuang/zuoqijinjie.png";
					break;
				}
				case SYS_ZHANQI:
				{
					url="ui/icon/erjikuang/zhanqijinjie.png";
					break;
				}
				case SYS_ZHANHUN:
				{
					url="ui/icon/erjikuang/zhanhun.png";
					break;
				}
				case SYS_SKILLL_LEVEL_UP:
				{
					url="ui/icon/erjikuang/skill1.png";
					break;
				}
				case SYS_SKILLL_GRADE_UP:
				{
					url="ui/icon/erjikuang/skill2.png";
					break;
				}
			}
			
			_skin.icons.styleName=url;
			_skin.labContent.text=desc;
			_skin.btn_ok.label=btnLab;
			_skin.chk_ok.isSelected=false;
			_normal_timeHash.put(sys,getTimer());
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			if (target==_skin.btn_ok) 
			{
				if (_data.callBack) 
				{
					_data.callBack();
				}
				else
				{
			
					switch(_data.sys)
					{
						case SYS_HORSE:
							FunctionOpenManager.openAppPaneById(EmFunctionID.EM_ZUOQI,null,false);
							break;
						case SYS_SKILLL_LEVEL_UP:
							FunctionOpenManager.openAppPaneById(EmFunctionID.EM_JINENG,null,false);
							break;
						case SYS_SKILLL_GRADE_UP:
							FunctionOpenManager.openAppPaneById(EmFunctionID.EM_JINENG,null,false);
							break;
						case SYS_ZHANHUN:
							FunctionOpenManager.openAppPaneById(EmFunctionID.EM_ZHANHUN,null,false);
							break;
						case SYS_ZHANQI:
							FunctionOpenManager.openAppPaneById(EmFunctionID.EM_ZHANQI,null,false);
							break;
					}
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
				_black_timeHash.put(_data.sys,getTimer());
				_normal_timeHash.remove(_data.sys);
			}
			else
			{
				_normal_timeHash.put(_data.sys,getTimer());
				_black_timeHash.remove(_data.sys);
			}
			delete _showDic[_data.sys];
			_data=null;
			pool.push(this);
			
		}
		public static  function isTimeLimite(sys:String):Boolean
		{
			var ret:Boolean=checkInBlack(sys)||checkNormalTime(sys);
			return ret;
		}
		private static function checkNormalTime(sys:String):Boolean
		{
			var time:int=_normal_timeHash.getValue(sys);
			if (time==0) 
			{
				return false;
			}
			if (getTimer()-time<TIME_OUT_NORMAL) 
			{
				return true;
			}
			_normal_timeHash.remove(sys);
			return false;
		}
		private static function checkInBlack(sys:String):Boolean
		{
			//普通
			var time:int=_black_timeHash.getValue(sys);
			if (time==0) 
			{
				return false;
			}
			if (getTimer()-time<TIME_OUT_BLACK) 
			{
				return true;
			}
			_black_timeHash.remove(sys);
			return false;
		}
		public  static function onShowNotice(...arg):void
		{
			// TODO Auto Generated method stub
			var data:Object=arg[0];
			if (isTimeLimite(data.sys)) 
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
		public static function checkPanleIsOpen(sys:String):Boolean
		{
			var id:String  =sys.split("_")[0];
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