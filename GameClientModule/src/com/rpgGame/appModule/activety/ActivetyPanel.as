package com.rpgGame.appModule.activety
{
	import com.rpgGame.app.ui.TabBarPanel;
	import com.rpgGame.appModule.activety.boss.BossView;
	import com.rpgGame.appModule.activety.zonghe.ZongHeView;
	import com.rpgGame.coreData.cfg.active.ActivetyInfo;
	import com.rpgGame.coreData.enum.ActivityEnum;
	import com.rpgGame.coreData.enum.EmFunctionID;
	
	import org.mokylin.skin.app.activety.Activety_Skin;
	import org.mokylin.skin.component.tabbar.TabBarSkin_pack;
	
	import starling.display.DisplayObjectContainer;
	
	/**
	 *活动面板 
	 * @author dik
	 * 
	 */
	public class ActivetyPanel extends TabBarPanel
	{
		private var _skin:Activety_Skin;
		public function ActivetyPanel()
		{
			_skin=new Activety_Skin();
			super(_skin);
			_skin.tabBar.btnWidth=80;
		}
		
		override protected function initTabBarDatas():void
		{
			addTabDatas(TabBarSkin_pack,ZongHeView,EmFunctionID.EM_HUODONGDATING);
			addTabDatas(TabBarSkin_pack,BossView,EmFunctionID.EM_BOSS_ACT);
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			var funcKey:String=openTable;
			if(data&&funcKey!=""){
				var info:ActivetyInfo=data as ActivetyInfo;
				if(info){
					funcKey=info.actCfg.q_trans_funcID;
				}
			}
			super.show(data,funcKey,parentContiner);
		}
	}
}