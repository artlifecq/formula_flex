package com.rpgGame.appModule.activety.jixiantiaozhan
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.ActivetyDataManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.appModule.activety.boss.BossHurtInfo;
	import com.rpgGame.core.events.ActivityEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.view.ui.tip.vo.DynamicTipData;
	import com.rpgGame.coreData.info.tip.BossHurtTipsData;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.netData.monster.bean.BossDamageInfo;
	import com.rpgGame.netData.monster.message.ResBossDamageInfosToClientMessage;
	
	import gs.TweenMax;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.activety.jixiantiaozhan.JiXianPaiHang;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class JiXianRankPanel extends SkinUIPanel
	{
		private var _skin:JiXianPaiHang;
		
		private const MAX_SHOW_NUM:int=10;
		private var _jixianBossRankItemList:Vector.<JiXianBossRankItem>;
		private var _tipsData:DynamicTipData;
		private var _tipsSetInfo:BossHurtTipsData;
		private var tween:TweenMax;
		private var _myRank:JiXianBossRankItem;
		private var _myHurtData:BossHurtInfo=new BossHurtInfo(0);
		public function JiXianRankPanel()
		{
			_skin=new JiXianPaiHang();
			super(_skin);
			initView();
			setBoxState(true);
		}
		private function initView():void
		{
			_jixianBossRankItemList=new Vector.<JiXianBossRankItem>();
			//boss伤害排名
			for(var i:int=0;i<MAX_SHOW_NUM;i++)
			{
				var item:JiXianBossRankItem=new JiXianBossRankItem();
				item.setPoint(0,i*item.height);
				_jixianBossRankItemList.push(item);
				_skin.container_list.addChild(item);
				item.visible=false;
			}
			_tipsData=new DynamicTipData();
			_tipsSetInfo=new BossHurtTipsData();
			_tipsData.data=_tipsSetInfo;
			_myRank=new JiXianBossRankItem();
			_myRank.x=5;
			_myRank.y=334;
			_skin.contentBox.addChild(_myRank);
			_myRank.setSelf();
			_myHurtData.bossDamageInfo=new BossDamageInfo();
			_myHurtData.bossDamageInfo.playerId=MainRoleManager.serverID;
			_myHurtData.bossDamageInfo.playerName=MainRoleManager.actorInfo.name;
		}
		
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			var actId:int=data;
			_skin.ListItem.customData=actId;
			_tipsSetInfo.rewads=JSONUtil.decode(ActivetyDataManager.jixianVo.qmod.q_kill_rewards);
			_tipsSetInfo.titleRes="ui/app/activety/shijieboss/5.png";
			_myRank.visible=false;
			initEvent();
			setBossKill("");
		}
		
		override public function hide():void
		{
			super.hide();
			TipTargetManager.remove( _skin.uiIcon);
			EventManager.removeEvent(ActivityEvent.UPDATE_JIXIANBOSS_HURT_RANK,updateView);
			EventManager.removeEvent(ActivityEvent.LAST_KILLER,setBossKill);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target.name){
				case "btn_close":
					setBoxState(false);
					break;
				case "btn_open":
					setBoxState(true);
					break;
			}
		}
		
		private function setBoxState(state:Boolean):void
		{
			if(tween){
				tween.kill();
			}
			if(state){
				tween=TweenMax.to(_stateSkin["contentBox"],0.5,{x:-2});
			}else{
				tween=TweenMax.to(_stateSkin["contentBox"],0.5,{x:-1*_stateSkin["contentBox"].width});
			}
			_stateSkin["btn_close"].visible = state;
			_stateSkin["btn_open"].visible = !state;
		}
		
		override public function dispose():void
		{
			super.dispose();
			_tipsData=null;
		}
		
		private function initEvent():void
		{
			EventManager.addEvent(ActivityEvent.UPDATE_JIXIANBOSS_HURT_RANK,updateView);
			TipTargetManager.show( _skin.uiIcon, TargetTipsMaker.makeTips( TipType.SHIJIEBOSS_REWAD_TIP, _tipsData));
			EventManager.addEvent(ActivityEvent.LAST_KILLER,setBossKill);
		}
		
		private function updateView(msg:ResBossDamageInfosToClientMessage):void
		{
			_myHurtData.bossDamageInfo.damage=msg.damage;
			_myHurtData.rank=msg.rank;
			_myHurtData.bossDamageInfo.playerName=MainRoleManager.actorInfo.name;
			if (msg.totalHp!=0) 
			{
				_myHurtData.perDamage=(msg.damage*100/msg.totalHp).toFixed(2);
			}
			else
			{
				_myHurtData.perDamage="0.00";
			}
			var nu:Number=Math.min(msg.damage/msg.totalHp,1);
			var num:int=msg.BossDamageInfos.length;
			for(var i:int=1;i<=MAX_SHOW_NUM;i++){
				if(i<=msg.BossDamageInfos.length)
				{
					_jixianBossRankItemList[i-1].setData(i,msg.BossDamageInfos[i-1],msg.totalHp);
					_jixianBossRankItemList[i-1].visible=true;
				}
				else
				{
					_jixianBossRankItemList[i-1].visible=false;
				}
			}
			_myRank.visible=true;
			_myRank.setData(msg.rank,_myHurtData.bossDamageInfo,msg.totalHp);
		}
		private function setBossKill(killer:String):void
		{
			if (killer!=null&&killer!="") 
			{
				_skin.gKiller.visible=true;
				_skin.gNotKill.visible=false;
				_skin.labKiller.text=killer;
			}
			else
			{
				_skin.gNotKill.visible=true;
				_skin.gKiller.visible=false;
			}
		}
		override protected function onStageResize(sw:int, sh:int):void
		{
			var xx : int, yy : int;
			xx = -2;
			yy = 160;
			this.x = xx;
			this.y = yy;
		}
	}
}
