package com.rpgGame.app.ui.main.buttons
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.NewFuncCfgData;
	import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
	import com.rpgGame.coreData.clientConfig.Q_newfunc;
	import com.rpgGame.coreData.role.HeroData;
	
	import flash.system.ApplicationDomain;
	
	import away3d.events.Event;
	
	import feathers.controls.Button;
	
	import org.client.mainCore.ds.HashMap;
	
	import starling.display.ButtonState;
	
	public class MainButtonBases extends Button
	{
		/**
		 * 模块代码包路径
		 */
		private static const APP_ROOT:String="com.rpgGame.app.ui.main.buttons";
		private var _info:FunctionBarInfo;

		public function get info():FunctionBarInfo
		{
			return _info;
		}

		public function MainButtonBases(info:FunctionBarInfo):void
		{
			_info = info;
			super();
		}
		
		override protected function feathersControl_addedToStageHandler(event:Event):void
		{
			super.feathersControl_addedToStageHandler(event);
			onShow();
		}
		
		protected function onShow():void
		{
			
		}
		
		override protected function feathersControl_removedFromStageHandler(event:Event):void
		{
			super.feathersControl_removedFromStageHandler(event);
			onHite();
		}
		
		protected function onHite():void
		{
			
		}
		
		override protected function initialize():void
		{
			if (!ClientConfig.isBanShu&&_info.tips!="")
			{
				TipTargetManager.show(this, TargetTipsMaker.makeSimpleTextTips(_info.tips));
			}
		}
		override protected function changeState(state:String):void
		{
			var oldState:String = this._currentState;
			if(oldState === state)
			{
				return;
			}
			super.changeState(state);
			if(state == ButtonState.DOWN)
			{
				triggeredHanadler();
			}
		}
		
		protected function triggeredHanadler():void
		{
			if(_info.clickarg=="")
				return ;
			if(_info.clickType==1)
			{
				AppManager.showApp(_info.clickarg);
			}
		}
		
		public function canOpen():Boolean
		{
			return getOpenLevelByFunBarInfo(_info)<MainRoleManager.actorInfo.totalStat.level;
		}
		
		private static var _classMap:HashMap;
		private static var _initializeMap:HashMap;
		public static function init():void
		{
			_initializeMap = new HashMap();
			_classMap = new  HashMap();
			regClass(1,"MainButton_Role");
			regClass(2,"MainButton_Bag");
			regClass(3,"MainButton_Mount");
			regClass(4,"MainButton_Equip");
			regClass(5,"MainButton_Fightsoul");
			regClass(6,"MainButton_Kongfu");
			regClass(7,"MainButton_Gang");
			regClass(8,"MainButton_Shop");
		}
		private static function regClass(id:int,cls:String):void
		{
			_classMap.add(id,cls);
		}
		
		public static function getButtonBuyInfo(info:FunctionBarInfo):MainButtonBases
		{
			var heroinfo:HeroData=MainRoleManager.actorInfo;
			if(getOpenLevelByFunBarInfo(info)>heroinfo.totalStat.level)
				return null;
			var button:MainButtonBases = _initializeMap.getValue(info.id);
			if(button == null)
			{
				var cls : Class = ApplicationDomain.currentDomain.getDefinition(APP_ROOT+"."+_classMap.getValue(info.id)) as Class;
				button = new cls(info);
				_initializeMap.add(info.id,button);
			}
			return button;
		}
		
		public static function getOpenLevelByFunBarInfo(info:FunctionBarInfo):int
		{
			var list:Array = NewFuncCfgData.getListById(info.id);
			if(list==null)
				return 0;
			var value:int = int.MAX_VALUE;
			for each(var func:Q_newfunc in list)
			{
				value = Math.min(func.q_level,value);
			}
			return value;
		}
	}
}