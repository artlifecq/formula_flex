package com.rpgGame.appModule.activety.jixiantiaozhan
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.ActivetyDataManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.appModule.activety.boss.BossHurtInfo;
	import com.rpgGame.core.events.ActivityEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.view.ui.tip.vo.DynamicTipData;
	import com.rpgGame.coreData.info.tip.BossHurtTipsData;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.netData.monster.message.ResBossDamageInfosToClientMessage;
	
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.data.ListCollection;
	
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
		}
		
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			var actId:int=data;
			_skin.ListItem.customData=actId;
			_tipsSetInfo.rewads=JSONUtil.decode(ActivetyDataManager.jixianVo.qmod.q_kill_rewards);
			_tipsSetInfo.titleRes="ui/app/activety/shijieboss/5.png";
			_skin.myHurt.text="我的伤害:";
			_skin.myRank.text="我的排名:";
			initEvent();
		}
		
		override public function hide():void
		{
			super.hide();
			TipTargetManager.remove( _skin.uiIcon);
			EventManager.removeEvent(ActivityEvent.UPDATE_JIXIANBOSS_HURT_RANK,updateView);
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
		}
		
		private function updateView(msg:ResBossDamageInfosToClientMessage):void
		{
			var nu:Number=Math.min(msg.damage/msg.totalHp,1);
			_skin.myHurt.text="我的伤害:"+msg.damage+"("+(nu*100).toFixed(1)+"%)";
			_skin.myRank.text="我的排名:"+msg.rank;
			var num:int=msg.BossDamageInfos.length;
			for(var i:int=0;i<MAX_SHOW_NUM;i++){
				if(i<msg.BossDamageInfos.length)
				{
					_jixianBossRankItemList[i].setData(i,msg.BossDamageInfos[i],msg.totalHp);
					_jixianBossRankItemList[i].visible=true;
				}
				else
				{
					_jixianBossRankItemList[i].visible=false;
				}
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
