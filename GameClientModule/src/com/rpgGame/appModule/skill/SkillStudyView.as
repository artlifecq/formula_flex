package com.rpgGame.appModule.skill
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.role.HeroData;
	
	import feathers.controls.Scroller;
	
	import org.mokylin.skin.app.wuxue.jineng.JinengTitle_Skin;
	import org.mokylin.skin.app.wuxue.jineng.jineng_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Event;

	/**
	 *技能学习 
	 * @author dik
	 * 
	 */
	public class SkillStudyView
	{
		private var _skin:jineng_Skin;
		private var _skillContainer:Sprite;
		
		private var _jobTitle1:JinengTitle_Skin;
		private var _jobTitle2:JinengTitle_Skin;
		private var _jobTl1:Sprite;
		private var _jobTl2:Sprite;
		private var _lastSp:Sprite;
		
		public function SkillStudyView(skin:jineng_Skin)
		{
			_skin=skin;
			initView();
		}
		
		private function initView():void
		{
			this._skin.vs_bar.verticalScrollBarPosition = Scroller.VERTICAL_SCROLL_BAR_POSITION_RIGHT;
			this._skin.vs_bar.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			this._skin.vs_bar.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			this._skin.vs_bar.scrollBarDisplayMode = Scroller.SCROLL_BAR_DISPLAY_MODE_FIXED;
			_skillContainer=new Sprite();
			this._skin.vs_bar.width=550;
			this._skin.vs_bar.x=20;
			_jobTitle1=new JinengTitle_Skin();
			_jobTitle2=new JinengTitle_Skin();
			_jobTitle2.labelDisplay.text="其他技能";
			_jobTl1=_jobTitle1.toSprite();
			_jobTl2=_jobTitle2.toSprite();
			_jobTl2.y=320;
			_skillContainer.addChild(_jobTl1);
			_skillContainer.addChild(_jobTl2);
			
			var skills:Array=MainRoleManager.actorInfo.getActiveSpells();//已经学习的技能
			
//			skillNum=SpellDataManager.
			var skillNum:int;
			var job:int=MainRoleManager.actorInfo.job;
			var item:SkillItem;
			var i:int;
			var row:int;
			skillNum=skills.length;
			for(i=0;i<skillNum;i++){
				item=new SkillItem();
				row=Math.floor(i/2);
				item.y=row*(item.height+10)+40;
				_skillContainer.addChild(item);
				if(i%2==0){
					item.x=10;
				}else{
					item.x=item.width+30;
				}
			}
			_skin.jinjie.visible=false;
			skillNum=SpellDataManager.otherSpells.length;
			skillNum=3;
			for(i=0;i<skillNum;i++){
				item=new SkillItem();
				row=Math.floor(i/2);
				item.y=row*(item.height+10)+360;
				_skillContainer.addChild(item);
				if(i%2==0){
					item.x=10;
				}else{
					item.x=item.width+30;
				}
			}
			_lastSp=new Sprite();
			_lastSp.y=item.y+item.height;
			_skillContainer.addChild(_lastSp);
			this._skin.vs_bar.addChild(_skillContainer);
		}
		
		public function onTouchTarget(target:DisplayObject):Boolean
		{
			return false;
		}
		
		public function onShow():void
		{
			updateZhenqi();
			_skin.tab_zizhi.addEventListener(Event.CHANGE, onTab);
		}
		
		private function updateZhenqi():void
		{
			var _roleData:HeroData=MainRoleManager.actorInfo;
			_skin.pro_zhenqi.maximum=_roleData.maxZhenqi;
			_skin.pro_zhenqi.value=_roleData.curZhenqi;
			_skin.lb_zhenqi.text=_roleData.curZhenqi+"/"+_roleData.maxZhenqi;			
		}
		
		public function onHide():void
		{
			_skin.tab_zizhi.removeEventListener(Event.CHANGE, onTab);
		}
		
		private function onTab(e:Event):void
		{
			_skin.jinjie.visible=_skin.tab_zizhi.selectedIndex!=0;
			_skin.shengji.visible=!_skin.jinjie.visible;
		}
	}
}