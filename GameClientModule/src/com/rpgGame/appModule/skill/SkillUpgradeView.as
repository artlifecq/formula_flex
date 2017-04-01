package com.rpgGame.appModule.skill
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.SpellSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.SkillLvLDataManager;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.clientConfig.Q_skill_ignore;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.lang.LangSpell;
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

		private var upNum:int;
		private var cfg:Q_skill_model;
		
		private var alertPanel:SkillAlertPanel;
		private var _panel:SkinUIPanel;
		
		public function SkillUpgradeView(_skin:jineng_shengji,panel:SkinUIPanel)
		{
			_panel=panel;
			_icon=new BgIcon(IcoSizeEnum.ICON_48);
			_icon.touchable=false;
			skin=_skin;
			skin.container.addChild(_icon);
			alertPanel=new SkillAlertPanel();
		}
		
		public function update(selectedCfg:Q_skill_model, selectedInfo:SkillInfo):void
		{
			GrayFilter.unGray(skin.btn_shengji);
			skin.btn_shengji.touchable=true;
			cfg=selectedCfg;
			
			skin.lb_name.text=selectedCfg.q_skillName;
			skin.lb_dengji.text=getTitleText(LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT1),selectedInfo.skillChildLv+"/"+selectedCfg.q_max_level);
			skin.lb_leixing.text=getTitleText(LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT6),selectedCfg.q_type_description);
			skin.lb_xiaohao.text=getTitleText(LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT5),selectedCfg.q_need_mp);
			skin.lb_lengque.text=getTitleText(LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT4),selectedCfg.q_cd/1000);
			
			skin.lb_miaoshu.htmlText=selectedCfg.q_skillpanel_description1;
			
			_icon.setIconResName(ClientConfig.getSkillIcon(selectedCfg.q_skillID.toString(),48));
			_icon.x=16;
			_icon.y=21;
			
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
			var myMon:int=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_BIND_MONEY)+ MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_MONEY);
			upNum=1;
			var needMp:int=0;
			var needMy:int=0;
			var lv:int=selectedInfo.skillChildLv;
			var id:int=selectedCfg.q_skillID;
			var key:String=id+"_"+lv;
			var playerLv:int=0;
			var lvData:Q_skill_ignore=SkillLvLDataManager.getData(key);//这儿又是技能id和等级
			var changeValue:int=0;
			var changeDes:String=LanguageConfig.getText( LangSpell["SPELL_"+id] );
			if(lvData){
				needMp+=lvData.q_energy;
				needMy+=lvData.q_copper;
				playerLv=lvData.q_playerlevel;
				while(lv<selectedCfg.q_max_level){
					lv++;
					upNum++;
					key=id+"_"+lv;
					
					lvData=SkillLvLDataManager.getData(key);
					changeValue+=SkillLvLDataManager.getAttrValueByType(selectedCfg.q_skill_attr_type,lvData);
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
			
			
			if(upNum==1){
				skin.eft_name.text=LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT9);
			}else{
				skin.eft_name.text=LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT11);
			}
			
			var des:String=LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT14);
			des=des.replace("$",HtmlTextUtil.getTextColor(0x25931b,String(selectedInfo.skillChildLv+upNum-1)));
			skin.lb_shengji.htmlText=des;
			var changeValueH:String=HtmlTextUtil.getTextColor(0x25931b,changeValue+"%");
			changeDes=changeDes.replace("$",changeValueH);
			skin.lb_shanghai.htmlText=changeDes;
			
			skin.arrow1.x=16;
			skin.lb_shengji.x=skin.arrow1.x+skin.arrow1.width;
			skin.lb_shanghai.x=362-skin.lb_shanghai.textWidth-10;
			skin.arrow2.x=skin.lb_shanghai.x-skin.arrow2.width;
			
			//升级条件
			var w:int;
			skin.lb_renwudengji.htmlText=getTitleText(LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT10),playerLv);
			skin.lb_zhenqi.htmlText=getTitleText(LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT8),needMp,myMp);
			skin.lb_yinliang.htmlText=getTitleText(LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT7),needMy,myMon);		
			w=skin.lb_renwudengji.textWidth;
			w=w>skin.lb_zhenqi.textWidth?w:skin.lb_zhenqi.textWidth;
			w=w>skin.lb_yinliang.textWidth?w:skin.lb_yinliang.textWidth;
			
			var xx:int=(330-w)/2;
			skin.lb_renwudengji.x=xx;
			skin.lb_zhenqi.x=xx;
			skin.lb_yinliang.x=xx;
		}
		
		private function getTitleText(title:String,value:*,value1:int=-1):String
		{
			var wu:String=LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT12);
			if(value is int){
				if(value==0){
					value=wu;
				}
			}
			if(title==LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT4)&&value!=wu){
				value+="s";
			}
			if(value1==-1){
				return title+":"+value;
			}
			var des:String="";
			if(value<=value1){
				des=HtmlTextUtil.getTextColor(0xcfc6ae,value+"/"+value1);
			}else{
				des=HtmlTextUtil.getTextColor(0xd02525,value+"/"+value1);
				GrayFilter.gray(skin.btn_shengji);
				skin.btn_shengji.touchable=false;
			}
			return title+":"+des;
		}
		
		public function onHide():void
		{
			alertPanel.hide();
		}
			
		public function onTouchTarget(target:DisplayObject):Boolean
		{
			switch(target){
				case skin.btn_shengji:
					if(upNum==1){
						SpellSender.reqSkillLevelUp(cfg.q_skillID,0,0);
					}else{
						if(SpellDataManager.unAlert){
							if(SpellDataManager.oneKeyup){
								SpellSender.reqSkillLevelUp(cfg.q_skillID,0,1);
							}else{
								SpellSender.reqSkillLevelUp(cfg.q_skillID,0,0);
							}
						}else{
							alertPanel.show(cfg,"",_panel);
							alertPanel.x=290;
							alertPanel.y=160;
						}
					}
					return true;
			}
			return false;
		}
	}
}