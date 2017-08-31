package com.rpgGame.appModule.vip
{
	import com.rpgGame.core.ui.SkinUI;
	
	import org.mokylin.skin.app.vip.VipsMiaoshu;
	
	public class VipTQCellRender extends SkinUI
	{
		private var _skin:VipsMiaoshu;
		public function VipTQCellRender()
		{
			_skin=new VipsMiaoshu();
			super(_skin);
		}
		public function setData(data:String):void
		{
			this._skin.lbDec.text=data;
		}
	}
}