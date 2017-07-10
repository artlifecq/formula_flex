package com.rpgGame.appModule.guild.war
{
	import com.rpgGame.app.ui.common.BgListItemRender;
	
	import org.mokylin.skin.app.banghui.wangcheng.WangChengJieSuan_Item;

	/**
	 *
	 *@author dik
	 *2017-7-3
	 **/
	public class WczbResultItemRender extends BgListItemRender
	{
		public function WczbResultItemRender()
		{
		}
		
		override protected function initialize():void
		{
			_skin=new WangChengJieSuan_Item();
			_skin.toSprite(this);
		}
		
		private function get skin():WangChengJieSuan_Item
		{
			return _skin as WangChengJieSuan_Item;
		}
		
		override protected function commitData():void
		{
			super.commitData();
		}
	}
}