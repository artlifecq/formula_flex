package com.rpgGame.appModule.die
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.clientConfig.Q_die;
	
	import flash.utils.getTimer;
	
	import away3d.events.Event;
	
	import org.mokylin.skin.app.siwangfuhuo.TiaoZhanShiBai_Skin;
	
	import starling.display.DisplayObject;
	
	public class ZoneDiePanel extends SkinUIPanel
	{
		private var _skin:TiaoZhanShiBai_Skin;
		private var _listContent:ContentList;
		private var _timer:GameTimer;
		private var _endTime:int;
		public function ZoneDiePanel():void
		{
			_skin = new TiaoZhanShiBai_Skin();
			super(_skin);
			initView();
			
			_timer=new GameTimer("ZoneDiePanel",1000);
			_timer.onUpdate=onTimer;
		}
		
		private function onTimer():void
		{
			// TODO Auto Generated method stub
			var diff:int=(_endTime-getTimer())/1000;
			if(diff>0)
			{
				_skin.lbXiaoshi.text=diff+"秒后消失";
			}
			else
			{
				_timer.stop();
				DungeonSender.reqQuitDungeon();
				this.hide();
			}
		}
		override protected function onShow():void
		{
			super.onShow();
			_endTime=getTimer()+10000;
			onTimer();
			_timer.start();
		}
		override protected function onHide():void
		{
			super.onHide();
			if (_timer.running) 
			{
				_timer.stop();
			}
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