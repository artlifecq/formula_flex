package com.rpgGame.appModule.skill
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.SpellSender;
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.SkillLvLDataManager;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.cfg.StaticValue;
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
		private var _panel:SkinUI;
		private var _selectedInfo:SkillInfo;
		
		public function SkillUpgradeView(_skin:jineng_shengji,panel:SkinUI)
		{
			_panel=panel;
			_icon=new BgIcon(IcoSizeEnum.ICON_64);
			_icon.touchable=false;
			skin=_skin;
			skin.container.addChild(_icon);
			_icon.bindBg(_skin.Icon_jineng);
			alertPanel=new SkillAlertPanel();
			skin.eft1.color=skin.eft2.color=StaticValue.BEIGE_TEXT;
		}
		
		public function update(selectedCfg:Q_skill_model, selectedInfo:SkillInfo):void
		{
			if(!selectedInfo){
				return ;
			}
			GrayFilter.unGray(skin.btn_shengji);
			skin.btn_shengji.touchable=true;
			cfg=selectedCfg;
			_selectedInfo=selectedInfo;
			
			skin.lb_name.text=selectedCfg.q_skillName;
			skin.lb_dengji.text=getTitleText(LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT1),selectedInfo.skillChildLv+"/"+selectedCfg.q_max_level);
			skin.lb_leixing.text=getTitleText(LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT6),selectedCfg.q_type_description);
			skin.lb_xiaohao.text=getTitleText(LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT5),cfg.q_recovers_detail.length==0?LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT12):cfg.q_recovers_detail);
			skin.lb_lengque.text=getTitleText(LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT4),selectedCfg.q_cd/1000);
			
			var lvData:Q_skill_ignore=SkillLvLDataManager.getData(selectedInfo.skillModelId+"_"+selectedInfo.skillChildLv);
			skin.ms_txt.htmlText=lvData.q_skillpanel_description;
			skin.ms_txt.textAlign="left";
			_icon.setIconResName(ClientConfig.getSkillIcon(selectedCfg.q_skillID.toString(),IcoSizeEnum.ICON_64));
			
			if(selectedInfo.skillChildLv==selectedCfg.q_max_level){
				skin.eft_name.visible=false;
				skin.arrow1.visible=false;
				skin.arrow2.visible=false;
				skin.eft1.visible=false;
				skin.eft2.visible=false;
				skin.tj_name.visible=false;
				skin.btn_shengji.visible=false;
				skin.lb_renwudengji.visible=false;
				skin.lb_zhenqi.visible=false;
				skin.lb_yinliang.visible=false;
				if(selectedInfo.skillModelId==1){
					skin.uiOk.visible=false;
				}else
					skin.uiOk.visible=true;
				//				skin.line1.visible=false;
				//				skin.line2.visible=false;
				return;
			}
			skin.eft_name.visible=true;
			skin.arrow1.visible=true;
			skin.arrow2.visible=true;
			skin.eft1.visible=true;
			skin.eft2.visible=true;
			skin.tj_name.visible=true;
			skin.btn_shengji.visible=true;
			skin.lb_renwudengji.visible=true;
			skin.lb_zhenqi.visible=true;
			skin.lb_yinliang.visible=true;
			skin.uiOk.visible=false;
			//			skin.line1.visible=true;
			//			skin.line2.visible=true;
			
			//升级效果
			var myLv:int=MainRoleManager.actorInfo.totalStat.level;
			var myMp:Number=MainRoleManager.actorInfo.curZhenqi;
			var myMon:Number=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_BIND_MONEY)+ MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_MONEY);
			upNum=1;
			var needMp:Number=0;
			var needMy:Number=0;
			var lv:int=selectedInfo.skillChildLv;
			var id:int=selectedCfg.q_skillID;
			var key:String=id+"_"+lv;
			var playerLv:int=0;
			lvData=SkillLvLDataManager.getData(key);//这儿又是技能id和等级
			
			var i:int=0
			var changeValue:Array=[];
			var preValue:Array=SkillLvLDataManager.getAttrValueByType(selectedCfg.q_skill_attr_type,lvData);
			var nextValue:Array;
			var changeDes:String=LanguageConfig.getText( LangSpell["SPELL_"+id] );
			var desList:Array=changeDes.split("|");
			var num:int=desList.length;
			for(i=0;i<num;i++){
				changeValue.push(0);
			}
			if(lvData){
				/*	needMp+=lvData.q_energy;
				needMy+=lvData.q_copper;
				playerLv=lvData.q_playerlevel;*/
				var endLv:int=lv+1;
				if(SpellDataManager.oneKeyup){//一键升级设置了
					endLv=selectedCfg.q_max_level;
				}
				while(lv<endLv){//计算下一级的情况
					lv++;
					upNum++;
					key=id+"_"+lv;
					if(lvData){
						needMp+=lvData.q_energy;
						needMy+=lvData.q_copper;
						if(lvData.q_playerlevel!=0){
							playerLv=lvData.q_playerlevel;
						}
					}else{
						break;
					}
					lvData=SkillLvLDataManager.getData(key);
					nextValue=SkillLvLDataManager.getAttrValueByType(selectedCfg.q_skill_attr_type,lvData);
					for(i=0;i<nextValue.length;i++){
						changeValue[i]+=nextValue[i]-preValue[i];
					}
					preValue=nextValue;
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
					}
				}
			}
			
			//			var w:int;
			//			var xx:int
			for(i=0;i<num;i++){
				skin["eft"+(i+1)].visible=true;
				skin["arrow"+(i+1)].visible=true;
				var changeValueH:String=SkillLvLDataManager.getPercentValue(selectedCfg.q_skill_attr_type,changeValue[i],i);
				skin["eft"+(i+1)].htmlText=desList[i].replace("$",changeValueH);
			}
			if(num==1){
				skin.eft2.visible=false;
				skin.arrow2.visible=false;
			}
			
			//			w=skin.eft1.textWidth+8;
			//			w=w>skin.eft2.textWidth+8?w:skin.eft2.textWidth+8;
			//			xx=(360-w)>>1;
			//			skin.arrow1.x=skin.arrow2.x=xx;
			//			skin.eft1.x=skin.eft2.x=xx+8;
			
			//升级条件
			var playerStr:String=playerLv+LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT21);
			if(playerLv>myLv){
				GrayFilter.gray(skin.btn_shengji);
				skin.btn_shengji.touchable=false;
				playerStr=HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,playerLv.toString()+LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT21));
			}else{
				playerStr=HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,playerLv.toString()+LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT21));
			}
			
			skin.lb_renwudengji.htmlText=getTitleText(LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT10),playerStr);
			skin.lb_zhenqi.htmlText=getTitleText(LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT8),needMp,myMp);
			skin.lb_yinliang.htmlText=getTitleText(LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT7),needMy,myMon);		
			//			w=skin.lb_renwudengji.textWidth;
			//			w=w>skin.lb_zhenqi.textWidth?w:skin.lb_zhenqi.textWidth;
			//			w=w>skin.lb_yinliang.textWidth?w:skin.lb_yinliang.textWidth;
			//			
			//			xx=(360-w)>>1;
			//			skin.lb_renwudengji.x=xx;
			//			skin.lb_zhenqi.x=xx;
			//			skin.lb_yinliang.x=xx;
		}
		
		private function getTitleText(title:String,value:*,value1:Number=-1):String
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
				des=HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,value1+"/"+value);
			}else{
				des=HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,value1+"/"+value);
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
							alertPanel.show({cfg:cfg,info:_selectedInfo},0,_panel);
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