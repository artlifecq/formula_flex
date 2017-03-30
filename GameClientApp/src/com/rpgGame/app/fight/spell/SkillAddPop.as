package com.rpgGame.app.fight.spell
{
	import com.rpgGame.app.display2D.PopSkinUI;
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.netData.skill.bean.SkillInfo;
	
	import gs.TweenLite;
	import gs.easing.Cubic;
	
	import org.mokylin.skin.mainui.tishi.huode_Jineng;
	
	/**
	 *技能获得飘窗 
	 * @author dik
	 * 
	 */
	public class SkillAddPop extends PopSkinUI
	{
		private var skillInfo:SkillInfo;
		private var icon:BgIcon;
		
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
			TweenLite.delayedCall(1,toMis);
		}
		
		private function toMis():void
		{
			var endy:int=this._skin.container.y-40;
			TweenLite.to(this._skin.container,1,{y:endy,alpha:0,onComplete:popComplete,ease:Cubic.easeOut});			
		}
		
		override protected function onStageResize(sw : int, sh : int) : void
		{
			this._skin.container.x=(sw-this._skin.width)/2;
			this._skin.container.y=(sh-this._skin.height)/2;
		}
	}
}