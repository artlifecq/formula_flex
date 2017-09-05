package com.rpgGame.app.ui.main.navigation
{
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.FuncionBarCfgData;
	import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
	import com.rpgGame.coreData.enum.EmFunctionID;
	
	import away3d.events.Event;
	
	import org.mokylin.skin.mainui.navigation.navigation_nv_Skin;
	
	import starling.display.DisplayObject;
	
	public class NativieSocietyPanel extends SkinUI
	{
		private static var _instance:NativieSocietyPanel;
		public static function GetInstance():NativieSocietyPanel
		{
			if( _instance == null )
				_instance = new NativieSocietyPanel();
			return _instance;
		}
		private var _skin:navigation_nv_Skin;
		public function NativieSocietyPanel():void
		{
			_skin = new navigation_nv_Skin();
			super(_skin); 
		}
		private var _fixPosx:Number;
		private var _fixPosy:Number;
		override protected function onShow():void
		{
			var height:Number = 40;
			if(FunctionOpenManager.functionIsOpen(EmFunctionID.EM_BANGHUI))
			{
				if(_skin.btn_n1.parent==null)
				{
					_skin.grpBtn_nv.addChild(_skin.btn_n1);
				}
				height = 66;
			}else{
				if(_skin.btn_n1.parent!=null)
				{
					_skin.grpBtn_nv.removeChild(_skin.btn_n1);
				}
			}
			if(FunctionOpenManager.functionIsOpen(EmFunctionID.EM_ZUDUI))
			{
				if(_skin.btn_n1.parent==null)
				{
					_skin.grpBtn_nv.addChild(_skin.btn_n2);
				}
				
			}else{
				if(_skin.btn_n1.parent!=null)
				{
					_skin.grpBtn_nv.removeChild(_skin.btn_n2);
				}
				
			}
//			this.height = height;
			_skin.nv_bg.height = height;
			this.x = _fixPosx -this.width/2;
			this.y = _fixPosy - height;
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.btn_n2:
					AppManager.showApp(AppConstant.SOCIAL_PANEL);
					break;
				case _skin.btn_n1:
					if(GuildManager.instance().haveGuild)
						FunctionOpenManager.openPanelByFuncID(EmFunctionID.EM_BANGHUI_INFO);
					else
						FunctionOpenManager.openPanelByFuncID(EmFunctionID.EM_BANGHUI_LIEBIAO);
					break;
			}
			close();
		}
		
		public function show(fixPosx:Number,fixPosy:Number):void
		{
			_fixPosx = fixPosx;
			_fixPosy = fixPosy;
			StarlingLayerManager.hintUILayer.addChild( this );
		}
		public function close():void
		{
			this.removeFromParent();
		}
		
		private function onHide(e:Event):void
		{
			this.removeEventListener(Event.REMOVED_FROM_STAGE,onHide);
		}
	}
}