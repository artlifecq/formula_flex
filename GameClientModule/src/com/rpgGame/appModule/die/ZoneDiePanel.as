package com.rpgGame.appModule.die
{
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.clientConfig.Q_die;
	
	import away3d.events.Event;
	
	import org.mokylin.skin.app.siwangfuhuo.TiaoZhanShiBai_Skin;
	
	import starling.display.DisplayObject;
	
	public class ZoneDiePanel extends SkinUIPanel
	{
		private var _skin:TiaoZhanShiBai_Skin;
		private var _listContent:ContentList;
		public function ZoneDiePanel():void
		{
			_skin = new TiaoZhanShiBai_Skin();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_listContent = new ContentList(600,205);
			this.addChild(_listContent);
			_listContent.list.addEventListener(Event.CHANGE,changeHandler);
			_listContent.x = 50;
			_listContent.y = 175;
		}
		private function changeHandler(e:Event):void
		{
			var item:Q_die = _listContent.list.selectedItem as Q_die;
			if(item==null)
				return ;
			SceneSwitchManager.needOpenNewFuncId = item.q_panel;
			DungeonSender.reqQuitDungeon();
			this.hide();
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target == _skin.btn_ok)
			{
				DungeonSender.reqQuitDungeon();
				this.hide();
			}
		}
	}
}