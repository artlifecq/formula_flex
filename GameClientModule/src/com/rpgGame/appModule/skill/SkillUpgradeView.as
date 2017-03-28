package com.rpgGame.appModule.skill
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.SkillLvLDataManager;
	import com.rpgGame.coreData.clientConfig.Q_skill_ignore;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.netData.skill.bean.SkillInfo;
	
	import org.mokylin.skin.app.wuxue.jineng.jineng_shengji;

	/**
	 *技能升级 
	 * @author dik
	 * 
	 */
	public class SkillUpgradeView
	{
		private var skin:jineng_shengji;
		private var _icon:BgIcon;
		
		public function SkillUpgradeView(_skin:jineng_shengji)
		{
			_icon=new BgIcon(IcoSizeEnum.ICON_48);
			_icon.touchable=false;
			skin=_skin;
			skin.container.addChild(_icon);
		}
		
		public function update(selectedCfg:Q_skill_model, selectedInfo:SkillInfo):void
		{
			skin.lb_name.text=selectedCfg.q_skillName;
			skin.lb_dengji.text=getTitleText("等级",selectedInfo.skillChildLv+"/"+selectedCfg.q_max_level);
			skin.lb_leixing.text=getTitleText("技能类型",selectedCfg.q_skill_type);
			skin.lb_xiaohao.text=getTitleText("消耗",selectedCfg.q_need_mp);
			skin.lb_lengque.text=getTitleText("冷却时间",selectedCfg.q_cd/1000);
			
			skin.lb_miaoshu.htmlText=selectedCfg.q_skillpanel_description1;
			_icon.setIconResName(ClientConfig.getSkillIcon(selectedCfg.q_skillID.toString(),48));
			_icon.x=18;
			_icon.y=20;
			//升级效果
			var myLv:int=MainRoleManager.actorInfo.totalStat.level;
			var myMp:int=MainRoleManager.actorInfo.curZhenqi;
			var myMon:int=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_BIND_MONEY);
			var upNum:int=1;
			var needMp:int=0;
			var needMy:int=0;
			var lv:int=selectedInfo.skillChildLv;
			var id:int=selectedCfg.q_skillID;
			var key:String=id+"_"+lv;
			var playerLv:int=0;
			var lvData:Q_skill_ignore=SkillLvLDataManager.getData(key);
			if(lvData){
				needMp+=lvData.q_energy;
				needMy+=lvData.q_copper;
				playerLv=lvData.q_playerlevel;
				while(lv<selectedCfg.q_max_level){
					lv++;
					upNum++;
					key=id+"_"+lv;
					
					lvData=SkillLvLDataManager.getData(key);
					if(lvData){
						if(needMp+lvData.q_energy>myMp){
							break;
						}
						if(needMy+lvData.q_copper>myMon){
							break;
						}
						if(lvData.q_playerlevel>myLv){
							break;
						}
						needMp+=lvData.q_energy;
						needMy+=lvData.q_copper;
						if(lvData.q_playerlevel!=0){
							playerLv=lvData.q_playerlevel;
						}
					}else{
						break;
					}
				}
			}
			
			
			//			skin.lb_shengji.htmlText=selectedCfg.q_skillpanel_description1;
			//			skin.lb_shanghai.htmlText=selectedCfg.q_skillpanel_description1;
			
			//升级条件
			skin.lb_renwudengji.htmlText=getTitleText("人物等级",playerLv.toString());
			skin.lb_renwudengji.htmlText=getTitleText("消耗真气",needMp.toString());
			skin.lb_renwudengji.htmlText=getTitleText("消耗绑银",needMy.toString());			
		}
		
		private function getTitleText(title:String,value:*):String
		{
			if(value is int){
				if(value==0){
					value="无";
				}
			}
			if(title=="冷却时间"&&value!="无"){
				value+="s";
			}
			return title+":"+value;
		}
	}
}