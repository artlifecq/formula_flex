package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.manager.LostSkillManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.LostSkillData;
	import com.rpgGame.coreData.cfg.LostSkillUpData;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.clientConfig.Q_lostskill_open;
	import com.rpgGame.coreData.clientConfig.Q_lostskill_up;
	import com.rpgGame.coreData.lang.LangUI_2;
	import com.rpgGame.netData.lostSkill.bean.SkillStateInfo;
	
	import org.mokylin.skin.app.wuxue.Tips_Skin;
	
	public class LostSkillTip extends SkinUI implements ITip
	{
		private var _skin:Tips_Skin;
		public function LostSkillTip():void
		{
			_skin = new Tips_Skin();
			super(_skin);
		}
		
		public function setTipData(data:*):void
		{
			var skillOpenData:Q_lostskill_open;
			if(data is int){
				skillOpenData=LostSkillData.getModeInfoById(data);
			}else if(data is Q_lostskill_open){
				skillOpenData = data;
			}
			var skillId:int = skillOpenData.q_id;
			var state:SkillStateInfo = LostSkillManager.instance().getSkillStateInfoById(skillId);
			_skin.lb_name.text = skillOpenData.q_name;
			_skin.lb_dengji.text = LanguageConfig.getText(LangUI_2.Lostskill_Opentips).replace("$",skillOpenData.q_level);
			var level:int;
			if(state!=null)
			{
				level = state.level;
				_skin.lb_jihuo.text = "Lv:"+level;
				_skin.lb_jihuo.color = 0x25931b;
			}else{
				level = 1;
				_skin.lb_jihuo.text = NotifyCfgData.getNotifyTextByID(7012);
				_skin.lb_jihuo.color = 0xd02525;
			}
			var currentupdate:Q_lostskill_up = LostSkillUpData.getDatabyIdAndLevel(skillId,level);
			_skin.lb_shengming.text = skillOpenData.q_desc.replace("$",LostSkillManager.instance().getSkillValue(skillOpenData,currentupdate))
		}
		
		public function hideTips():void
		{
			
		}
		public override function get height() : Number
		{
			return _skin.imgBg.height;
		}
		private static var _instance:LostSkillTip = null;
		public static function get instance() : LostSkillTip
		{
			if (null == _instance)
			{
				_instance = new LostSkillTip();
			}
			return _instance;
		}
	}
}