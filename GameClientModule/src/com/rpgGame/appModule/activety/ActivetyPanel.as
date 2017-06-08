package com.rpgGame.appModule.activety
{
	import com.rpgGame.app.ui.TabBarPanel;
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
		private var _tabTypes:Array=[ActivityEnum.ZONGHE_ACT];
		private var _funcIds:Array=[EmFunctionID.EM_HUODONGDATING];
		
		public function ActivetyPanel()
		{
			_skin=new Activety_Skin();
			super(_skin);
		}
		
		override protected function initTabBarDatas():void
		{
			addTabDatas(TabBarSkin_pack,ActivetyInfoView,EmFunctionID.EM_HUODONGDATING);
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			var funcKey:String=_funcIds[0];
			if(data){
				var info:ActivetyInfo=data as ActivetyInfo;
				var index:int=0;
				index=_tabTypes.indexOf(info.cfg.q_activity_type);
				if(index==-1){
					index=0;
				}
				funcKey=_funcIds[index];
			}
			super.show(data,funcKey,parentContiner);
		}
	}
}