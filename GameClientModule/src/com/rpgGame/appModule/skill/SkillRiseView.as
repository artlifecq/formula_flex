package com.rpgGame.appModule.skill
{
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.netData.skill.bean.SkillInfo;
	
	import org.mokylin.skin.app.wuxue.jineng.jineng_jinjie;

	/**
	 *技能升阶 
	 * @author dik
	 * 
	 */
	public class SkillRiseView
	{
		private var skin:jineng_jinjie;
		private var _icon:BgIcon;
		
		public function SkillRiseView(_skin:jineng_jinjie)
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
			
			skin.lb_jihuo.visible=!skin.lb_weijihuo.visible;			
			_icon.setIconResName(ClientConfig.getSkillIcon(selectedCfg.q_skillID.toString(),48));
			_icon.x=18;
			_icon.y=20;
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