package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.SkillLvLDataManager;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.clientConfig.Q_skill_ignore;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.netData.skill.bean.SkillInfo;
	
	import org.mokylin.skin.app.tips.jinengTips_Skin;
	
	/**
	 * 技能TIPS
	 * @author luguozheng
	 * @author 陈鹉光-2016-07-13 改
	 * 
	 */	
	public class SpellTip extends SkinUI implements ITip
	{
		private var _spellTip:jinengTips_Skin;
		
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
			_spellTip = new jinengTips_Skin();
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
			riseIco=new BgIcon(48);
			_spellTip.container.addChildAt(mainIco,4);
			_spellTip.grp_rise_content.addChild(riseIco);
			riseIco.x=0;
			riseIco.y=0;
			mainIco.x=9;
			mainIco.y=10;
		}		
		
		/**
		 * 设置技能tips数据 
		 * @param data
		 * 
		 */		
		public function setTipData( data:* ):void
		{
			var id:int=data;
			var info:SkillInfo=MainRoleManager.actorInfo.spellList.getSkillInfo(id);
			var cfg:Q_skill_model=SpellDataManager.getSpellData(info.skillModelId,info.skillLevel);
			var riseCfg:Q_skill_model=SpellDataManager.getSpellData(id,2);
			
			_spellTip.lbl_name.text=cfg.q_skillName;
			_spellTip.lbl_dengji.text="Lv."+info.skillChildLv;
			_spellTip.lbl_lenque.text=cfg.q_cd==0?"无":(cfg.q_cd/1000)+"s";
			_spellTip.lbl_xiaohao.text=cfg.q_need_mp==0?"无":cfg.q_need_mp+"";
			_spellTip.lbl_miaosu.htmlText=cfg.q_skillpanel_description1;
			
			if(!riseCfg){
				_spellTip.bg.height==_spellTip.grp_shuoming.y+_spellTip.lbl_jinengName.height+5+_spellTip.lbl_miaosu.textHeight+20;
				_spellTip.grp_rise_tite.visible=false;
				_spellTip.grp_rise_content.visible=false;
				return;
			}
			
			_spellTip.rise_name.text=riseCfg.q_skillName;
			_spellTip.grp_rise_tite.visible=true;
			_spellTip.grp_rise_content.visible=true;
			
			_spellTip.grp_rise_tite.y=_spellTip.grp_shuoming.y+_spellTip.lbl_jinengName.height+5+_spellTip.lbl_miaosu.textHeight+20;
			_spellTip.grp_rise_content.y=_spellTip.grp_rise_tite.y+_spellTip.grp_rise_tite.height+20;
			
			_spellTip.mc_dengjie.gotoAndStop(info.skillLevel.toString());
			if(info.skillLevel==1){
				_spellTip.is_act.color=0xd02525;
				_spellTip.is_act.text="未激活";
			}else{
				_spellTip.is_act.color=0x6BCC08;
				_spellTip.is_act.text="已激活";
			}
			_spellTip.is_act.x=_spellTip.rise_name.x+_spellTip.rise_name.textWidth+10;
			_spellTip.rise_des.htmlText=cfg.q_skillpanel_description2;
			
			mainIco.setIconResName(ClientConfig.getSkillIcon(cfg.q_skillID.toString(),64));
			riseIco.setIconResName(ClientConfig.getRiseSkillIcon(cfg.q_skillID.toString(),48));
			
			_spellTip.bg.height=_spellTip.grp_rise_content.y+_spellTip.rise_name.height+_spellTip.rise_des.textHeight+20;
			if(_spellTip.bg.height<280){
				_spellTip.bg.height=280;
			}
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
			
			return _spellTip.bg.height;
		}
	}
}