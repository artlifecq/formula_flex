package com.rpgGame.appModule.skill
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.tab.FuncTabBar;
	import com.rpgGame.app.ui.tab.UITabBarData;
	import com.rpgGame.coreData.enum.EmFunctionID;
	
	import org.mokylin.skin.app.wuxue.Wuxue_Skin;
	import org.mokylin.skin.app.wuxue.button.ButtonJineng;
	import org.mokylin.skin.app.wuxue.button.ButtonJuexue;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	/**
	 *武学面板 
	 * @author dik
	 * 
	 */
	public class SkillPanel extends SkinUIPanel
	{
		private var _skin:Wuxue_Skin;
		
		private var _tabStyles:Array=[ButtonJineng,ButtonJuexue];
		private var _viewStyles:Array=[SkillStudyView,LostSkillView];
		private var _funcId:Array=[EmFunctionID.EM_JINENG,EmFunctionID.EM_JUEXUE];
		private var _tabBar:FuncTabBar;
		
		public function SkillPanel()
		{
			_skin=new Wuxue_Skin();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			var tabDatas:Vector.<UITabBarData>=new Vector.<UITabBarData>();
			var num:int=_tabStyles.length;
			for (var i:int = 0; i <num; i++) 
			{
				var item:UITabBarData=new UITabBarData(_tabStyles[i],_viewStyles[i]);
				item.tabKey=_funcId[i];//标签键为功能id
				tabDatas.push(item);
			}
			
			_tabBar=new FuncTabBar(_skin.tabBar,tabDatas);
		}
		
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			_tabBar.show(data,openTable);
		}
		
		override public function hide():void
		{
			super.hide();
			_tabBar.hide();
		}
	}
}