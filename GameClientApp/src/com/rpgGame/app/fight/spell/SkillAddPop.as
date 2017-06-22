package com.rpgGame.app.fight.spell
{
	import com.rpgGame.app.display2D.PopSkinUI;
	import com.rpgGame.app.manager.MainUIManager;
	import com.rpgGame.app.manager.ShortcutsManger;
	import com.rpgGame.app.ui.main.buttons.MainButtonManager;
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.enum.ShortcutsTypeEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.shortcuts.ShortcutsData;
	import com.rpgGame.coreData.lang.LangSpell;
	import com.rpgGame.netData.skill.bean.SkillInfo;
	
	import flash.geom.Point;
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;
	
	import feathers.controls.UIAsset;
	
	import gs.TweenLite;
	import gs.easing.Expo;
	
	import org.mokylin.skin.mainui.tishi.huode_Jineng;
	
	import starling.display.DisplayObject;
	
	/**
	 *技能获得飘窗 
	 * @author dik
	 * 
	 */
	public class SkillAddPop extends PopSkinUI
	{
		private var skillInfo:SkillInfo;
		private var icon:BgIcon;
		private var time:int;
		private var timeID:uint;
		
		public function SkillAddPop(data:*)
		{
		
			skillInfo=data as SkillInfo;
			_skin=new huode_Jineng();
			icon=new BgIcon(IcoSizeEnum.ICON_64);
			icon.x=21;
			icon.y=13;
			icon.touchable=false;
			super(data);
			_skin.container.addChild(icon);
			MCUtil.removeSelf(skin.lbl_time as DisplayObject);
			this.touchable=true;
		}
		
		private function get skin():huode_Jineng
		{
			return _skin as huode_Jineng;
		}
		private var _cfg:Q_skill_model;
		override  protected function onShow() : void
		{
			_cfg=SpellDataManager.getSpellData(skillInfo.skillModelId);
			skin.lbl_zhuangbei.text=_cfg.q_skillName;
			icon.setIconResName(ClientConfig.getSkillIcon(_cfg.q_skillID.toString(),64));
//			time=5;
//			skin.lbl_time.text=LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT20).replace("$",time);
			timeID=setTimeout(toMis,5000);
		}
		
		override protected function onHide():void
		{
			super.onHide();
			icon.removeFromParent();
			skillInfo=null;
		}
		
		private function updateTime():void
		{
			time--;
			skin.lbl_time.text=LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT20).replace("$",time);
			if(time==0){
				toMis();
			}
		}
		
		private function toMis():void
		{
			if (timeID!=0) 
			{
				clearTimeout(timeID);
				timeID=0;
			}
			var skillIcon:UIAsset=new UIAsset();
			var startPt:Point=new Point();
			this.icon.localToGlobal(new Point(0,0),startPt);
			skillIcon.x=startPt.x;
			skillIcon.y=startPt.y;
			skillIcon.styleName=ClientConfig.getSkillIcon(_cfg.q_skillID.toString(),48);
			StarlingLayerManager.topUILayer.addChild(skillIcon);
			
			var toP:Point;
			if(_cfg.q_trigger_type==1)
			{
				var index:int=getNextShortIndex();
				var cfg:Q_skill_model=SpellDataManager.getSpellData(skillInfo.skillModelId,skillInfo.skillLevel);
				toP=MainUIManager.mainui.shortcutBar.getSkillGridSeat(index);
				ShortcutsManger.getInstance().setShortData(index,ShortcutsTypeEnum.SKILL_TYPE,cfg.q_skillID);
			}
			else
			{
				
				toP=MainUIManager.getBtnGolbalPos(MainButtonManager.getButtonName(4));
			}
			TweenLite.to(skillIcon,0.5,{x:toP.x,y:toP.y,onComplete:flytoShortcutComplete,onCompleteParams:[skillIcon] ,ease:Expo.easeIn});	
			popComplete();	
		}
		private function flytoShortcutComplete(...arg):void
		{
			MCUtil.removeSelf(arg[0]);
		}
		private function getNextShortIndex():int
		{
			var index:int;
			for(var i:int=0;i<8;i++){
				var shortData : ShortcutsData = ShortcutsManger.getInstance().getShortcutsDataByPos(i);
				if(!shortData){
					index=i;
					break;
				}
			}
			return index;
		}
		
		override protected function onStageResize(sw : int, sh : int) : void
		{
			this._skin.container.x=(sw-this._skin.width*2);
			this._skin.container.y=(sh-this._skin.width);
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			toMis();
		}
	}
}