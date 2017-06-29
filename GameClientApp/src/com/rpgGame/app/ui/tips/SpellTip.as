package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.SkillLvLDataManager;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.clientConfig.Q_skill_ignore;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.info.face.BaseFaceInfo;
	import com.rpgGame.coreData.lang.LangSpell;
	import com.rpgGame.netData.skill.bean.SkillInfo;
	
	import feathers.utils.filter.GrayFilter;
	
	import org.mokylin.skin.app.tips.Tips_ZhuDongJiNeng;
	
	/**
	 * 技能TIPS
	 * @author dik
	 * 
	 */
	public class SpellTip extends SkinUI implements ITip
	{
		private var _spellTip:Tips_ZhuDongJiNeng;
		
		private static var _instance:SpellTip = null;
		public static function get instance() : SpellTip
		{
			if (null == _instance)
			{
				_instance = new SpellTip();
			}
			return _instance;
		}
		
		private var mainIco:BgIcon;
		private var riseIco:BgIcon;
		
		public function SpellTip()
		{
			_spellTip = new Tips_ZhuDongJiNeng();
			super( _spellTip );
			
			initTip();
		}
		
		/**
		 * 初始化tips 
		 * 
		 */		
		private function initTip():void
		{
			mainIco=new BgIcon(64);
			riseIco=new BgIcon(64);
			_spellTip.container.addChildAt(mainIco,4);
			_spellTip.grpContent.addChild(riseIco);
			_spellTip.lbJinjie2.wordWrap=true;
			riseIco.x=_spellTip.Icon2.x+5;
			riseIco.y=_spellTip.Icon2.y+5;
			mainIco.x=_spellTip.Icon1.x+5;
			mainIco.y=_spellTip.Icon1.y+5;
		}		
		
		/**
		 * 设置技能tips数据 
		 * @param data
		 * 
		 */		
		public function setTipData( data:* ):void
		{
			var id:int;
			if(data is int){
				id=data;
			}else if(data is BaseFaceInfo){
				id=data.cfgId;
			}
			var info:SkillInfo=MainRoleManager.actorInfo.spellList.getSkillInfo(id);
			if(info==null)
				info = MainRoleManager.actorInfo.otherList.getSkillInfo(id);
			if(info == null)
			{
				info = new SkillInfo();
				info.skillModelId = id;
				info.skillLevel = 1;
			}
			var cfg:Q_skill_model=SpellDataManager.getSpellData(info.skillModelId,info.skillLevel);
			var riseCfg:Q_skill_model=SpellDataManager.getSpellData(id,info.skillLevel+1);
			if(info.skillLevel==cfg.q_max_grade&&info.skillLevel!=1){
				riseCfg=SpellDataManager.getSpellData(id,cfg.q_max_grade);
			}
			
			if(cfg.q_skillpanel_description2==""&&cfg.q_grade_name=="")
			{
				riseCfg = null;
			}
			
			mainIco.setIconResName(ClientConfig.getSkillIcon(cfg.q_icon.toString(),64));
			_spellTip.skill_name.text=cfg.q_skillName+"		Lv."+info.skillChildLv;
			_spellTip.lbTime.text=cfg.q_cd==0?LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT12):(cfg.q_cd/1000)+"s";
			_spellTip.lbXiaohao.text=cfg.q_recovers_detail.length==0?LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT12):cfg.q_recovers_detail;
			var lvData:Q_skill_ignore=SkillLvLDataManager.getData(info.skillModelId+"_"+info.skillChildLv);
			_spellTip.lbShuoming.text=lvData.q_skillpanel_description;
			_spellTip.lbShuoming.isHtmlText=true;
			
			if(!riseCfg){
				_spellTip.tipbg.height=_spellTip.lbShuoming.y+_spellTip.lbShuoming.textHeight+20;
				_spellTip.grpContent.visible=false;
				return;
			}
			_spellTip.grpContent.visible=true;
			_spellTip.tipbg.height = 380;
			_spellTip.lbName.text=riseCfg.q_grade_name;
			if(info.skillLevel==1){
				GrayFilter.gray(riseIco);
				riseIco.width=riseIco.height=80;
				riseIco.setIconResName(ClientConfig.getRiseSkillIcon(cfg.q_icon.toString(),64));
				if(riseCfg.q_need_skill_level!=0){
					_spellTip.lbJinjie.text="("+riseCfg.q_skillName+riseCfg.q_need_skill_level+LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT17)+")";
					if(riseCfg.q_level_up!=0){
						_spellTip.lbJinjie.text+="\n"+LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT18).replace("$",riseCfg.q_level_up);
					}
				}else{
					if(riseCfg.q_level_up!=0){
						_spellTip.lbJinjie.text+=LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT18).replace("$",riseCfg.q_level_up);
					}
				}		
			}else{
				GrayFilter.unGray(riseIco);
				_spellTip.lbJinjie.text=LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT3).substr(0,3);
			}
			_spellTip.lbJinjie.color=StaticValue.A_UI_YELLOW_TEXT;
			_spellTip.lbJinjie2.y=_spellTip.lbJinjie.y+_spellTip.lbJinjie.textHeight+3;
			_spellTip.lbJinjie2.htmlText=cfg.q_skillpanel_description2;		
			_spellTip.grpContent.height=_spellTip.lbJinjie2.y+_spellTip.lbJinjie2.textHeight+18;
			_spellTip.tipbg.height=_spellTip.grpContent.y+_spellTip.grpContent.height;
		}
		
		/**
		 * 隐藏技能tips 
		 * 
		 */		
		public function hideTips():void
		{
			
		}
		
		/**
		 * 获取物品tips背景高度
		 * @return
		 *
		 */
		public override function get height() : Number
		{
			
			return _spellTip.tipbg.height;
		}
	}
}