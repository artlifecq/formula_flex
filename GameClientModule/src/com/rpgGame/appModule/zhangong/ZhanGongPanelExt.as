package com.rpgGame.appModule.zhangong
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.ZhanGongManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.app.utils.FightValueUtil;
	import com.rpgGame.appModule.zhangong.render.BossItemSelectCellRender;
	import com.rpgGame.appModule.zhangong.render.MapItemSelectCellRender;
	import com.rpgGame.core.events.ZhanGongEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.ZhanGongData;
	import com.rpgGame.netData.zhangong.message.SCMeritoriousUpgradeResultMessage;
	
	import away3d.events.Event;
	
	import feathers.controls.List;
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.Scroller;
	import feathers.controls.UINumber;
	import feathers.data.ListCollection;
	import feathers.events.FeathersEventType;
	
	import gs.TimelineLite;
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.beibao.zhangong.ZhanGong_Skin;
	
	public class ZhanGongPanelExt extends ViewUI
	{
		private var _skin:ZhanGong_Skin;
		
		private const MaxShowNum:int=6;
		private var _mapItemList:Vector.<MapItem>=new Vector.<MapItem>();
		private var _bossItemList:Vector.<BossItem>=new Vector.<BossItem>();
		
		private var _nowSelectMapItem:MapItem;
		
		private var changeList:Array;
		private var changNumber:UINumber;
		
		private var _isFirst:Boolean=false;
		public function ZhanGongPanelExt()
		{
			_skin=new ZhanGong_Skin();
			super(_skin);
			
			var list:List=_skin.ListMap;
			list.itemRendererFactory = creatMapItemCell;
			list.clipContent = true;
//			list.scrollBarDisplayMode = "fixed";
			list.verticalScrollBarPosition = "right";
			list.scrollBarDisplayMode=ScrollBarDisplayMode.ALWAYS_VISIBLE;
			list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			list.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			list.padding=0;
			
			//			var list1:List=_skin.ListBoss;
			//			list1.itemRendererFactory = creatBossItemCell;
			//			list1.clipContent = true;
			//			list1.scrollBarDisplayMode = "fixed";
			//			list1.verticalScrollBarPosition = "right";
			//			list1.horizontalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			//			list1.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			//			list1.padding=0;
			
			initView();
		}
		
		private function initView():void
		{
			_isFirst=true;
			_skin.num_lv.visible=false;
			_skin.uiUp.visible=false;
			_skin.ListMap.addEventListener(FeathersEventType.CREATION_COMPLETE,toShouShow);
			var mapItemList:Vector.<int>=ZhanGongData.getMapItemLvList();
			_skin.ListMap.dataProvider=new ListCollection(mapItemList);
			//初始怪物小面板
			var bossitem:BossItem;
			for(var i:int=0;i<MaxShowNum;i++)
			{
				bossitem=new BossItem();
				bossitem.x=(i%3)*(bossitem.width+8)+10;
				bossitem.y=(int(i/3))*(bossitem.height+4)+5;
				_bossItemList.push(bossitem);
				_skin.bossItemRongQi.addChild(bossitem);
			}
		}
		
		override public function show(data:Object=null):void
		{
			super.onShow();
			initEvent();
			showPower();
			if(!_isFirst)
				showMapItemByIndex(0);
		}
		
		override public function hide():void
		{
			clearEvent();
		}
		
		private function initEvent():void
		{
			_skin.btnPrev.addEventListener(Event.TRIGGERED,leftHandler);
			_skin.btnNext.addEventListener(Event.TRIGGERED,rightHandler);
			EventManager.addEvent(ZhanGongEvent.MAPITEM_SELECT,selecteSpell);
			EventManager.addEvent(ZhanGongEvent.BOSSITEN_SHOW,showNextAtt);
			EventManager.addEvent(ZhanGongEvent.BOSSITEN_CLOSE,closeNextAtt);
			EventManager.addEvent(ZhanGongEvent.BOSSITEM_CHANGE,updatePower);
		}
		
		private function clearEvent():void
		{
			_skin.btnPrev.removeEventListener(Event.TRIGGERED,leftHandler);
			_skin.btnNext.removeEventListener(Event.TRIGGERED,rightHandler);
			EventManager.removeEvent(ZhanGongEvent.MAPITEM_SELECT,selecteSpell);
			EventManager.removeEvent(ZhanGongEvent.BOSSITEN_SHOW,showNextAtt);
			EventManager.removeEvent(ZhanGongEvent.BOSSITEN_CLOSE,closeNextAtt);
			EventManager.removeEvent(ZhanGongEvent.BOSSITEM_CHANGE,updatePower);
		}
		
		private function leftHandler(e:Event):void
		{
			if(yeqian>0)
			{
				yeqian--;			
				showBossItem(_nowSelectMapItem.level,yeqian);
			}
		}
		
		private function rightHandler(e:Event):void
		{
			if(yeqian<maxNum)
			{
				yeqian++;
				showBossItem(_nowSelectMapItem.level,yeqian);
			}
		}
		
		private function updateBtnState():void
		{
			if(yeqian==0) _skin.btnPrev.visible=false;
			else  _skin.btnPrev.visible=true;
			if((yeqian+1)>=maxNum) _skin.btnNext.visible=false;
			else _skin.btnNext.visible=true;
		}
		
		private function showPower(bool:Boolean=false):void
		{
			if(bool)
			{
				var nowFight:int=ZhanGongManager.getPower();
				var change:int=nowFight-_skin.Num_zhandouli.number;
				changeList=getChangeList(change);		
				var  timeLine : TimelineLite = new TimelineLite();
				for(var i:int=0;i<changeList.length;i++){
					timeLine.append(TweenLite.delayedCall(0.1,delayTween,[changeList[i]]));
				}
			}
			else
			{
				//				_skin.Num_zhandouli.label=ZhanGongManager.getPower().toString();
				_skin.Num_zhandouli.number=ZhanGongManager.getPower();
			}
			updateShuXing();
		}
		
		private function delayTween(v:int):void
		{
			_skin.Num_zhandouli.number=v;
		}
		
		private function getChangeList(changeV:int):Array
		{
			var v:int=	Math.abs(changeV);
			var per:int;
			var i:int=5;
			while(i>0){
				per=Math.floor(v/i);
				if(per!=0){
					break;
				}
				i--;
			}
			if(changeV<0){
				per*=-1;
			}
			
			var num:int=i+1;
			var list:Array=[];
			for(i=1;i<num;i++){
				list.push(_skin.Num_zhandouli.number+i*per);
			}
			return list;
		}
		
		
		private function toShouShow(e:Event):void
		{
			if(_isFirst)
			{
				showMapItemByIndex(0);
				_isFirst=false;
			}
		}
		
		private function updateShuXing():void
		{
			var tipStr:String=ZhanGongManager.getAllAttrbut();
			//			tipStr=LanguageConfig.replaceStr(tipStr,[CheatsCfg.getCheats(effectArr[0]).q_name,CharAttributeType.getCNName(effectArr[2]),(effectArr[3]/10000).toFixed(2)]);
			TipTargetManager.show( _skin.lb_shuxing, TargetTipsMaker.makeSimpleTextTips(tipStr));
		}
		
		/**
		 * 依据索引显示相应的选项
		 * */
		private function showMapItemByIndex(index:int):void
		{
			if(_mapItemList!=null&&_mapItemList.length>0&&_mapItemList.length>index)
			{
				_mapItemList[index].setBtnState();
				_nowSelectMapItem=_mapItemList[index];
			}
		}
		
		/**
		 * 依据等级显示相应的类型的怪物
		 * */
		private var yeqian:int=0;
		private var maxNum:int=0;
		private function showBossItemByLv(lv:int):void
		{
			yeqian=0;
			showBossItem(lv,yeqian);
		}
		
		private function showBossItem(lv:int,yeqian:int):void
		{
			var list:Vector.<int>=ZhanGongData.getBossItemTypeList(lv,yeqian);
			maxNum=ZhanGongData.getMaxYeQian();		
			updateBtnState();
			for(var i:int=0;i<_bossItemList.length;i++)
			{
				if(i<list.length)
				{
					_bossItemList[i].setData(list[i]);
					_bossItemList[i].visible=true;
				}
				else
				{
					_bossItemList[i].clearData();
					_bossItemList[i].visible=false;
				}
			}
		}
		
		private function creatMapItemCell():MapItemSelectCellRender
		{
			var render:MapItemSelectCellRender=new MapItemSelectCellRender();
			var item:MapItem=render.mapItem;
			_mapItemList.push(item);
			return render;
		}
		
		private function creatBossItemCell():BossItemSelectCellRender
		{
			return new BossItemSelectCellRender();
		}
		
		private function selecteSpell(mapitem:MapItem):void
		{
			if(_nowSelectMapItem!=null&&_nowSelectMapItem.level==mapitem.level) return;
			_nowSelectMapItem=mapitem;
			showBossItemByLv(_nowSelectMapItem.level);			
		}
		
		private function showNextAtt(str:String):void
		{
			var arr:Array=str.split('_');
			var type:int=parseInt(arr[0]);
			var num:int=parseInt(arr[1]);
			var has:HashMap=new HashMap();
			has.put(type,num);
			var pow:int=FightValueUtil.calFightPowerByHash(has,MainRoleManager.actorInfo.job);
			_skin.num_lv.label=pow.toString();
			_skin.num_lv.visible=true;
			_skin.uiUp.visible=true;
		}
		
		private function closeNextAtt():void
		{
			_skin.num_lv.visible=false;
			_skin.uiUp.visible=false;
		}
		
		private function updatePower(msg:SCMeritoriousUpgradeResultMessage):void
		{
			if(msg.flag==1)
			{
				showPower(true);
			}
		}
	}
}