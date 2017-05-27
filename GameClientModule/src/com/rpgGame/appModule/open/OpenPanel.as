package com.rpgGame.appModule.open
{
	import com.rpgGame.app.ui.SkinUIPanel;
	
	import org.mokylin.skin.app.xingongneng.KaiQi_Skin;
	
	import starling.display.DisplayObjectContainer;
	
	public class OpenPanel extends SkinUIPanel
	{
		private var _skin:KaiQi_Skin;
		public function OpenPanel():void
		{
			_skin = new KaiQi_Skin();
			super(_skin);
		}
		
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
		}
	}
}