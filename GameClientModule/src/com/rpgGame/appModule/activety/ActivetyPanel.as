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
		private var _tabTypes:Array=[ActivityEnum.ZONGHE_ACT,ActivityEnum.BOSS_ACT];
		private var _funcIds:Array=[EmFunctionID.EM_HUODONGDATING,EmFunctionID.EM_BOSS_ACT];
		
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
			var funcKey:String=_funcIds[0];
			if(data){
				var info:ActivetyInfo=data as ActivetyInfo;
				var index:int=0;
				index=_tabTypes.indexOf(info.actCfg.q_activity_type);
				if(index==-1){
					index=0;
				}
				funcKey=_funcIds[index];
			}
			super.show(data,funcKey,parentContiner);
		}
	}
}