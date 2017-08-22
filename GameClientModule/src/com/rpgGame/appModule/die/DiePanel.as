package com.rpgGame.appModule.die
{
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.app.sender.SceneSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.appModule.shop.ItemBuyPanelExt;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.coreData.cfg.DieCfgData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.clientConfig.Q_map;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.map.EnumMapType;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.lang.LangQ_BackPack;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.player.message.ResPlayerDieMessage;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.siwangfuhuo.fuhuo_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	/**
	 *死亡面板 
	 * @author dik
	 * 
	 */
	public class DiePanel extends SkinUIPanel
	{
		private var _skin:fuhuo_Skin;
		private var disMsg:ResPlayerDieMessage;
		
		private var openNum:int;
		private var items:Vector.<DieToItem>;
		private var showItem:DieToItem;
		
		private var openTime:int;
		
		private var timer:Timer;
		
		private var currentSeeIndex:int;
		private var maxSeeIndex:int;
		private var tween:TweenLite;
		private var _listContent:ContentList;
		private const FUHUO_ID:int=300;
		
		private var mianfeiX1:int=431;
		private var mianfeiX2:int=307;
		
		private var butX1:int=386;
		private var butX2:int=270;
		
		public function DiePanel()
		{
			_skin=new fuhuo_Skin();
			timer=new Timer(1000);
			super(_skin);
			
			_listContent = new ContentList(600,205);
			this.addChild(_listContent);
			_listContent.x = 50;
			_listContent.y = 150;
			TaskUtil.addLabelEvet(_skin.lbGoumai);
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			EventManager.addEvent(ItemEvent.ITEM_ADD,onFreshItems);
			EventManager.addEvent(ItemEvent.ITEM_REMOVE,onFreshItems);
			EventManager.addEvent(ItemEvent.ITEM_CHANG,onFreshItems);
			
			disMsg=data as ResPlayerDieMessage;
			
			_skin.lbl_msg.color=0xe1201c;
			var date:Date=new Date(disMsg.time*1000);
			
			var mapID : int = SceneSwitchManager.currentMapId;
			var cfg : SceneData = MapDataManager.getMapInfo(mapID);
			var qmap:Q_map=cfg.getData();
			var killer:String;
			switch(qmap.q_map_type){
				case EnumMapType.MAP_TYPE_TOWERS:
					killer=HtmlTextUtil.getTextColor(0x5DBD37,"神秘人");
					break;
				default:
					killer=HtmlTextUtil.getTextColor(0x5DBD37,disMsg.attackername)
					break;
			}
			
			_skin.lbl_msg.htmlText="你被"+killer+"杀死了,("+date.fullYear+"年"+
				(date.month+1)+"月"+date.date+"日  "+TimeUtil.changeTime(date.hours)+":"+TimeUtil.changeTime(date.minutes)+":"+
				TimeUtil.changeTime(date.seconds)+")";
			openNum=DieCfgData.allOpenList.length;
			openTime=disMsg.autoTime;
			/*items=new Vector.<DieToItem>();
			for(var i:int=0;i<5;i++){
			items.push(new DieToItem());
			this._skin.openGrp.addChild(items[i]);
			items[i].x=(items[i].width+8)*i;
			if(i<openNum){
			items[i].update(DieCfgData.allOpenList[i]);
			}else{
			items[i].update(null);
			}
			}
			showItem=items[4];*/
			
			maxSeeIndex=openNum-4;
			currentSeeIndex=0;
			
			timer.reset();
			if(openTime>0){
				timer.repeatCount=openTime;
				timer.addEventListener(TimerEvent.TIMER_COMPLETE,onTimeComplete);
				timer.addEventListener(TimerEvent.TIMER,onTimer);
				timer.start();
			}
			
			EventManager.addEvent(MainPlayerEvent.REVIVE_SUCCESS,hide);
			
			/*---------在多人副本中改变面板-----------*/
			var sceneData:SceneData=MapDataManager.getMapInfo(MainRoleManager.actorInfo.mapID);
			var mapCfg:Q_map=sceneData.getData();
			
			var danyaoNum:int=BackPackManager.instance.getItemCount(300);
			_skin.lbDanyao.text="1/"+danyaoNum;
			if(danyaoNum>0) _skin.lbDanyao.color=StaticValue.BEIGE_TEXT;
			else _skin.lbDanyao.color=StaticValue.RED_TEXT;
			
			switch(mapCfg.q_map_type)
			{
				case EnumMapType.MAP_TYPE_MULTY:
				{
					_skin.lbMianfei.x=mianfeiX2;
					_skin.btn_fuhuodian.x=butX2;
					_skin.btn_yuandi.visible=false;
					_skin.lbGoumai.visible=false;
					_skin.lbDanyao.visible=false;
					break;
				}
					
				default:
				{
					_skin.lbMianfei.x=mianfeiX1;
					_skin.btn_fuhuodian.x=butX1;
					_skin.btn_yuandi.visible=true;
					_skin.lbGoumai.visible=true;
					_skin.lbDanyao.visible=true;
					break;
				}
			}
			this.escExcuteAble=false;
		}
		
		protected function onFreshItems(info:ClientItemInfo=null):void
		{
			if(info.qItem.q_id==300)
			{
				var danyaoNum:int=BackPackManager.instance.getItemCount(300);
				_skin.lbDanyao.text="1/"+danyaoNum;
				if(danyaoNum>0) _skin.lbDanyao.color=StaticValue.BEIGE_TEXT;
				else _skin.lbDanyao.color=StaticValue.RED_TEXT;
			}
		}
		
		protected function onTimer(event:TimerEvent):void
		{
			_skin.btn_fuhuodian.label="复活点("+(openTime-timer.currentCount)+"s)";
		}
		
		protected function onTimeComplete(event:TimerEvent):void
		{
			_skin.btn_fuhuodian.label="复活点("+(openTime-timer.currentCount)+"s)";
			this.hide();
		}
		
		override public function hide():void
		{
			super.hide();
			EventManager.removeEvent(ItemEvent.ITEM_ADD,onFreshItems);
			EventManager.removeEvent(ItemEvent.ITEM_REMOVE,onFreshItems);
			EventManager.removeEvent(ItemEvent.ITEM_CHANG,onFreshItems);
			EventManager.removeEvent(MainPlayerEvent.REVIVE_SUCCESS,hide);
			timer.removeEventListener(TimerEvent.TIMER_COMPLETE,onTimeComplete);
			timer.removeEventListener(TimerEvent.TIMER,onTimer);
			timer.stop();
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if( target.name=="btnClose"||target.name=="closeBtn"){
				SceneSender.reqReviveRole();
				return;
			}
			BackPackManager.instance.getBagItemsCountById(FUHUO_ID);
			
			switch(target){
				case _skin.btn_yuandi:
					if(BackPackManager.instance.getBagItemsCountById(FUHUO_ID)>0){
						SceneSender.reqReviveLocalRole(FUHUO_ID,1);
						this.hide();
					}else{
						var alertSet:AlertSetInfo=new AlertSetInfo(LangQ_BackPack.ITEM_less_1);
						GameAlert.showAlert(alertSet,alertToBuy);
					}
					break;
				case _skin.lbGoumai:
					showByFuHuo();
					break;
				case _skin.btn_fuhuodian:
					SceneSender.reqReviveRole();
					this.hide();
					break;
				/*case _skin.btn_prev:
				if(tween){
				tween.complete();
				}
				currentSeeIndex++;
				updateSeeItem(false);
				break;
				case _skin.btn_next:
				if(tween){
				tween.complete();
				}
				currentSeeIndex--;
				updateSeeItem(true);
				break;*/
			}
		}
		
		private function alertToBuy(alert:GameAlert):void
		{
			if(alert.clickType==AlertClickTypeEnum.TYPE_SURE){
				showByFuHuo();
			}			
		}
		
		private function showByFuHuo():void
		{
			//			this.hide();
			ItemBuyPanelExt.buyItemByModelId(300);
		}
		
		/*private function updateSeeItem(isNext:Boolean,showAni:Boolean=true):void
		{
		_skin.btn_prev.visible=true;
		_skin.btn_next.visible=true;
		if(currentSeeIndex==0){
		_skin.btn_next.visible=false;
		}
		if(currentSeeIndex==maxSeeIndex){
		GrayFilter.gray(_skin.btn_prev);
		_skin.btn_prev.visible=false;
		}
		
		if(!showAni){
		return;
		}
		
		if(isNext){
		showItem.x=items[0].x-8-items[0].width;
		showItem.update(DieCfgData.allOpenList[currentSeeIndex]);
		tween=TweenLite.to(_skin.openGrp,0.5,{x:_skin.openGrp.x+items[0].width+8,onComplete:onTween});
		}else{
		showItem.x=items[3].x+items[0].width+8;
		showItem.update(DieCfgData.allOpenList[currentSeeIndex+3]);
		tween=TweenLite.to(_skin.openGrp,0.5,{x:_skin.openGrp.x-items[0].width-8,onComplete:onTween});
		}
		}
		
		private function onTween():void
		{
		_skin.openGrp.x=46;
		for(var i:int=0;i<4;i++){
		items[i].update(DieCfgData.allOpenList[currentSeeIndex+i]);
		}
		tween.kill();
		tween=null;
		}*/
	}
}