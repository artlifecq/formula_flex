package com.rpgGame.app.ui.main.buttons
{
	import com.rpgGame.app.ui.main.navigation.NativieSocietyPanel;
	import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
	
	import flash.geom.Point;
	
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_shejiao;
	
	public class MainButton_Gang extends MainButtonBases
	{
		private var _helpPoint:Point;
		public function MainButton_Gang(info:FunctionBarInfo)
		{
			super(info);
		}
		override protected function initialize():void
		{
			this.styleClass = ButtonSkin_shejiao;
			_helpPoint = new Point();
			super.initialize();
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