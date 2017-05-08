package com.rpgGame.appModule.skill
{
	import com.rpgGame.app.ui.SkinUIPanel;
	
	import feathers.controls.Radio;
	import feathers.core.ToggleGroup;
	
	import org.mokylin.skin.app.wuxue.Wuxue_Daohang;
	import org.mokylin.skin.app.wuxue.Wuxue_Skin;
	import org.mokylin.skin.app.wuxue.jineng.jineng_Skin;
	import org.mokylin.skin.app.wuxue.juexue.Juexue_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.events.Event;
	
	/**
	 *武学面板 
	 * @author dik
	 * 
	 */
	public class SkillPanel extends SkinUIPanel
	{
		private var _skin:Wuxue_Skin;
		
		private var _skillStudyView:SkillStudyView;
		private var _lostskillView:LostSkillView;
		private var _navSkin:Wuxue_Daohang;
		private var _radioGroup:ToggleGroup;
		
		public function SkillPanel()
		{
			_skin=new Wuxue_Skin();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skillStudyView=new SkillStudyView(_skin.jineng.skin as jineng_Skin,this);
			_lostskillView = new LostSkillView(_skin.juexue.skin as Juexue_Skin,this);
			_navSkin=_skin.daohang.skin as Wuxue_Daohang;
			_radioGroup = Radio.RADIO_GROUP_NAMES[_navSkin.btn_jineng.groupName];
			_radioGroup.addEventListener(Event.CHANGE,selectChangeHandler);
			
		}
		
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			if(openTable =="lostskill")
			{
				_radioGroup.selectedIndex = 1;
			}else{
				_radioGroup.selectedIndex = 0;
			}
			
			selectChangeHandler();
		}
		
		override public function hide():void
		{
			super.hide();
			_skillStudyView.onHide();
			_lostskillView.onHide();
		}
		
		private function selectChangeHandler():void
		{
			switch(_radioGroup.selectedItem){
				case _navSkin.btn_jineng:
					_skin.jineng.visible=true;
					_skin.juexue.visible = false;
					_lostskillView.onHide();
					_skillStudyView.onShow();
					break;
				case _navSkin.btn_juexue:
					_skin.jineng.visible=false;
					_skin.juexue.visible = true;
					_lostskillView.onShow();
					_skillStudyView.onHide();
					break;
			}
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(_skillStudyView.onTouchTarget(target)){
				return;
			}
		}
	}
}