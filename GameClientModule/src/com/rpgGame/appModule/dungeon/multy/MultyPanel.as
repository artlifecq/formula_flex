package com.rpgGame.appModule.dungeon.multy
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.UITableGroup;
	import com.rpgGame.appModule.dungeon.equip.EquipDungeon;
	import com.rpgGame.appModule.dungeon.genuine.GenuineDungeon;
	
	import org.mokylin.skin.app.fuben.FuBen_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;


	/**
	 * 多人副本弹出面板
	 * @author YT
	 */	
	public class MultyPanel  extends SkinUIPanel
	{
		private var _skin :FuBen_Skin;
		private var _table:UITableGroup;
		public function MultyPanel()
		{
			_skin=new FuBen_Skin();
			super(_skin);
			initView();
		}
		private function initView():void
		{
			_table = new UITableGroup(_skin.tab_fuben,_skin.duoren_skin);
			_table.addModePane(new MultyView());
			_table.addModePane(new EquipDungeon());
			_table.addModePane(new GenuineDungeon());
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			_table.refeash(0);
		}
		
		override public function hide():void 
		{
			super.hide();
		}
		override protected function onTouchTarget(target:DisplayObject):void 
		{
			super.onTouchTarget(target);
			_table.crrentModePanle.onTouchTarget(target);
//			_multyView.onTouchTarget(target);
		}
		
		
		
		
	}
}