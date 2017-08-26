package com.rpgGame.appModule.role
{
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	
	import org.mokylin.skin.app.baoguo.BaoGuo_Skin;
	
	import starling.display.DisplayObject;
	
	public class BaoGuoTiShiPanel extends SkinUIPanel
	{
		private var _skin:BaoGuo_Skin;
		public function BaoGuoTiShiPanel()
		{
			_skin=new BaoGuo_Skin();
			super(_skin);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.btnDuanzao:
					onToDu(1);
					this.hide();
					break;
				case _skin.btnChushou:
					onToDu(2);
					this.hide();
					break;
				case _skin.btnZhengli:
					onToDu(3);
					this.hide();
					break;
				case _skin.chkTips:
//					_skin.chkTips.isSelected=!_skin.chkTips.isSelected;
					BackPackManager.instance.isshowBaoGuoTiShi=!_skin.chkTips.isSelected;
					break;
			}
		}
		
		private function onToDu(type:int):void
		{
			switch(type){
				case 1:
					FunctionOpenManager.openAppPaneById("20",null,false);
					break;
				case 2:
					FunctionOpenManager.openAppPaneById("1",3,false);
					break;
				case 3:
					FunctionOpenManager.openAppPaneById("1",4,false);
					break;
			}
		}
	}
}