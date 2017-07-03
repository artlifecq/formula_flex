package com.rpgGame.appModule.skill.lostskill
{
	import com.rpgGame.app.manager.LostSkillManager;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.clientConfig.Q_lostskill_open;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.netData.lostSkill.bean.SkillStateInfo;
	
	import feathers.controls.SkinnableContainer;
	import feathers.utils.filter.GrayFilter;
	
	import org.mokylin.skin.app.wuxue.juexue.Juexue_Item;

	public class LostSkillIcon
	{
		private var _skin:Juexue_Item;
		private var _data:Q_lostskill_open;
		private var _stateinfo:SkillStateInfo;
		public function LostSkillIcon(content:SkinnableContainer,data:Q_lostskill_open,groupName:String):void
		{
			_skin = content.skin as Juexue_Item;
			_skin.btn_over.groupName = groupName;
			_data = data;
			initView();
		}
		
		private function initView():void
		{
			TipTargetManager.show( _skin.btn_over, TargetTipsMaker.makeTips( TipType.LOSTSKILL_TIP, _data));
			_skin.icons.styleName = "ui/common/tips/icon/"+_data.q_icon+".png";
			_skin.uiName.styleName = "ui/common/tips/name/"+_data.q_icon+".png";
			_skin.qiyong.touchable = false;
			_skin.uiName.touchable = false;
			_skin.lb_weijihuo.touchable = false;
			_skin.qiyong.touchable = false;
			_skin.lb_weijihuo.touchable = false;
		}
		
		public function refeashView():void
		{
			_stateinfo = LostSkillManager.instance().getSkillStateInfoById(_data.q_id);
			_skin.qiyong.visible = _data.q_id == LostSkillManager.instance().curSkillId;
			_skin.uiName.styleName = "ui/common/tips/name/"+_data.q_icon+".png";
			if(_stateinfo ==null)
			{
				_skin.lb_weijihuo.visible = true;
				GrayFilter.gray(_skin.icons);
				GrayFilter.gray(_skin.uiName);
			}else{
				_skin.lb_weijihuo.visible = false;
				_skin.icons.filter = null;
				_skin.uiName.filter = null;
			}
			
		}
	}
}