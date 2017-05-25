package com.rpgGame.appModule.dungeon.multy
{
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	
	import org.mokylin.skin.app.fuben.FuBenTanKuang2;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;

	/**
	 * 副本进入提示框
	 * @author yt
	 * 
	 */
	public class MultyEnterPanel extends SkinUIPanel
	{
		private var _skin :FuBenTanKuang2;
		public function MultyEnterPanel()
		{
			_skin=new FuBenTanKuang2();
			super(_skin);
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
		}
		
		override public function hide():void 
		{
			super.hide();
		}
		override protected function onTouchTarget(target:DisplayObject):void 
		{
			super.onTouchTarget(target);
			
			switch (target) {
				case _skin.btn_ok:
					this.hide();
					AppManager.showApp(AppConstant.MULTYSURE_PANL);
					break;
				case _skin.btn_cancel:
					this.hide();
					break;
			}
			
		}
		
		
		
	}
}