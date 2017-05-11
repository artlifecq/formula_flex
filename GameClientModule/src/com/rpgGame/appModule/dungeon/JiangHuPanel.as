package com.rpgGame.appModule.dungeon
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.appModule.common.ViewUI;
	import com.rpgGame.appModule.dungeon.lunjian.LunJianUI;
	
	import org.mokylin.skin.app.jianghu.JiangHu_Skin;
	
	import starling.display.DisplayObjectContainer;
	
	/**
	 *论剑副本入口面板
	 *@author dik
	 *2017-5-2下午6:04:06
	 */
	public class JiangHuPanel extends SkinUIPanel
	{
		private var _skin:JiangHu_Skin;
		private var tabUIs:Vector.<ViewUI>;
		private var _currentUI:ViewUI;
		
		public function JiangHuPanel()
		{
			_skin=new JiangHu_Skin();
			super(_skin);
			initUI();
		}
		
		private function initUI():void
		{
			tabUIs=new Vector.<ViewUI>();
			tabUIs.push(new LunJianUI());
			
		}
		
		private function set currentUI(value:ViewUI):void
		{
			if(_currentUI){
				_currentUI.removeFromParent();
			}
			_currentUI = value;
			this.addChild(_currentUI);
			if(_data){
				_currentUI.show(_data.data);
			}else{
				_currentUI.show();
			}
		}
		
		private function showTab(index:int):void
		{
//			tabBtn[index].isSelected=true;
			if(index!=-1){
				currentUI=tabUIs[index];
			}			
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			
			if(!data){
				showTab(0);
			}else{
				showTab(data.tab);
			}
		}
		
		override public function hide():void
		{
			super.hide();
		}
	}
}