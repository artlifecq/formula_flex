package com.rpgGame.app.ui.main.buttons
{
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.ui.tip.RTNodeID;
	import com.rpgGame.coreData.cfg.NewFuncCfgData;
	import com.rpgGame.coreData.enum.EmFunctionID;
	
	public class MainButton_Gang extends MainButtonBases/*MainButtonBases*/
	{
		public function MainButton_Gang()
		{
			super();
			SkinUI.addNode(null,RTNodeID.MAIN_SOCAIL,this,60,null,false);
		}
		
		override protected function triggeredHanadler():void
		{
			if(GuildManager.instance().haveGuild){
				FunctionOpenManager.openByBtnInfo(_btnInfo);
			}else{
				FunctionOpenManager.openPanelByFuncInfo(NewFuncCfgData.getFuncCfg(EmFunctionID.EM_BANGHUI_LIEBIAO));
			}
		}
		
//		private var _helpPoint:Point;
//		override protected function initialize():void
//		{
//			this.styleClass = ButtonSkin_shejiao;
//			_helpPoint = new Point();
//			super.initialize();
//			SkinUI.addNode(null,RTNodeID.MAIN_SOCAIL,this,60,null,false,null,true);
//		}
//		override protected function triggeredHanadler():void
//		{
//			if(NativieSocietyPanel.GetInstance().parent==null)
//			{
//				_helpPoint.x = this.width/2;
//				_helpPoint.y = 0;
//				_helpPoint = this.localToGlobal(_helpPoint);
//				NativieSocietyPanel.GetInstance().show(_helpPoint.x,_helpPoint.y);
//			}
//			else
//				NativieSocietyPanel.GetInstance().close();
//		}
	}
}