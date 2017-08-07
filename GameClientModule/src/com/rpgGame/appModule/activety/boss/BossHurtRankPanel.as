package com.rpgGame.appModule.activety.boss
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.ActivetyDataManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.events.ActivityEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.view.ui.tip.vo.DynamicTipData;
	import com.rpgGame.coreData.cfg.active.ActivetyCfgData;
	import com.rpgGame.coreData.cfg.active.BossActInfo;
	import com.rpgGame.coreData.info.tip.BossHurtTipsData;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.netData.monster.message.ResBossDamageInfosToClientMessage;
	
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.data.ListCollection;
	
	import gs.TweenMax;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.activety.shijieboss.ShangHaiPaiHang;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	/**
	 *伤害排行 
	 * @author dik
	 * 
	 */
	public class BossHurtRankPanel extends SkinUIPanel
	{
		private var _skin:ShangHaiPaiHang;
		private var _tipsData:DynamicTipData;
		private var _tipsSetInfo:BossHurtTipsData;
		private var tween:TweenMax;
		
		public function BossHurtRankPanel()
		{
			_skin=new ShangHaiPaiHang();
			super(_skin);
			initView();
			setBoxState(true);
		}
		
		private function initView():void
		{
			_skin.ListItem.itemRendererType=BossHurtItemRender;
			_skin.ListItem.scrollBarDisplayMode = ScrollBarDisplayMode.NONE;
			_skin.ListItem.dataProvider=new ListCollection();
			for(var i:int=1;i<11;i++){
				_skin.ListItem.dataProvider.addItem(new BossHurtInfo(i));
			}
			_tipsData=new DynamicTipData();
			_tipsSetInfo=new BossHurtTipsData();
			_tipsData.data=_tipsSetInfo;
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			var actId:int=data;
			_skin.ListItem.customData=actId;
			if(actId==25)
			{
				_tipsSetInfo.rewads=JSONUtil.decode(ActivetyDataManager.jixianVo.qmod.q_kill_rewards);
			}
			else{
			var actInfo:BossActInfo=ActivetyCfgData.getActInfoById(actId) as BossActInfo;
			_tipsSetInfo.rewads=JSONUtil.decode(actInfo.worldBossCfg.q_kill_rewards);
			
			}
			_tipsSetInfo.titleRes="ui/app/activety/shijieboss/5.png";
			_skin.myHurt.text="我的伤害:";
			_skin.myRank.text="我的排名:";
			for(var i:int=1;i<11;i++){
				var info:BossHurtInfo=_skin.ListItem.dataProvider.getItemAt(i) as BossHurtInfo;
				info.bossDamageInfo=null;
			}
			_skin.ListItem.dataProvider.updateAll();
			
			initEvent();
		}
		
		override public function hide():void
		{
			super.hide();
			TipTargetManager.remove( _skin.uiIcon);
			EventManager.removeEvent(ActivityEvent.UPDATE_BOSS_HURT_RANK,updateView);
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
			EventManager.addEvent(ActivityEvent.UPDATE_BOSS_HURT_RANK,updateView);
			TipTargetManager.show( _skin.uiIcon, TargetTipsMaker.makeTips( TipType.SHIJIEBOSS_REWAD_TIP, _tipsData));
		}
		
		private function updateView(msg:ResBossDamageInfosToClientMessage):void
		{
			_skin.myHurt.text="我的伤害:"+msg.damage;
			_skin.myRank.text="我的排名:"+msg.rank;
			var num:int=msg.BossDamageInfos.length;
			for(var i:int=0;i<10;i++){
				var info:BossHurtInfo=_skin.ListItem.dataProvider.getItemAt(i) as BossHurtInfo;
				if(i<num){
					info.bossDamageInfo=msg.BossDamageInfos[i];
					info.perDamage=(info.bossDamageInfo.damage*100/msg.totalHp).toFixed(2);
				}
			}
			_skin.ListItem.dataProvider.updateAll();
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