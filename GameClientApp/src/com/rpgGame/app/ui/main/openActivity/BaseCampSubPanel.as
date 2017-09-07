package com.rpgGame.app.ui.main.openActivity
{
	import com.rpgGame.app.ui.main.openActivity.comps.ICampSub;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.info.openActivity.ActivityVo;
	
	import feathers.controls.StateSkin;
	
	public class BaseCampSubPanel extends SkinUI implements ICampSub
	{
		public function BaseCampSubPanel(skin:StateSkin=null)
		{
			super(skin);
		}
		
		public function setData(infos:Vector.<ActivityVo>):void
		{
		}
	}
}