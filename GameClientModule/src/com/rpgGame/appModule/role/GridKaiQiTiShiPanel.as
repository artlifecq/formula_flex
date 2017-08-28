package com.rpgGame.appModule.role
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.rpgGame.app.manager.goods.GoodsContainerMamager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.type.EffectUrl;
	
	import org.mokylin.skin.app.msg.Grid_Kuang;
	
	import starling.display.DisplayObject;
	
	public class GridKaiQiTiShiPanel extends SkinUIPanel
	{
		private var _skin:Grid_Kuang;
		private var _bgeffContaner:Inter3DContainer;
		private var _bgEff : InterObject3D;
		public function GridKaiQiTiShiPanel()
		{
			_skin=new Grid_Kuang();
			super(_skin);
			_bgeffContaner=new Inter3DContainer();
			_skin.container.addChild(_bgeffContaner);
		}
		
		override protected function onShow():void
		{
			super.onShow();
			if(!_bgEff){
				_bgEff=_bgeffContaner.playInter3DAt(ClientConfig.getEffect(EffectUrl.GRID_OPEN),80,-13,0);
			}
			_bgEff.start();
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.ui_bg:
					if(GoodsContainerMamager.getMrg(ItemContainerID.BackPack).isMianFei)
						AppManager.showAppNoHide(AppConstant.ROLE_PANEL,1);
					else if(GoodsContainerMamager.getMrg(ItemContainerID.Storage).isMianFei)
						AppManager.showAppNoHide(AppConstant.ROLE_PANEL,2);
					else AppManager.showAppNoHide(AppConstant.ROLE_PANEL,1);
					this.hide();
					break;
			}			
		}
		
		override protected function onStageResize(sw : int, sh : int) : void
		{
			this._skin.container.x=(sw-this._skin.width*2-80);
			this._skin.container.y=(sh-this._skin.height*3-170);
		}
		
		override protected function onHide():void
		{
			super.onHide();
			if(_bgEff)_bgEff.stop();
		}
	}
}