package com.rpgGame.app.ui.main.dungeon
{
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.mainui.fubenzhuizong.ShiJieBoss_Skin;
	
	import starling.display.DisplayObject;
	
	/**
	 *世界boss追踪 
	 * @author dik
	 * 
	 */
	public class BossTrackerUI extends DungeonTrackerUI
	{
		private var _skin:ShiJieBoss_Skin;
		private var iconList:Vector.<IconCDFace>;
		private var _bgList:Vector.<UIAsset>;
		
		public function BossTrackerUI()
		{
			_skin=new ShiJieBoss_Skin();
			super(_skin);
			initUI();
		}
		
		private function initUI():void
		{
			iconList=new Vector.<IconCDFace>();
			_bgList=new Vector.<UIAsset>();
			for(var i:int=0;i<4;i++){
				_bgList.push(_skin["sec_ico1_"+i]);
			}
		}
		
		private function updateView():void
		{
			_skin.sec_info.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_RED1,"下次刷新时间:14:00");
			_skin.lbHeadName.text="世界BOSS";
			_skin.uiYiTiaoZhan.visible=true;
			_skin.uiWeiJiSha.visible=true;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.sec_subbut1:
					break;
				case _skin.sec_subbut2:
					break;
			}
		}
		
		override protected function onShow() : void
		{
			
		}
		
		override protected function onHide():void
		{
			while(iconList.length>0){
				var icon:IconCDFace=iconList.pop();
				IconCDFace.releaseIcoFace(icon);
			}
		}
	}
}