package com.rpgGame.app.ui.main.buttons
{
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.FuncionBarCfgData;
	import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
	
	import flash.geom.Point;
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
		
		private var _needPlayFirstAm:Boolean = false;

		public function get needPlayFirstAm():Boolean
		{
			return _needPlayFirstAm;
		}

		public function set needPlayFirstAm(value:Boolean):void
		{
			_needPlayFirstAm = value;
		}

		
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
			this.visible = !_needPlayFirstAm;
		}
		
		
		override public function get width():Number
		{
			if(needPlayFirstAm)
				return 0;
			else
				return super.width;
		}
		
		override public function get height():Number
		{
			if(needPlayFirstAm)
				return 0;
			else
				return super.height;
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
			return FunctionOpenManager.getOpenLevelByFunBarInfo(_info);
		}
		
		private static var _classMap:HashMap;
		private static var _initializeMap:HashMap;
		public static function init():void
		{
			_initializeMap = new HashMap();
			_classMap = new  HashMap();
			regClass(1,"MainButton_Role");
			regClass(2,"MainButton_Mount");
			regClass(3,"MainButton_Equip");
			regClass(4,"MainButton_Kongfu");
			regClass(5,"MainButton_Fightsoul");
			regClass(6,"MainButton_Gang");
			regClass(7,"MainButton_Shop");
		}
		private static function regClass(id:int,cls:String):void
		{
			_classMap.add(id,cls);
		}
		
		public static function getButtonBuyInfo(info:FunctionBarInfo):MainButtonBases
		{
			var level:int = FunctionOpenManager.getOpenLevelByFunBarInfo(info);
			if(!FunctionOpenManager.checkOpenByLevel(level))
				return null;
			var button:MainButtonBases = _initializeMap.getValue(info.id);
			if(button == null)
			{
				var clsName:String = _classMap.getValue(info.id)
				var cls : Class = ApplicationDomain.currentDomain.getDefinition(APP_ROOT+"."+clsName) as Class;
				button = new cls(info);
				button.name = clsName;
				_initializeMap.add(info.id,button);
			}
			return button;
		}
		
		public static function getButtonName(id:int):String
		{
			return _classMap.getValue(id);
		}
		
		
		
		
		
	}
}