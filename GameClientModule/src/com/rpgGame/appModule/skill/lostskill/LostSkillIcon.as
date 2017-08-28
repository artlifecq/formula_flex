package com.rpgGame.appModule.skill.lostskill
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.LostSkillManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.ui.tip.RTNodeID;
	import com.rpgGame.core.ui.tip.RewardTipTree;
	import com.rpgGame.coreData.cfg.LostSkillUpData;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.clientConfig.Q_lostskill_open;
	import com.rpgGame.coreData.clientConfig.Q_lostskill_up;
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
		//private var _markTip:RewardMarkTip;
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
			_skin.uiName.styleName = "ui/art_txt/common/tips/name/"+_data.q_icon+".png";
			_skin.qiyong.touchable = false;
			_skin.uiName.touchable = false;
			_skin.lb_weijihuo.touchable = false;
			_skin.qiyong.touchable = false;
			_skin.lb_weijihuo.touchable = false;
			
			//
			RewardTipTree.ins.addNode(RTNodeID.WX_JX,RTNodeID.WX_JX_SKILL+_data.q_id,_skin.container,94,LostSkillManager.instance().isLostSkillCanLevelUp,false,_data.q_id);
			//_markTip=new RewardMarkTip(_skin.container,94);
		}
		
		public function refeashView():void
		{
			_stateinfo = LostSkillManager.instance().getSkillStateInfoById(_data.q_id);
			_skin.qiyong.visible = _data.q_id == LostSkillManager.instance().curSkillId;
			_skin.uiName.styleName = "ui/art_txt/common/tips/name/"+_data.q_icon+".png";
			if(_stateinfo ==null)
			{
				_skin.lb_weijihuo.visible = true;
				GrayFilter.gray(_skin.icons);
				GrayFilter.gray(_skin.uiName);
				//_markTip.hasReward=false;
			}else
			{
				_skin.lb_weijihuo.visible = false;
				_skin.icons.filter = null;
				_skin.uiName.filter = null;
				//_markTip.hasReward=LostSkillManager.instance().isLostSkillCanLevelUp(_data.q_id);
			}
			checkReward();
		}
		public function checkReward():void
		{
			SkinUI.notifyUpdate(RTNodeID.WX_JX_SKILL+_data.q_id);
			//_markTip.hasReward=LostSkillManager.instance().isLostSkillCanLevelUp(_data.q_id);
		}
		public function get data():Q_lostskill_open
		{
			return _data;
		}
		public function showUpLevel():void
		{
			if(_stateinfo==null)
				return ;
			var updata:Q_lostskill_up = LostSkillUpData.getDatabyIdAndLevel(_stateinfo.skillId,_stateinfo.level);
			var itemInfo:Object = JSONUtil.decode( updata.q_cost)[0];
			var qItem:Q_item=ItemConfig.getQItemByID(itemInfo["mod"]);
			NoticeManager.showNotifyById(7020,"",qItem.q_name,itemInfo["num"]);
		}
	}
}