package com.rpgGame.appModule.skill.lostskill
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.LostSkillManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.LostSkillUpData;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.clientConfig.Q_lostskill_open;
	import com.rpgGame.coreData.clientConfig.Q_lostskill_up;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.lang.LangUI_2;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.lostSkill.bean.SkillStateInfo;
	import com.rpgGame.netData.lostSkill.message.CSLostSkillLeveUpMessage;
	
	import away3d.events.Event;
	
	import feathers.core.ui_internal;
	
	import org.game.netCore.connection.SocketConnection;
	import org.mokylin.skin.app.wuxue.Title_Skin;
	import org.mokylin.skin.app.wuxue.juexue.Item_shuxing;
	import org.mokylin.skin.app.wuxue.juexue.JuexueHead;
	import org.mokylin.skin.app.wuxue.juexue.Juxue_Shengji;

	public class LostSkillUpLevelView
	{
		private static const maxLevel:int = 100;
		private var _skin:Juxue_Shengji;
		public function LostSkillUpLevelView(skin:Juxue_Shengji):void
		{
			_skin = skin;
			initView();
		}
		private function initView():void
		{
			var content:Item_shuxing = _skin.currentLevel.skin as Item_shuxing;
			content.lb_name.text = LanguageConfig.getText(LangUI_2.Lostskill_title1);
			content= _skin.nexttLevel.skin as Item_shuxing; 
			content.lb_name.text = LanguageConfig.getText(LangUI_2.Lostskill_title2);
			_skin.btn_shengji.addEventListener(Event.TRIGGERED,uplevelTrigeredHandler);
			_skin.btn_yinyong.addEventListener(Event.TRIGGERED,changeStateHandler);
			setTitleValue(_skin.tile_1.skin as JuexueHead,"dqhzb");
			setTitleValue(_skin.tile_2.skin as JuexueHead,"sjtj");
		}
		
		private function setTitleValue(skin:JuexueHead,title:String):void
		{
			skin.uiName.styleName = "ui/app/wuxue/juexue/"+title+".png";
		}
		private function changeStateHandler(e:Event):void
		{
			LostSkillManager.instance().changeState(_state);
		}
		private function uplevelTrigeredHandler(e:Event):void
		{
			if(!canupLevel())
			{
				NoticeManager.mouseFollowNotify(NotifyCfgData.getNotifyTextByID(7009));
				return ;
			}
			
			var info:HeroData=MainRoleManager.actorInfo;
			if(_state.level>info.totalStat.level)
			{
				NoticeManager.mouseFollowNotify(NotifyCfgData.getNotifyTextByID(7002));
				return ;
			}
			var total:int = BackPackManager.instance.getBagItemsCountById(_itemInfo.cfgId);
			if(total<_itemInfo.itemInfo.num)
			{
				NoticeManager.mouseFollowNotify(NotifyCfgData.getNotifyTextByID(7010));
				return ;
			}
			var msg:CSLostSkillLeveUpMessage = new CSLostSkillLeveUpMessage();
			msg.skillId = _state.skillId;
			SocketConnection.send(msg);
		}
		private var _data:Q_lostskill_open;
		private var _state:SkillStateInfo;
		private var _itemInfo:ClientItemInfo;
		public function updataSkill(data:Q_lostskill_open,state:SkillStateInfo):void
		{
			_state = state;
			_data = data;
			if(state ==null)
			{
				_itemInfo = null;
				_skin.container.visible = false;
				return ;
			}
			_skin.container.visible =true;
			_skin.lb_dengji.text = state.level+"/"+maxLevel.toString();
			refeashData(); 
			
			updataLevelEffect(_skin.currentLevel.skin as Item_shuxing,_state.level);
			updataLevelEffect(_skin.nexttLevel.skin as Item_shuxing,_state.level+1);
			var total:int = BackPackManager.instance.getBagItemsCountById(_itemInfo.cfgId);
			_skin.lb_xiaohao.htmlText = HtmlTextUtil.underLine(_itemInfo.name+"*"+_itemInfo.itemInfo.num+"("+total+")");
			if(_itemInfo.itemInfo.num<=total)
			{
				_skin.lb_xiaohao.color = 0x5DBD37;
			}else{
				_skin.lb_xiaohao.color = 0xd02525;
			}
			TipTargetManager.remove(_skin.lb_xiaohao);
			TipTargetManager.show(_skin.lb_xiaohao,TargetTipsMaker.makeTips(TipType.ITEM_TIP,_itemInfo));
			_skin.isopen.visible = _state.skillId == LostSkillManager.instance().curSkillId;
			_skin.btn_yinyong.visible = _state.skillId != LostSkillManager.instance().curSkillId;
		}
		
		private function updataLevelEffect(content:Item_shuxing,level:int):void
		{
			var currentupdate:Q_lostskill_up = LostSkillUpData.getDatabyIdAndLevel(_state.skillId,level);
			if(currentupdate!=null)
				content.labelDisplay.text  = _data.q_desc.replace("$",LostSkillManager.instance().getSkillValue(_data,currentupdate));
			else
				content.labelDisplay.text = NotifyCfgData.getNotifyTextByID(7009);
		}
		
		private function canupLevel():Boolean
		{
			return _state.level <maxLevel;
		}
		private function refeashData():void
		{
			if(_state==null)
				return ;
			var updata:Q_lostskill_up = LostSkillUpData.getDatabyIdAndLevel(_state.skillId,_state.level);
			var itemInfo:Object = JSONUtil.decode( updata.q_cost)[0];
			var item:ItemInfo = new ItemInfo();
			item.itemModelId = itemInfo["mod"];
			item.num = itemInfo["num"];
			_itemInfo = ItemUtil.convertClientItemInfo(item);
		}
	}
}