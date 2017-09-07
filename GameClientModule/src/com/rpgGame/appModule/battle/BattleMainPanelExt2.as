package com.rpgGame.appModule.battle
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.appModule.battle.jjzb.JJBattlePanelExt;
	import com.rpgGame.appModule.social.team.TeamMainPanelExt;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	
	import away3d.events.Event;
	
	import org.mokylin.skin.app.zhanchang.ZhanChang_Skin;
	
	import starling.display.DisplayObjectContainer;
	
	public class BattleMainPanelExt2 extends SkinUIPanel
	{
		public static const SUB_DIANFENG:String="0";
		public static const SUB_JJZB:String="1";
	
		
		protected var _skin : ZhanChang_Skin;
		
		
		private var _subJJZB:JJBattlePanelExt;
		private var _subDFDJ:*;
		private var _curView:SkinUI;
		
		public function BattleMainPanelExt2()
		{
			this._skin = new ZhanChang_Skin();
			super(_skin);
			
			regEvent();
		}
		private function regEvent():void
		{
			this._skin.tabBar.addEventListener(Event.CHANGE,onTab);
		}
		
		private function onTab(eve:Event):void
		{
			// TODO Auto Generated method stub
			showSubView(_skin.tabBar.selectedIndex);
		}
		private function showSubView(type:int):void
		{
			var sub:SkinUI;
			if (type==0) 
			{
				sub=subDFDJ;
			}
			else
			{
				sub=subJJZB;
			}
			if (_curView==sub) 
			{
				return;
			}
			if (_curView) 
			{
				MCUtil.removeSelf(_curView);
				//Object(_curView).onHide();
			}
			_curView=sub;
			this.addChild(_curView);
			
		}
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void 
		{
			super.show(data, openTable, parentContiner);
			var sub:int=openTable;
			if (sub==0&&_curView==null) 
			{
				showSubPanel(SUB_DIANFENG);
			}
			else
			{
				showSubPanel(sub.toString());
			}
		}
		
		private function showSubPanel(sub:String):void
		{
			// TODO Auto Generated method stub
			this._skin.tabBar.selectedIndex=int(sub);
		}
		
		public function get subJJZB():JJBattlePanelExt
		{
			if (!_subJJZB) 
			{
				_subJJZB=new JJBattlePanelExt();
			}
			return _subJJZB;
		}

		public function get subDFDJ():*
		{
			return _subDFDJ;
		}


	}
}