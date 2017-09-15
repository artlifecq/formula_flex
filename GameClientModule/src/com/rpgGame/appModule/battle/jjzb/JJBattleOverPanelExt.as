package com.rpgGame.appModule.battle.jjzb
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.manager.StarlingLayerManager;
	
	import org.mokylin.skin.app.zhanchang.jingjichang.JJCOverSkin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class JJBattleOverPanelExt extends SkinUIPanel
	{
		
		public function JJBattleOverPanelExt()
		{
			super(new JJCOverSkin());
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			Mgr.jjBattleMgr.reqJumpOver();
			hide();
		}
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,StarlingLayerManager.topUILayer);
		}
		override protected function onStageResize(sw:int, sh:int):void
		{
			this.x=(sw-this.width)/2;
			this.y=sh-300;
		}
		override protected function onHide():void
		{
			super.onHide();
		}
	}
}