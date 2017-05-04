package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.face.BaseFaceInfo;
	import com.rpgGame.coreData.lang.LangUI_2;
	
	import org.mokylin.skin.app.tips.Tips_BeiDongJiNeng;
	
	public class PassiveSpillTip extends SkinUI implements ITip
	{
		private var _skin:Tips_BeiDongJiNeng;
		
		private static var _instance:PassiveSpillTip = null;
		public static function get instance() : PassiveSpillTip
		{
			if (null == _instance)
			{
				_instance = new PassiveSpillTip();
			}
			return _instance;
		}
		public function PassiveSpillTip():void
		{
			_skin = new Tips_BeiDongJiNeng();
			super(_skin);
			initView();
		}
		private var mainIco:BgIcon;
		private function initView():void
		{
			mainIco = new BgIcon(IcoSizeEnum.ICON_64);
			mainIco.x = 102;
			mainIco.y = 37;
			_skin.container.addChildAt(mainIco,4);
		}
		
		public function setTipData(data:*):void
		{
			var id:int;
			if(data is int){
				id=data;
			}else if(data is BaseFaceInfo){
				id=data.cfgId;
			}
			
			var cfg:Q_skill_model=SpellDataManager.getSpellData(id,1);
			mainIco.setIconResName(ClientConfig.getSkillIcon(cfg.q_icon,64));
			_skin.skill_name.styleName = "ui/common/tips/jinengming/"+cfg.q_name_icon+ClientConfig.eName_PNG;
			_skin.lbShuoming.text = cfg.q_skillpanel_description1;
			_skin.jihuogroup.isEnabled = false;
			if(MainRoleManager.actorInfo.spellList.getSkillInfo(id)==null)
			{
				_skin.lbJIhuo.text = LanguageConfig.getText(LangUI_2.Skill_weijihuo);
				_skin.lbJIhuo.color = 0xd02525;
				_skin.jihuogroup.visible = true;
				_skin.lbDengji.text = cfg.q_skillopen_desc;
				_skin.tipbg.height = 349;
			}else{
				_skin.lbJIhuo.text = LanguageConfig.getText(LangUI_2.Skill_jihuo);
				_skin.lbJIhuo.color = 0x239D02;
				_skin.jihuogroup.visible = false;
				_skin.tipbg.height = 270;
			}
		}
		
		public function hideTips():void
		{
		}
		/*
		* 获取物品tips背景高度
		* @return
		*
		*/
		public override function get height() : Number
		{
			
			return _skin.tipbg.height;
		}
	}
}