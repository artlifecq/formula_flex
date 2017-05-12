package com.rpgGame.app.ui.roll
{
	import com.rpgGame.netData.drop.bean.RollResultInfo;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.mokylin.skin.app.roll.Roll_Item;
	
	public class RollGetScoreCell extends DefaultListItemRenderer
	{
		public function RollGetScoreCell():void
		{
			super();
		}
		private var _skin:Roll_Item;
		override protected function initialize():void
		{
			_skin = new Roll_Item();
			_skin.toSprite(this);
			this.setSize(_skin.width,_skin.height);
		}
		
		override protected function commitData():void
		{
			var info:RollResultInfo = this.data as RollResultInfo;
			_skin.labelDisplay.text = info.playerName+":"+info.throwPoint+"点";
		}
	}
}