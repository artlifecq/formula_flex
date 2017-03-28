package com.rpgGame.appModule.skill
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.SpellSender;
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.SkillLvLDataManager;
	import com.rpgGame.coreData.clientConfig.Q_skill_ignore;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.skill.bean.SkillInfo;
	
	import feathers.utils.filter.GrayFilter;
	
	import org.mokylin.skin.app.wuxue.jineng.jineng_shengji;
	
	import starling.display.DisplayObject;

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
			GrayFilter.unGray(skin.btn_shengji);
			skin.btn_shengji.touchable=true;
			
			skin.lb_name.text=selectedCfg.q_skillName;
			skin.lb_dengji.text=getTitleText("等级",selectedInfo.skillChildLv+"/"+selectedCfg.q_max_level);
			skin.lb_leixing.text=getTitleText("技能类型",selectedCfg.q_skill_type);
			skin.lb_xiaohao.text=getTitleText("消耗",selectedCfg.q_need_mp);
			skin.lb_lengque.text=getTitleText("冷却时间",selectedCfg.q_cd/1000);
			
			skin.lb_miaoshu.htmlText=selectedCfg.q_skillpanel_description1;
			_icon.setIconResName(ClientConfig.getSkillIcon(selectedCfg.q_skillID.toString(),48));
			_icon.x=18;
			_icon.y=20;
			
			if(selectedInfo.skillChildLv==selectedCfg.q_max_level){
				skin.eft_name.visible=false;
				skin.arrow1.visible=false;
				skin.arrow2.visible=false;
				skin.lb_shengji.visible=false;
				skin.lb_shanghai.visible=false;
				skin.tj_name.visible=false;
				skin.btn_shengji.visible=false;
				skin.lb_renwudengji.visible=false;
				skin.lb_zhenqi.visible=false;
				skin.lb_yinliang.visible=false;
				skin.line1.visible=false;
				skin.line2.visible=false;
				return;
			}
			skin.eft_name.visible=true;
			skin.arrow1.visible=true;
			skin.arrow2.visible=true;
			skin.lb_shengji.visible=true;
			skin.lb_shanghai.visible=true;
			skin.tj_name.visible=true;
			skin.btn_shengji.visible=true;
			skin.lb_renwudengji.visible=true;
			skin.lb_zhenqi.visible=true;
			skin.lb_yinliang.visible=true;
			skin.line1.visible=true;
			skin.line2.visible=true;
			
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
			skin.lb_renwudengji.htmlText=getTitleText("人物等级",playerLv,myLv);
			skin.lb_zhenqi.htmlText=getTitleText("消耗真气",needMp,myMp);
			skin.lb_yinliang.htmlText=getTitleText("消耗绑银",needMy,myMon);			
		}
		
		private function getTitleText(title:String,value:*,value1:int=-1):String
		{
			if(value is int){
				if(value==0){
					value="无";
				}
			}
			if(title=="冷却时间"&&value!="无"){
				value+="s";
			}
			if(value1==-1){
				return title+":"+value;
			}
			var des:String="";
			if(value<value1){
				des=HtmlTextUtil.getTextColor(0xcfc6ae,value+"/"+value1);
			}else{
				des=HtmlTextUtil.getTextColor(0xd02525,value+"/"+value1);
				GrayFilter.gray(skin.btn_shengji);
				skin.btn_shengji.touchable=false;
			}
			return title+":"+des;
		}
			
		public function onTouchTarget(target:DisplayObject):Boolean
		{
			switch(target){
				case skin.btn_shengji:
					
					break;
			}
			return false;
		}
	}
}