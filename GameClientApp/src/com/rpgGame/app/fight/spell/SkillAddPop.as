package com.rpgGame.app.fight.spell
{
	import com.rpgGame.app.display2D.PopSkinUI;
	import com.rpgGame.app.manager.MainUIManager;
	import com.rpgGame.app.manager.ShortcutsManger;
	import com.rpgGame.app.view.icon.BgIcon;
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
	import flash.utils.clearInterval;
	import flash.utils.setInterval;
	
	import gs.TweenLite;
	import gs.easing.Cubic;
	
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
			icon.x=18;
			icon.y=10;
			super(data);
			_skin.container.addChild(icon);
		}
		
		private function get skin():huode_Jineng
		{
			return _skin as huode_Jineng;
		}
		
		override  protected function onShow() : void
		{
			var cfg:Q_skill_model=SpellDataManager.getSpellData(skillInfo.skillModelId);
			skin.lbl_zhuangbei.text=cfg.q_skillName;
			icon.setIconResName(ClientConfig.getSkillIcon(cfg.q_skillID.toString(),64));
			time=5;
			timeID=setInterval(updateTime,1000);
		}
		
		private function updateTime():void
		{
			time--;
			skin.lbl_time.text=LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT20).replace("$",time);
			if(time==0){
				clearInterval(timeID);
				toMis();
			}
		}
		
		private function toMis():void
		{
			var endy:int=this._skin.container.y-40;
			var index:int=getNextShortIndex();
			var cfg:Q_skill_model=SpellDataManager.getSpellData(skillInfo.skillModelId,skillInfo.skillLevel);
			ShortcutsManger.getInstance().setShortData(index, ShortcutsTypeEnum.SKILL_TYPE, cfg.q_skillID);
			var toP:Point=MainUIManager.mainui.shortcutBar.getSkillGridSeat(index);
			toP=icon.parent.globalToLocal(toP);
			for(var i:int=0;i<skin.container.numChildren;i++){
				var dis:DisplayObject=skin.container.getChildAt(i);
				if(dis!=icon){
					dis.visible=false;
				}
			}
			TweenLite.to(icon,0.5,{x:toP.x,y:toP.y,width:48,height:48,onComplete:popComplete,ease:Cubic.easeOut});			
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
			this._skin.container.x=(sw-this._skin.width)/2;
			this._skin.container.y=(sh-this._skin.height)/2;
		}
	}
}