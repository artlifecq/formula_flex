package com.rpgGame.app.ui.main.buttons
{
	import com.rpgGame.app.manager.fightsoul.FightSoulManager;
	import com.rpgGame.app.ui.main.navigation.NativieSocietyPanel;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.ui.tip.RTNodeID;
	import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
	
	import flash.geom.Point;
	
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_shejiao;
	
	public class MainButton_Gang extends MainButtonBases
	{
		private var _helpPoint:Point;
		override protected function initialize():void
		{
			this.styleClass = ButtonSkin_shejiao;
			_helpPoint = new Point();
			super.initialize();
			SkinUI.addNode(null,RTNodeID.MAIN_SOCAIL,this,60,null,false,null,true);
		}
		override protected function triggeredHanadler():void
		{
			if(NativieSocietyPanel.GetInstance().parent==null)
			{
				_helpPoint.x = this.width/2;
				_helpPoint.y = 0;
				_helpPoint = this.localToGlobal(_helpPoint);
				NativieSocietyPanel.GetInstance().show(_helpPoint.x,_helpPoint.y);
			}
			else
				NativieSocietyPanel.GetInstance().close();
		}
	}
}